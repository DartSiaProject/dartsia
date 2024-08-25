import 'dart:convert';
import 'dart:io';

import 'package:injectable/injectable.dart';

import '../../../../../../shared/services/http/apis/renterd/bus/object_api.dart';
import '../../../../../../shared/services/http/requests/http_delete_request.dart';
import '../../../../../../shared/services/http/requests/http_get_request.dart';
import '../../../../../../shared/services/http/requests/http_post_request.dart';
import '../abstract/object_abst.dart';

/// Project : [Renterd's Package]
/// Description : This file contains these Functionnalities [getObject, updateObject, deleteObject, postObject, postObjectList, renameObjectName]
/// Author : [CotradeChain]
/// onCreated : 18/07/2023
/// onUpadted : #
/// AuthorCode : James Brel

@LazySingleton(as: ObjectAbst)
class ObjectImpl implements ObjectAbst {
  /// Note :  This function allow to get all the buckets
  @override
  Future<Map<String, dynamic>> getListOfBuckets({
    String? username,
    required String password,
    required String serverAddress,
  }) async {
    var _response = await HttpGetRequest.get(
      api: ObjectApi.getBucketsList(serverAddress),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader:
            "Basic ${base64Encode(utf8.encode('$username:$password'))}"
      },
    );

    // await http.get(
    //   Uri.parse(
    //     ObjectApi.getBucketsList(serverAddress),
    //   ),
    //   headers: {
    //     HttpHeaders.contentTypeHeader: "application/json",
    //     HttpHeaders.authorizationHeader:
    //         "Basic ${base64Encode(utf8.encode('$username:$password'))}"
    //   },
    // );
    return _response;
  }

  /// Note :  This function allow to get the details of object
  @override
  Future<Map<String, dynamic>> getDetailsOfObjects({
    String? username,
    required String password,
    required String serverAddress,
    required String bucketName,
    required String fileName,
  }) async {
    var _response = await HttpGetRequest.get(
      api: ObjectApi.getTheDetailsObject(serverAddress, bucketName, fileName),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader:
            "Basic ${base64Encode(utf8.encode('$username:$password'))}"
      },
    );

    // await http.get(
    //   Uri.parse(
    //     ObjectApi.getTheDetailsObject(serverAddress, bucketName, fileName),
    //   ),
    //   headers: {
    //     HttpHeaders.contentTypeHeader: "application/json",
    //     HttpHeaders.authorizationHeader:
    //         "Basic ${base64Encode(utf8.encode('$username:$password'))}",
    //   },
    // );
    return _response;
  }

  /// Note :  This function allow to delete an object after send the fileNameWithExtension
  @override
  Future<Map<String, dynamic>> deleteTheObject(
      {String? username,
      required String password,
      required String serverAddress,
      required String fileName,
      required String bucketName}) async {
    var _response = await HttpDeleteRequest.delete(
      api: ObjectApi.deleteObject(serverAddress, fileName, bucketName),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader:
            "Basic ${base64Encode(utf8.encode('$username:$password'))}"
      },
    );

    // await http.delete(
    //   Uri.parse(
    //     ObjectApi.deleteObject(serverAddress, fileName, bucketName),
    //   ),
    //   headers: {
    //     HttpHeaders.contentTypeHeader: "application/json",
    //     HttpHeaders.authorizationHeader:
    //         "Basic ${base64Encode(utf8.encode('$username:$password'))}"
    //   },
    // );
    return _response;
  }

  /// Note :  This function allow to copy and paste an objet limit
  @override
  Future<Map<String, dynamic>> copyAndPasteTheObject({
    String? username,
    required String password,
    required String serverAddress,
    required String sourceBucketName,
    required String sourcefileName,
    required String destBucketName,
    required String destfileName,
  }) async {
    var _response = await HttpPostRequest.post(
      api: ObjectApi.copyAndPasteObject(serverAddress),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader:
            "Basic ${base64Encode(utf8.encode('$username:$password'))}"
      },
      content: json.encode({
        "sourceBucket": sourceBucketName,
        "sourcePath": "/$sourcefileName",
        "destinationBucket": destBucketName,
        "destinationPath": "/$destfileName",
      }),
    );

    //  await http.post(
    //     Uri.parse(
    //       ObjectApi.copyAndPasteObject(serverAddress),
    //     ),
    //     headers: {
    //       HttpHeaders.contentTypeHeader: "application/json",
    //       HttpHeaders.authorizationHeader:
    //           "Basic ${base64Encode(utf8.encode('$username:$password'))}"
    //     },
    //     body: json.encode({
    //       "sourceBucket": sourceBucketName,
    //       "sourcePath": "/$sourcefileName",
    //       "destinationBucket": destBucketName,
    //       "destinationPath": "/$destfileName",
    //     }));
    return _response;
  }

  /// Note :  This function allow to get a list of object after insert a number limit
  @override
  Future<Map<String, dynamic>> getListOfObjectLimited({
    String? username,
    required String password,
    required String serverAddress,
    required String bucketName,
    required int limit,
    String? prefix,
  }) async {
    var _response = await HttpPostRequest.post(
      api: ObjectApi.getObjectList(serverAddress),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader:
            "Basic ${base64Encode(utf8.encode('$username:$password'))}"
      },
      content: json.encode({
        "bucket": bucketName,
        "limit": limit,
        "prefix": prefix,
        "marker": "",
      }),
    );

    // await http.post(
    //     Uri.parse(
    //       ObjectApi.getObjectList(serverAddress),
    //     ),
    //     headers: {
    //       HttpHeaders.contentTypeHeader: "application/json",
    //       HttpHeaders.authorizationHeader:
    //           "Basic ${base64Encode(utf8.encode('$username:$password'))}"
    //     },
    //     body: json.encode({
    //       "bucket": bucketName,
    //       "limit": limit,
    //       "prefix": prefix,
    //       "marker": "",
    //     }));
    return _response;
  }

  /// Note : This Function allow to rename a single object and send a var
  @override
  Future<Map<String, dynamic>> renameSingleObject({
    String? username,
    required String password,
    required String serverAddress,
    required String bucketName,
    required String oldFileName,
    required String newFileName,
  }) async {
    var _response = await HttpPostRequest.post(
      api: ObjectApi.renameObjectName(serverAddress),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader:
            "Basic ${base64Encode(utf8.encode('$username:$password'))}"
      },
      content: json.encode({
        "bucket": bucketName,
        "from": "/$oldFileName",
        "to": "/$newFileName",
        "mode": "single"
      }),
    );

    // await http.post(
    //     Uri.parse(
    //       ObjectApi.renameObjectName(serverAddress),
    //     ),
    //     headers: {
    //       HttpHeaders.contentTypeHeader: "application/json",
    //       HttpHeaders.authorizationHeader:
    //           "Basic ${base64Encode(utf8.encode('$username:$password'))}"
    //     },
    //     body: json.encode({
    //       "bucket": bucketName,
    //       "from": "/$oldFileName",
    //       "to": "/$newFileName",
    //       "mode": "single"
    //     }));
    return _response;
  }
}
