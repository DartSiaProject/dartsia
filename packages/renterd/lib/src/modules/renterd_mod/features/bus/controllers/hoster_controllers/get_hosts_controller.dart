import 'package:injectable/injectable.dart';

import '../../data/abstract/hoster_abst.dart';

@Injectable()
class GetHostsController {
  final HosterAbst hosterAbst;

  GetHostsController({
    required this.hosterAbst,
  });

  Future<Map<String, dynamic>> call({
    // String? username,
    // required String password,
    required String serverAddress,
    required String key,
    required String iv,
  }) async {
    return await hosterAbst.getHosts(
      // username: username,
      // password: password,
      serverAddress: serverAddress,
      key: key,
      iv: iv,
    );
  }
}
