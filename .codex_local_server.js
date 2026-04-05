const http = require('http');
const fs = require('fs');
const path = require('path');
const root = path.resolve('build/web');
const mime = {'.html':'text/html','.js':'application/javascript','.css':'text/css','.json':'application/json','.png':'image/png','.jpg':'image/jpeg','.jpeg':'image/jpeg','.svg':'image/svg+xml','.wasm':'application/wasm','.woff':'font/woff','.woff2':'font/woff2','.ttf':'font/ttf','.otf':'font/otf'};
http.createServer((req,res)=>{
  let reqPath = decodeURIComponent(req.url.split('?')[0]);
  if (reqPath === '/') reqPath = '/index.html';
  let filePath = path.join(root, reqPath);
  if (!filePath.startsWith(root)) { res.statusCode = 403; return res.end('Forbidden'); }
  fs.stat(filePath, (err, stat) => {
    if (!err && stat.isDirectory()) filePath = path.join(filePath, 'index.html');
    fs.readFile(filePath, (readErr, data) => {
      if (readErr) {
        fs.readFile(path.join(root, 'index.html'), (spaErr, spaData) => {
          if (spaErr) { res.statusCode = 404; return res.end('Not found'); }
          res.setHeader('Content-Type', 'text/html');
          res.end(spaData);
        });
        return;
      }
      res.setHeader('Content-Type', mime[path.extname(filePath).toLowerCase()] || 'application/octet-stream');
      res.end(data);
    });
  });
}).listen(8080, '127.0.0.1');
setInterval(() => {}, 1 << 30);
