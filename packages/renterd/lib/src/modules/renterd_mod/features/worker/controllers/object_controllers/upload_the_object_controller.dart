import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import '../../data/abstract/worker_object_abst.dart';

@Injectable()
class UploadTheObjectController {
  final WorkerObjectAbst _workerObjectAbst;

  UploadTheObjectController({
    required WorkerObjectAbst workerObjectAbst,
  }) : _workerObjectAbst = workerObjectAbst;

  Future<http.Response> call({
    String? username,
    required String password,
    required String key,
    required File file,
    required String serverAddress,
  }) async {
    return await _workerObjectAbst.uploadAnObject(
      username: username,
      password: password,
      key: key,
      file: file,
      serverAddress: serverAddress,
    );
  }
}
