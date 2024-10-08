import 'dart:io';

import '../../../core/configs/injectors_config/injector.dart';
import '../features/bus/controllers/object_controllers/copy_and_paste_the_object_controller.dart';
import '../features/bus/controllers/object_controllers/delete_the_object_controller.dart';
import '../features/bus/controllers/object_controllers/get_details_of_object_controller.dart';
import '../features/bus/controllers/object_controllers/get_the_list_of_bucket_controller.dart';
import '../features/bus/controllers/object_controllers/get_the_list_of_object_controller.dart';
import '../features/bus/controllers/object_controllers/rename_an_object_controller.dart';
import '../features/worker/controllers/object_controllers/download_the_object_controller.dart';
import '../features/worker/controllers/object_controllers/upload_the_object_controller.dart';

class Object {
  static Future<Map<String, dynamic>> getListOfBucket({
    // String? username,
    // required String password,
    required String serverAddress,
    required String key,
    required String iv,
  }) async =>
      await sl.call<GetTheListOfBucketController>().call(
            // username: username,
            // password: password,
            serverAddress: serverAddress,
            key: key,
            iv: iv,
          );

  static Future<Map<String, dynamic>> getTheDetailsObject({
    // String? username,
    // required String password,
    required String serverAddress,
    required String bucketName,
    required String fileName,
    required String key,
    required String iv,
  }) async =>
      await sl.call<GetTheDetailsOfObjectController>().call(
            // username: username,
            // password: password,
            serverAddress: serverAddress,
            bucketName: bucketName,
            fileName: fileName,
            key: key,
            iv: iv,
          );

  static Future<Map<String, dynamic>> uploadAnObject({
    // String? username,
    // required String password,
    required String bucketName,
    required String fileName,
    required File file,
    required String serverAddress,
    required String key,
    required String iv,
  }) async =>
      await sl.call<UploadTheObjectController>().call(
            // username: username,
            // password: password,
            bucketName: bucketName,
            fileName: fileName,
            file: file,
            serverAddress: serverAddress,
            key: key,
            iv: iv,
          );

  static Future<Map<String, dynamic>> downloadTheObject({
    // String? username,
    // required String password,
    required String serverAddress,
    required String bucketName,
    required String fileName,
    required String key,
    required String iv,
  }) async =>
      await sl.call<DownloadTheObjectController>().call(
            // username: username,
            // password: password,
            serverAddress: serverAddress,
            bucketName: bucketName,
            fileName: fileName,
            key: key,
            iv: iv,
          );

  static Future<Map<String, dynamic>> renameSingleObject({
    // String? username,
    // required String password,
    required String serverAddress,
    required String bucketName,
    required String oldFileName,
    required String newFileName,
    required String key,
    required String iv,
  }) async =>
      await sl.call<RenameAnObjectController>().call(
            // username: username,
            // password: password,
            serverAddress: serverAddress,
            bucketName: bucketName,
            oldFileName: oldFileName,
            newFileName: newFileName,
            key: key,
            iv: iv,
          );

  static Future<Map<String, dynamic>> getListOfObjectLimited({
    // String? username,
    // required String password,
    required String serverAddress,
    required String bucketName,
    required int limit,
    required String prefix,
    required String key,
    required String iv,
  }) async =>
      await sl.call<GetTheListOfObjectController>().call(
            // username: username,
            // password: password,
            serverAddress: serverAddress,
            bucketName: bucketName,
            limit: limit,
            prefix: prefix,
            key: key,
            iv: iv,
          );

  static Future<Map<String, dynamic>> copyTheObject({
    // String? username,
    // required String password,
    required String serverAddress,
    required String sourceBucketName,
    required String sourcefileName,
    required String destBucketName,
    required String destfileName,
    required String key,
    required String iv,
  }) async =>
      await sl.call<CopyAndPasteTheObjectController>().call(
            // username: username,
            // password: password,
            serverAddress: serverAddress,
            sourceBucketName: sourceBucketName,
            sourcefileName: sourcefileName,
            destBucketName: destBucketName,
            destfileName: destfileName,
            key: key,
            iv: iv,
          );

  static Future<Map<String, dynamic>> deleteTheObject({
    // String? username,
    // required String password,
    required String serverAddress,
    required String fileName,
    required String bucketName,
    required String key,
    required String iv,
  }) async =>
      await sl.call<DeleteTheObjectController>().call(
            // username: username,
            // password: password,
            serverAddress: serverAddress,
            fileName: fileName,
            bucketName: bucketName,
            key: key,
            iv: iv,
          );
}
