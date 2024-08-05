import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import '../../data/abstract/object_abst.dart';

@Injectable()
class CopyAndPasteTheObjectController {
  final ObjectAbst _objectAbst;

  CopyAndPasteTheObjectController({
    required ObjectAbst objectAbst,
  }) : _objectAbst = objectAbst;

  Future<http.Response> call({
    String? username,
    required String password,
    required String serverAddress,
    required String sourceBucketName,
    required String sourcefileName,
    required String destBucketName,
    required String destfileName,
  }) async {
    return await _objectAbst.copyAndPasteTheObject(
      username: username,
      password: password,
      serverAddress: serverAddress,
      sourceBucketName: sourceBucketName,
      sourcefileName: sourcefileName,
      destBucketName: destBucketName,
      destfileName: destfileName,
    );
  }
}
