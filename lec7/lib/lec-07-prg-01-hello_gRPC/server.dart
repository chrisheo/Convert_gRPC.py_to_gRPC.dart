import 'package:grpc/grpc.dart';
import 'package:lec7/lec-07-prg-01-hello_gRPC/hello_grpc.dart';
import 'package:lec7/lec-07-prg-01-hello_gRPC/hello_grpc.pbgrpc.dart';

class MyServiceServicer extends MyServiceBase {
  @override
  Future<MyNumber> myFunction(ServiceCall call, MyNumber request) async {
    final response = MyNumber();
    response.value = my_func(request.value);
    return response;
  }
  
}

Future<void> main(List<String> args) async {

  final server = Server(
    [MyServiceServicer()],
    const <Interceptor>[],
    CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
  );
  await server.serve(port: 50051);
  print('Server listening on port ${server.port}...');
}