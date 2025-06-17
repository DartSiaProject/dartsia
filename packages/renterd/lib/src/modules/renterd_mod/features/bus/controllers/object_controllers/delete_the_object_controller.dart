import 'package:injectable/injectable.dart';

import '../../data/abstract/object_abst.dart';

@Injectable()
class DeleteTheObjectController {
  final ObjectAbst _objectAbst;

  DeleteTheObjectController({
    required ObjectAbst objectAbst,
  }) : _objectAbst = objectAbst;

  Future<Map<String, dynamic>> call({
    // String? username,
    // required String password,
    required String serverAddress,
    required String fileName,
    required String bucketName,
    required String key,
    required String iv,
  }) async {
    return await _objectAbst.deleteTheObject(
      // username: username,
      // password: password,
      serverAddress: serverAddress,
      fileName: fileName,
      bucketName: bucketName,
      key: key, iv: iv,
    );
  }
}
