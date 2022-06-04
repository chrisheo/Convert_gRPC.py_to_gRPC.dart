import 'package:grpc/grpc.dart';

import 'serverstreaming.pbgrpc.dart';



recv_message(stub) async {
  var request = Number(value: 5);
  var responses = stub.getServerResponse(request);
  await for (Message response in responses) {
    print("[server to client] ${response.message}");
  }
}

Future<void> main(List<String> args) async {

  final channel = ClientChannel(
    'localhost',
    port: 50051,
    options: ChannelOptions(
      credentials: ChannelCredentials.insecure(),
      codecRegistry:
      CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
    ),
  );

  final stub = ServerStreamingClient(channel);
  recv_message(stub);
}