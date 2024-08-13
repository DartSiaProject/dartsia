import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import '../../data/abstract/worker_object_abst.dart';

@Injectable()
class DownloadTheObjectController {
  final WorkerObjectAbst _workerObjectAbst;

  DownloadTheObjectController({
    required WorkerObjectAbst workerObjectAbst,
  }) : _workerObjectAbst = workerObjectAbst;

  Future<http.Response> call({
    String? username,
    required String password,
    required String key,
    required String serverAddress,
  }) async {
    return await _workerObjectAbst.downloadTheObject(
      username: username,
      password: password,
      key: key,
      serverAddress: serverAddress,
    );
  }
}
