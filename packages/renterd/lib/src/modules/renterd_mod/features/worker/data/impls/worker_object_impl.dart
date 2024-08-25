import 'dart:convert';
import 'dart:io';

import 'package:injectable/injectable.dart';
import '../../../../../../shared/services/http/requests/http_get_request.dart';
import '../../../../../../shared/services/http/requests/http_update_request.dart';

import '../../../../../../shared/services/http/apis/renterd/bus/object_api.dart';
import '../abstract/worker_object_abst.dart';

/// Project : [Renterd's Package]
/// Description : This file contains these Functionnalities [uploadAnObject]
/// Author : [CotradeChain]
/// onCreated : 20/07/2023
/// onUpadted : #
/// AuthorCode : James Brel

@LazySingleton(as: WorkerObjectAbst)
class WorkerObjectImpl implements WorkerObjectAbst {
  /// Note : This Function whose Returns the current object of the bus like var

  @override
  Future<Map<String, dynamic>> uploadAnObject({
    String? username,
    required String password,
    required String bucketName,
    required String fileName,
    required File file,
    required String serverAddress,
  }) async {
    var _response = await HttpUpdateRequest.put(
      api: ObjectApi.uploadTheObject(
        serverAddress,
        bucketName,
        fileName,
      ),
      headers: {
        HttpHeaders.contentTypeHeader: "application/octet-stream",
        HttpHeaders.authorizationHeader:
            "Basic ${base64Encode(utf8.encode('$username:$password'))}"
      },
      content: await file.readAsBytes(),
    );

    // await http.put(
    //   Uri.parse(
    //     ObjectApi.uploadTheObject(
    //       serverAddress,
    //       bucketName,
    //       fileName,
    //     ),
    //   ),
    //   headers: {
    //     HttpHeaders.contentTypeHeader: "application/octet-stream",
    //     HttpHeaders.authorizationHeader:
    //         "Basic ${base64Encode(utf8.encode('$username:$password'))}"
    //   },
    //   body: await file.readAsBytes(),
    // );

    return _response;
  }

  /// Note : This Function whose Returns the current object of the bus like var
  @override
  Future<Map<String, dynamic>> downloadTheObject({
    String? username,
    required String password,
    required String serverAddress,
    required String bucketName,
    required String fileName,
  }) async {
    var _response = await HttpGetRequest.get(
      api: ObjectApi.downloadTheObject(serverAddress, bucketName, fileName),
      headers: {
        HttpHeaders.contentTypeHeader: "application/octet-stream",
        HttpHeaders.authorizationHeader:
            "Basic ${base64Encode(utf8.encode('$username:$password'))}"
      },
    );

    // await http.get(
    //   Uri.parse(
    //     ObjectApi.downloadTheObject(serverAddress, bucketName, fileName),
    //   ),
    //   headers: {
    //     HttpHeaders.contentTypeHeader: "application/octet-stream",
    //     HttpHeaders.authorizationHeader:
    //         "Basic ${base64Encode(utf8.encode('$username:$password'))}"
    //   },
    // );
    return _response;
  }
}
