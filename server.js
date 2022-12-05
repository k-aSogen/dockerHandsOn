const express = require('express');

const PORT = 3000;
const HOST = '0.0.0.0';

// Hello World出力
const app = express();
app.get('/', (req, res) => {
  res.send('Hello World');
});

// 出力先のポート指定
app.listen(PORT, HOST);