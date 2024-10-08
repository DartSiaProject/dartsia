import 'package:injectable/injectable.dart';

import '../../data/abstract/object_abst.dart';

@Injectable()
class GetTheListOfBucketController {
  final ObjectAbst _objectAbst;

  GetTheListOfBucketController({
    required ObjectAbst objectAbst,
  }) : _objectAbst = objectAbst;

  Future<Map<String, dynamic>> call({
    // String? username,
    // required String password,
    required String serverAddress,
    required String key,
    required String iv,
  }) async {
    return await _objectAbst.getListOfBuckets(
      // username: username,
      // password: password,
      serverAddress: serverAddress, key: key, iv: iv,
    );
  }
}
