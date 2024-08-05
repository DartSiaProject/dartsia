import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import '../../data/abstract/object_abst.dart';

@Injectable()
class GetTheListOfBucketController {
  final ObjectAbst _objectAbst;

  GetTheListOfBucketController({
    required ObjectAbst objectAbst,
  }) : _objectAbst = objectAbst;

  Future<http.Response> call({
    String? username,
    required String password,
    required String serverAddress,
  }) async {
    return await _objectAbst.getListOfBuckets(
      username: username,
      password: password,
      serverAddress: serverAddress,
    );
  }
}
