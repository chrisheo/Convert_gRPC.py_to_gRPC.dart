import 'package:grpc/grpc.dart';

import 'hello_grpc.pbgrpc.dart';


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

  final stub = MyServiceClient(channel);

  final request = MyNumber(value: 4);

  try {
    final response = await stub.myFunction(
      request,
      options: CallOptions(compression: const GzipCodec()),
    );
    print('gRPC result: ${response.value}');
  } catch (e) {
    print('Caught error: $e');
  }
  await channel.shutdown();
}