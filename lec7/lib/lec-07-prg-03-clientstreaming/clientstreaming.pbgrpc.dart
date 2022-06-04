///
//  Generated code. Do not modify.
//  source: clientstreaming.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'clientstreaming.pb.dart' as $0;
export 'clientstreaming.pb.dart';

class ClientStreamingClient extends $grpc.Client {
  static final _$getServerResponse = $grpc.ClientMethod<$0.Message, $0.Number>(
      '/clientstreaming.ClientStreaming/GetServerResponse',
      ($0.Message value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Number.fromBuffer(value));

  ClientStreamingClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.Number> getServerResponse(
      $async.Stream<$0.Message> request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$getServerResponse, request, options: options)
        .single;
  }
}

abstract class ClientStreamingServiceBase extends $grpc.Service {
  $core.String get $name => 'clientstreaming.ClientStreaming';

  ClientStreamingServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Message, $0.Number>(
        'GetServerResponse',
        getServerResponse,
        true,
        false,
        ($core.List<$core.int> value) => $0.Message.fromBuffer(value),
        ($0.Number value) => value.writeToBuffer()));
  }

  $async.Future<$0.Number> getServerResponse(
      $grpc.ServiceCall call, $async.Stream<$0.Message> request);
}
