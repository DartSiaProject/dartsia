import 'dart:io';

abstract class WorkerObjectAbst {
  Future<Map<String, dynamic>> uploadAnObject({
    // String? username,
    // required String password,
    required String bucketName,
    required String fileName,
    required File file,
    required String serverAddress,
    required String key,
    required String iv,
  });
  Future<Map<String, dynamic>> downloadTheObject({
    // String? username,
    // required String password,
    required String serverAddress,
    required String bucketName,
    required String fileName,
    required String key,
    required String iv,
  });
}
