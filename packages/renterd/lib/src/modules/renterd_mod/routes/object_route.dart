import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:renterd/src/modules/renterd_mod/features/bus/controllers/object_controllers/get_the_list_of_bucket_controller.dart';

import '../../../core/configs/injectors_config/injector.dart';
import '../features/bus/controllers/object_controllers/copy_and_paste_the_object_controller.dart';
import '../features/bus/controllers/object_controllers/delete_the_object_controller.dart';
import '../features/bus/controllers/object_controllers/get_the_list_of_object_controller.dart';
import '../features/bus/controllers/object_controllers/rename_an_object_controller.dart';
import '../features/worker/controllers/object_controllers/get_the_object_controller.dart';
import '../features/worker/controllers/object_controllers/upload_the_object_controller.dart';

class Object {
  static Future<http.Response> getListOfBucket({
    String? username,
    required String password,
    required String serverAddress,
  }) async =>
      await sl.call<GetTheListOfBucketController>().call(
            username: username,
            password: password,
            serverAddress: serverAddress,
          );
  static Future<http.Response> uploadAnObject({
    String? username,
    required String password,
    required String key,
    required File file,
    required String serverAddress,
  }) async =>
      await sl.call<UploadTheObjectController>().call(
          username: username,
          password: password,
          key: key,
          file: file,
          serverAddress: serverAddress);

  static Future<http.Response> previewTheObject({
    String? username,
    required String password,
    required String key,
    required String serverAddress,
  }) async =>
      await sl.call<FetchObjectController>().call(
          username: username,
          password: password,
          key: key,
          serverAddress: serverAddress);

  static Future<http.Response> renameSingleObject({
    String? username,
    required String password,
    required String serverAddress,
    required String bucketName,
    required String oldFileName,
    required String newFileName,
  }) async =>
      await sl.call<RenameAnObjectController>().call(
          username: username,
          password: password,
          serverAddress: serverAddress,
          bucketName: bucketName,
          oldFileName: oldFileName,
          newFileName: newFileName);

  static Future<http.Response> getListOfObjectLimited({
    String? username,
    required String password,
    required String serverAddress,
    required String bucketName,
    required int limit,
    String? prefix,
  }) async =>
      await sl.call<GetTheListOfObjectController>().call(
          username: username,
          password: password,
          serverAddress: serverAddress,
          bucketName: bucketName,
          limit: limit,
          prefix: prefix);

  static Future<http.Response> copyTheObject({
    String? username,
    required String password,
    required String serverAddress,
    required String sourceBucketName,
    required String sourcefileName,
    required String destBucketName,
    required String destfileName,
  }) async =>
      await sl.call<CopyAndPasteTheObjectController>().call(
          username: username,
          password: password,
          serverAddress: serverAddress,
          sourceBucketName: sourceBucketName,
          sourcefileName: sourcefileName,
          destBucketName: destBucketName,
          destfileName: destfileName);

  static Future<http.Response> deleteTheObject({
    String? username,
    required String password,
    required String serverAddress,
    required String fileNameWithExtension,
  }) async =>
      await sl.call<DeleteTheObjectController>().call(
          username: username,
          password: password,
          serverAddress: serverAddress,
          fileNameWithExtension: fileNameWithExtension);
}
