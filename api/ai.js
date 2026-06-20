export default async function handler(req, res) {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'POST, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type');

  if (req.method === 'OPTIONS') return res.status(200).end();
  if (req.method !== 'POST') return res.status(405).json({ error: 'Method not allowed' });

  const { provider, apiKey, model, endpoint, messages, systemPrompt } = req.body || {};

  if (!apiKey) return res.status(400).json({ error: 'API key is required' });
  if (!messages || !messages.length) return res.status(400).json({ error: 'Messages required' });

  try {
    let content = '';

    if (provider === 'claude') {
      const body = {
        model: model || 'claude-sonnet-4-6',
        max_tokens: 4096,
        messages: messages.map(m => ({ role: m.role, content: m.content }))
      };
      if (systemPrompt) body.system = systemPrompt;

      const resp = await fetch('https://api.anthropic.com/v1/messages', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'x-api-key': apiKey,
          'anthropic-version': '2023-06-01'
        },
        body: JSON.stringify(body)
      });

      if (!resp.ok) {
        const err = await resp.json().catch(() => ({}));
        return res.status(resp.status).json({ error: err.error?.message || 'Claude API error' });
      }

      const data = await resp.json();
      content = data.content?.[0]?.text || '';

    } else {
      const targetEndpoint = (provider === 'custom' && endpoint)
        ? endpoint
        : 'https://api.openai.com/v1/chat/completions';

      const oaiMessages = [];
      if (systemPrompt) oaiMessages.push({ role: 'system', content: systemPrompt });
      messages.forEach(m => oaiMessages.push({ role: m.role, content: m.content }));

      const resp = await fetch(targetEndpoint, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': `Bearer ${apiKey}`
        },
        body: JSON.stringify({
          model: model || 'gpt-4o',
          messages: oaiMessages,
          max_tokens: 4096
        })
      });

      if (!resp.ok) {
        const err = await resp.json().catch(() => ({}));
        return res.status(resp.status).json({ error: err.error?.message || 'API error' });
      }

      const data = await resp.json();
      content = data.choices?.[0]?.message?.content || '';
    }

    return res.status(200).json({ content });

  } catch (err) {
    return res.status(500).json({ error: err.message || 'Internal server error' });
  }
}
