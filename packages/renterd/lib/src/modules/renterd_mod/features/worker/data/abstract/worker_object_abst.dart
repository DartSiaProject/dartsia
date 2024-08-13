import 'dart:io';

import 'package:http/http.dart' as http;

abstract class WorkerObjectAbst {
  Future<http.Response> uploadAnObject({
    String? username,
    required String password,
    required String bucketName,
    required String fileName,
    required File file,
    required String serverAddress,
  });
  Future<http.Response> downloadTheObject({
    String? username,
    required String password,
    required String key,
    required String serverAddress,
  });
}
