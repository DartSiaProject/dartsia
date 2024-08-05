import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import '../../data/abstract/object_abst.dart';

@Injectable()
class DeleteTheObjectController {
  final ObjectAbst _objectAbst;

  DeleteTheObjectController({
    required ObjectAbst objectAbst,
  }) : _objectAbst = objectAbst;

  Future<http.Response> call({
    String? username,
    required String password,
    required String serverAddress,
    required String fileNameWithExtension,
  }) async {
    return await _objectAbst.deleteTheObject(
        username: username,
        password: password,
        serverAddress: serverAddress,
        fileNameWithExtension: fileNameWithExtension);
  }
}
