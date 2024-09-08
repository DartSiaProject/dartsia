import 'package:injectable/injectable.dart';

import '../../data/abstract/hoster_abst.dart';

@Injectable()
class UpdateSomeHostController {
  final HosterAbst hosterAbst;

  UpdateSomeHostController({
    required this.hosterAbst,
  });

  Future<Map<String, dynamic>> call({
    // String? username,
    // required String password,
    required Map<String, dynamic> hostConfig,
    required String serverAddress,
    required String key,
    required String iv,
  }) async {
    return await hosterAbst.updateSomeHost(
      // username: username,
      // password: password,
      hostConfig: hostConfig,
      serverAddress: serverAddress,
      key: key,
      iv: iv,
    );
  }
}
