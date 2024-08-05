import 'dart:io';

import 'package:http/http.dart' as http;

abstract class WorkerObjectAbst {
  Future<http.Response> uploadAnObject({
    String? username,
    required String password,
    required String key,
    required File file,
    required String serverAddress,
  });
  Future<http.Response> previewTheObject({
    String? username,
    required String password,
    required String key,
    required String serverAddress,
  });
}
