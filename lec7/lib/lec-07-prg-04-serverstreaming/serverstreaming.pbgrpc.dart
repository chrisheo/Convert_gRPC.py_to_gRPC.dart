///
//  Generated code. Do not modify.
//  source: serverstreaming.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'serverstreaming.pb.dart' as $0;
export 'serverstreaming.pb.dart';

class ServerStreamingClient extends $grpc.Client {
  static final _$getServerResponse = $grpc.ClientMethod<$0.Number, $0.Message>(
      '/serverstreaming.ServerStreaming/GetServerResponse',
      ($0.Number value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Message.fromBuffer(value));

  ServerStreamingClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseStream<$0.Message> getServerResponse($0.Number request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$getServerResponse, $async.Stream.fromIterable([request]),
        options: options);
  }
}

abstract class ServerStreamingServiceBase extends $grpc.Service {
  $core.String get $name => 'serverstreaming.ServerStreaming';

  ServerStreamingServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Number, $0.Message>(
        'GetServerResponse',
        getServerResponse_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.Number.fromBuffer(value),
        ($0.Message value) => value.writeToBuffer()));
  }

  $async.Stream<$0.Message> getServerResponse_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Number> request) async* {
    yield* getServerResponse(call, await request);
  }

  $async.Stream<$0.Message> getServerResponse(
      $grpc.ServiceCall call, $0.Number request);
}
