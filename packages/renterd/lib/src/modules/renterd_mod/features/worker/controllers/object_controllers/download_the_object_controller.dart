import 'package:injectable/injectable.dart';

import '../../data/abstract/worker_object_abst.dart';

@Injectable()
class DownloadTheObjectController {
  final WorkerObjectAbst _workerObjectAbst;

  DownloadTheObjectController({
    required WorkerObjectAbst workerObjectAbst,
  }) : _workerObjectAbst = workerObjectAbst;

  Future<Map<String, dynamic>> call({
    // String? username,
    // required String password,
    required String serverAddress,
    required String bucketName,
    required String fileName,
    required String key,
    required String iv,
  }) async {
    return await _workerObjectAbst.downloadTheObject(
      // username: username,
      // password: password,
      serverAddress: serverAddress,
      bucketName: bucketName,
      fileName: fileName,
      key: key,
      iv: iv,
    );
  }
}
