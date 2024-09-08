import 'dart:convert';

import 'package:injectable/injectable.dart';

import '../../../../../../shared/services/cryptography/requests/encrypt_request.dart';
import '../../../../../../shared/services/http/apis/renterd/bus/object_api.dart';
import '../../../../../../shared/services/http/requests/http_delete_request.dart';
import '../../../../../../shared/services/http/requests/http_get_request.dart';
import '../../../../../../shared/services/http/requests/http_post_request.dart';
import '../abstract/object_abst.dart';

/// Project : [Renterd's Package]
/// Description : This file contains these Functionnalities [getObject, updateObject, deleteObject, postObject, postObjectList, renameObjectName]
/// Author : [CotradeChain]
/// onCreated : 18/07/2023
/// onUpadted : 01/09/2024
/// AuthorCode : James Brel

@LazySingleton(as: ObjectAbst)
class ObjectImpl implements ObjectAbst {
  /// Note :  This function allow to get all the buckets
  @override
  Future<Map<String, dynamic>> getListOfBuckets({
    // String? username,
    // required String password,
    required String serverAddress,
    required String key,
    required String iv,
  }) async {
    var _headers = EncryptRequest.encryptStringWithAES256CBC(
      data: json.encode({
        "content-type": "application/json",
      }),
      key: key,
      iv: iv,
    );
    var _response = await HttpGetRequest.get<String>(
      api: "$serverAddress${ObjectApi.getBucketsList}",
      // headers: {
      //   HttpHeaders.contentTypeHeader: "application/json",
      //   // HttpHeaders.authorizationHeader:
      //   //     "Basic ${base64Encode(utf8.encode('$username:$password'))}"
      // },
      queryParameters: {
        "header": _headers,
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
    // String? username,
    // required String password,
    required String serverAddress,
    required String bucketName,
    required String fileName,
    required String key,
    required String iv,
  }) async {
    var _headers = EncryptRequest.encryptStringWithAES256CBC(
      data: json.encode({
        "content-type": "application/json",
      }),
      key: key,
      iv: iv,
    );
    var _params = EncryptRequest.encryptStringWithAES256CBC(
      data: "bucket=$bucketName",
      key: key,
      iv: iv,
    );
    var _response = await HttpGetRequest.get<String>(
      api: "$serverAddress${ObjectApi.getTheDetailsObject}/$fileName",
      // headers: {
      //   HttpHeaders.contentTypeHeader: "application/json",
      //   // HttpHeaders.authorizationHeader:
      //   //     "Basic ${base64Encode(utf8.encode('$username:$password'))}"
      // },

      queryParameters: {
        "header": _headers,
        "params": _params,
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
  Future<Map<String, dynamic>> deleteTheObject({
    // String? username,
    // required String password,
    required String serverAddress,
    required String fileName,
    required String bucketName,
    required String key,
    required String iv,
  }) async {
    var _headers = EncryptRequest.encryptStringWithAES256CBC(
      data: json.encode({
        "content-type": "application/json",
      }),
      key: key,
      iv: iv,
    );
    var _params = EncryptRequest.encryptStringWithAES256CBC(
      data: "batch=false&bucket=$bucketName",
      key: key,
      iv: iv,
    );
    var _response = await HttpDeleteRequest.delete<String>(
        api: "$serverAddress${ObjectApi.deleteObject}/$fileName",
        // headers: {
        //   HttpHeaders.contentTypeHeader: "application/json",
        //   // HttpHeaders.authorizationHeader:
        //   //     "Basic ${base64Encode(utf8.encode('$username:$password'))}"
        // },
        queryParameters: {
          "header": _headers,
          "params": _params,
        });

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
    // String? username,
    // required String password,
    required String serverAddress,
    required String sourceBucketName,
    required String sourcefileName,
    required String destBucketName,
    required String destfileName,
    required String key,
    required String iv,
  }) async {
    var _headers = EncryptRequest.encryptStringWithAES256CBC(
      data: json.encode({
        "content-type": "application/json",
      }),
      key: key,
      iv: iv,
    );
    var _contents = EncryptRequest.encryptStringWithAES256CBC(
      data: json.encode({
        "sourceBucket": sourceBucketName,
        "sourcePath": "/$sourcefileName",
        "destinationBucket": destBucketName,
        "destinationPath": "/$destfileName",
      }),
      key: key,
      iv: iv,
    );
    var _response = await HttpPostRequest.post<String>(
      api: "$serverAddress${ObjectApi.copyAndPasteObject}",
      // headers: {
      //   HttpHeaders.contentTypeHeader: "application/json",
      //   // HttpHeaders.authorizationHeader:
      //   //     "Basic ${base64Encode(utf8.encode('$username:$password'))}"
      // },

      queryParameters: {
        "header": _headers,
      },
      content: json.encode({
        "data": _contents,
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
    // String? username,
    // required String password,
    required String serverAddress,
    required String bucketName,
    required int limit,
    required String prefix,
    required String key,
    required String iv,
  }) async {
    var _headers = EncryptRequest.encryptStringWithAES256CBC(
      data: json.encode({
        "content-type": "application/json",
      }),
      key: key,
      iv: iv,
    );
    var _contents = EncryptRequest.encryptStringWithAES256CBC(
      data: json.encode({
        "bucket": bucketName,
        "limit": limit,
        "prefix": prefix,
        "marker": "",
      }),
      key: key,
      iv: iv,
    );

    // print("content crypter : $_contents");
    var _response = await HttpPostRequest.post<String>(
        api: "$serverAddress${ObjectApi.getObjectList}",
        queryParameters: {
          "header": _headers,
        },
        content: json.encode({
          "data": _contents,
        }));

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
    // String? username,
    // required String password,
    required String serverAddress,
    required String bucketName,
    required String oldFileName,
    required String newFileName,
    required String key,
    required String iv,
  }) async {
    var _headers = EncryptRequest.encryptStringWithAES256CBC(
      data: json.encode({
        "content-type": "application/json",
      }),
      key: key,
      iv: iv,
    );
    var _contents = EncryptRequest.encryptStringWithAES256CBC(
      data: json.encode({
        "bucket": bucketName,
        "from": "/$oldFileName",
        "to": "/$newFileName",
        "mode": "single"
      }),
      key: key,
      iv: iv,
    );
    var _response = await HttpPostRequest.post<String>(
      api: "$serverAddress${ObjectApi.renameObjectName}",
      // headers: {
      //   HttpHeaders.contentTypeHeader: "application/json",
      //   // HttpHeaders.authorizationHeader:
      //   //     "Basic ${base64Encode(utf8.encode('$username:$password'))}"
      // },
      // content: json.encode({
      //   "bucket": bucketName,
      //   "from": "/$oldFileName",
      //   "to": "/$newFileName",
      //   "mode": "single"
      // }),

      queryParameters: {
        "header": _headers,
      },

      content: json.encode({
        "data": _contents,
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
