// Process
process.on('uncaughtException', function(err) {
  console.error('Exception: ', err.message);
  return;
});

var node_version = process.version.slice(1).split('.')
if (node_version[0]!=0 || node_version[1]!=10) throw new Error('Invalid Node version. Must run version v0.10')

// Server
var server = require('./utils/server')

server.listen(3001);
