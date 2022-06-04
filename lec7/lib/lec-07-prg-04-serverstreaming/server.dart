import 'package:grpc/grpc.dart';

import 'serverstreaming.pbgrpc.dart';

Message make_messsage(String message) {
  return Message(message: message);
}

class BidirectionalService extends ServerStreamingServiceBase {
  @override
  Stream<Message> getServerResponse(ServiceCall call, Number request) async* {
    //request.value만큼 출력
    List<Message> messages = [
      make_messsage("message #1"),
      make_messsage("message #2"),
      make_messsage("message #3"),
      make_messsage("message #4"),
      make_messsage("message #5"),
    ];
    print('Server processing gRPC server-streaming ${request.value}');
    for (var message in messages) {
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
  print('Starting server. Listening on port 50051.');
  await server.serve(port: 50051);
}