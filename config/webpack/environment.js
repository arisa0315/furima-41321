const { environment } = require('@rails/webpacker')

// 不要なプロパティを完全に削除
environment.config.delete('node.dgram');
environment.config.delete('node.fs');
environment.config.delete('node.net');
environment.config.delete('node.tls');
environment.config.delete('node.child_process');

// 必要な設定のみを残す
environment.config.set('node', {
  global: true,
  __filename: false,
  __dirname: false,
})

module.exports = environment;
