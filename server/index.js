const Inert = require('@hapi/inert');
const Hapi = require('@hapi/hapi');
const server = new Hapi.Server({
  port: 3000,
});

const provision = async () => {
  await server.register(Inert);

  server.ext('onPreResponse', (request, reply) => {
    if (request.response.isBoom && !request.response.isServer) {
      return reply.redirect('/');
    }
    return reply.continue;
  });

  server.route({
    method: 'GET',
    path: '/',
    handler: (request, reply) => {
      return reply.file('../public/index.html', {confine: false});
    }
  });

  server.route({
    method: 'GET',
    path: '/{file*}',
    handler: (request, reply) => {
      const parameters = request.params.file.split('/');
      let path = '../public/';
      parameters.forEach((value) => {
        path += '/' + encodeURIComponent(value);
      });
      return reply.file(path, {confine: false});
    }
  });

  await server.start();

  console.log('Server running at port 3000');
}

provision();
