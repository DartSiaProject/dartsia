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
    required String bucketName,
    required String fileName,
    required File file,
    required String serverAddress,
  }) async {
    return await _workerObjectAbst.uploadAnObject(
      password: password,
      bucketName: bucketName,
      fileName: fileName,
      file: file,
      serverAddress: serverAddress,
    );
  }
}
