import 'package:injectable/injectable.dart';

import '../../data/abstract/object_abst.dart';

@Injectable()
class RenameAnObjectController {
  final ObjectAbst _objectAbst;

  RenameAnObjectController({
    required ObjectAbst objectAbst,
  }) : _objectAbst = objectAbst;

  Future<Map<String, dynamic>> call({
    String? username,
    required String password,
    required String serverAddress,
    required String bucketName,
    required String oldFileName,
    required String newFileName,
  }) async {
    return await _objectAbst.renameSingleObject(
      username: username,
      password: password,
      serverAddress: serverAddress,
      bucketName: bucketName,
      oldFileName: oldFileName,
      newFileName: newFileName,
    );
  }
}
