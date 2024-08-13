import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import '../../data/abstract/object_abst.dart';

@Injectable()
class GetTheDetailsOfObjectController {
  final ObjectAbst _objectAbst;

  GetTheDetailsOfObjectController({
    required ObjectAbst objectAbst,
  }) : _objectAbst = objectAbst;

  Future<http.Response> call({
    String? username,
    required String password,
    required String serverAddress,
    required String bucketName,
    required String fileName,
  }) async {
    return await _objectAbst.getDetailsOfObjects(
      username: username,
      password: password,
      serverAddress: serverAddress,
      bucketName: bucketName,
      fileName: fileName,
    );
  }
}