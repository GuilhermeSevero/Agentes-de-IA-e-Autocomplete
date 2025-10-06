// kilocode-proxy.js
const http = require('http');
const https = require('https');

const PORT = 8080;

const server = http.createServer((req, res) => {
  const targetHeaders = {
    ...req.headers,
    'user-agent': 'Kilo-Code/4.84.0',
    'host': 'kilocode.ai',
    'HTTP-Referer': 'https://kilocode.ai',
    'X-Title': 'Kilo Code',
    'X-KiloCode-Version': '4.84.0',
  };

  const options = {
    hostname: 'kilocode.ai',
    port: 443,
    path: req.url,
    method: req.method,
    headers: targetHeaders,
  };

  const proxyReq = https.request(options, (proxyRes) => {
    res.statusCode = proxyRes.statusCode;
    Object.keys(proxyRes.headers).forEach(key => {
      res.setHeader(key, proxyRes.headers[key]);
    });
    proxyRes.pipe(res);
  });

  req.pipe(proxyReq);
});

server.listen(PORT, () => {
  console.log(`Proxy running on http://localhost:${PORT}`);
});
