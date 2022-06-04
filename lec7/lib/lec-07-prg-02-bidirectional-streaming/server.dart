import 'package:grpc/grpc.dart';

import 'bidirectional.pbgrpc.dart';


class BidirectionalService extends BidirectionalServiceBase {
  @override
  Stream<Message> getServerResponse(ServiceCall call, Stream request) async* {
    print('Server processing gRPC bidirectional streaming.');
    await for (Message message in request) {
      yield message;
    }
  }

}

Future<void> main(List<String> args) async {

  final server = Server(
    [BidirectionalService()],
    const <Interceptor>[],
    CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
  );
  await server.serve(port: 50051);
  print('Server listening on port ${server.port}...');
}