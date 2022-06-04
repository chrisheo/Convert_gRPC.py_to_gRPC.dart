///
//  Generated code. Do not modify.
//  source: bidirectional.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'bidirectional.pb.dart' as $0;
export 'bidirectional.pb.dart';

class BidirectionalClient extends $grpc.Client {
  static final _$getServerResponse = $grpc.ClientMethod<$0.Message, $0.Message>(
      '/bidirectional.Bidirectional/GetServerResponse',
      ($0.Message value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Message.fromBuffer(value));

  BidirectionalClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseStream<$0.Message> getServerResponse(
      $async.Stream<$0.Message> request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$getServerResponse, request, options: options);
  }
}

abstract class BidirectionalServiceBase extends $grpc.Service {
  $core.String get $name => 'bidirectional.Bidirectional';

  BidirectionalServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Message, $0.Message>(
        'GetServerResponse',
        getServerResponse,
        true,
        true,
        ($core.List<$core.int> value) => $0.Message.fromBuffer(value),
        ($0.Message value) => value.writeToBuffer()));
  }

  $async.Stream<$0.Message> getServerResponse(
      $grpc.ServiceCall call, $async.Stream<$0.Message> request);
}
