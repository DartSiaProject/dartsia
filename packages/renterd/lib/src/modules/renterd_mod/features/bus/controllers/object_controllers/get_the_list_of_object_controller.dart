import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import '../../data/abstract/object_abst.dart';

@Injectable()
class GetTheListOfObjectController {
  final ObjectAbst _objectAbst;

  GetTheListOfObjectController({
    required ObjectAbst objectAbst,
  }) : _objectAbst = objectAbst;

  Future<http.Response> call({
    String? username,
    required String password,
    required String serverAddress,
    required String bucketName,
    required int limit,
    String? prefix,
  }) async {
    return await _objectAbst.getListOfObjectLimited(
      username: username,
      password: password,
      serverAddress: serverAddress,
      bucketName: bucketName,
      limit: limit,
      prefix: prefix,
    );
  }
}
