import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import '../../../../../../shared/services/http/apis/renterd/bus/object_api.dart';
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
  Future<http.Response> getListOfBuckets({
    String? username,
    required String password,
    required String serverAddress,
  }) async {
    http.Response _response = await http.get(
      Uri.parse(
        ObjectApi.getBucketsList(serverAddress),
      ),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader:
            "Basic ${base64Encode(utf8.encode('$username:$password'))}"
      },
    );
    return _response;
  }

  /// Note :  This function allow to delete an object after send the fileNameWithExtension
  @override
  Future<http.Response> deleteTheObject({
    String? username,
    required String password,
    required String serverAddress,
    required String fileNameWithExtension,
  }) async {
    http.Response _response = await http.delete(
      Uri.parse(
        ObjectApi.deleteObject(serverAddress, fileNameWithExtension),
      ),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader:
            "Basic ${base64Encode(utf8.encode('$username:$password'))}"
      },
    );
    return _response;
  }

  /// Note :  This function allow to copy and paste an objet limit
  @override
  Future<http.Response> copyAndPasteTheObject({
    String? username,
    required String password,
    required String serverAddress,
    required String sourceBucketName,
    required String sourcefileName,
    required String destBucketName,
    required String destfileName,
  }) async {
    http.Response _response = await http.post(
        Uri.parse(
          ObjectApi.copyAndPasteObject(serverAddress),
        ),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader:
              "Basic ${base64Encode(utf8.encode('$username:$password'))}"
        },
        body: json.encode({
          "sourceBucket": sourceBucketName,
          "sourcePath": "/$sourcefileName",
          "destinationBucket": destBucketName,
          "destinationPath": "/$destfileName",
        }));
    return _response;
  }

  /// Note :  This function allow to get a list of object after insert a number limit
  @override
  Future<http.Response> getListOfObjectLimited({
    String? username,
    required String password,
    required String serverAddress,
    required String bucketName,
    required int limit,
    String? prefix,
  }) async {
    http.Response _response = await http.post(
        Uri.parse(
          ObjectApi.getObjectList(serverAddress),
        ),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader:
              "Basic ${base64Encode(utf8.encode('$username:$password'))}"
        },
        body: json.encode({
          "bucket": bucketName,
          "limit": limit,
          "prefix": prefix == "" ? "" : "/$prefix/",
          "marker": "",
        }));
    return _response;
  }

  /// Note : This Function allow to rename a single object and send a http.Response
  @override
  Future<http.Response> renameSingleObject({
    String? username,
    required String password,
    required String serverAddress,
    required String bucketName,
    required String oldFileName,
    required String newFileName,
  }) async {
    http.Response _response = await http.post(
        Uri.parse(
          ObjectApi.renameObjectName(serverAddress),
        ),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader:
              "Basic ${base64Encode(utf8.encode('$username:$password'))}"
        },
        body: json.encode({
          "bucket": bucketName,
          "from": "/$oldFileName",
          "to": "/$newFileName",
          "mode": "single"
        }));
    return _response;
  }
}
