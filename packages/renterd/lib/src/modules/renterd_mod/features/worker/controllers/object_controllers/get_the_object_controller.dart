import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import '../../data/abstract/worker_object_abst.dart';

@Injectable()
class FetchObjectController {
  final WorkerObjectAbst _workerObjectAbst;

  FetchObjectController({
    required WorkerObjectAbst workerObjectAbst,
  }) : _workerObjectAbst = workerObjectAbst;

  Future<http.Response> call({
    String? username,
    required String password,
    required String key,
    required String serverAddress,
  }) async {
    return await _workerObjectAbst.previewTheObject(
      username: username,
      password: password,
      key: key,
      serverAddress: serverAddress,
    );
  }
}
