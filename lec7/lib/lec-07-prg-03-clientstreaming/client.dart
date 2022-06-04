import 'package:grpc/grpc.dart';

import 'clientstreaming.pbgrpc.dart';


Message make_messsage(String message) {
  return Message(message: message);
}

Stream<Message> generate_messages() async* {
  List<Message> messages = [
    make_messsage("message #1"),
    make_messsage("message #2"),
    make_messsage("message #3"),
    make_messsage("message #4"),
    make_messsage("message #5"),
  ];
  for (var msg in messages) {
    print("[client to server] ${msg.message}");
    yield msg;
  }}

send_message(ClientStreamingClient stub)  async {
  var response = await stub.getServerResponse(generate_messages());
  print("[server to client] ${response.value}");

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

  final stub = ClientStreamingClient(channel);

  send_message(stub);
}