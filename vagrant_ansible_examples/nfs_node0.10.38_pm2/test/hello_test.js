var hippie = require('hippie');
var server = require('../utils/server');

describe('Server', function () {
  describe('/hello endpoint', function () {
    it('should answer with result', function (done) {
      hippie(server)
        .json()
        .get('/hello/there')
        .expectStatus(200)
        .end(function(err, res, body) {
          if (err) throw err;
          done();
        });
    });
  });
});
