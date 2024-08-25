import 'dart:io';

import 'package:injectable/injectable.dart';

import '../../data/abstract/worker_object_abst.dart';

@Injectable()
class UploadTheObjectController {
  final WorkerObjectAbst _workerObjectAbst;

  UploadTheObjectController({
    required WorkerObjectAbst workerObjectAbst,
  }) : _workerObjectAbst = workerObjectAbst;

  Future<Map<String, dynamic>> call({
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
