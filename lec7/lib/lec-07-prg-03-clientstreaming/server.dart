import 'package:grpc/grpc.dart';

import 'clientstreaming.pbgrpc.dart';


class ClientStreamingServicer extends ClientStreamingServiceBase {
  @override
  Future<Number> getServerResponse(ServiceCall call, Stream<Message> request) async {
    print('Server processing gRPC client-streaming.');
    int count = 0;
    await for (var message in request) {
      count++;
    }
    return Number(value: count);
  }


}

Future<void> main(List<String> args) async {

  final server = Server(
    [ClientStreamingServicer()],
    const <Interceptor>[],
    CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
  );
  await server.serve(port: 50051);
  print('Server listening on port ${server.port}...');
}