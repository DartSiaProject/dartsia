import 'package:injectable/injectable.dart';

import '../../data/abstract/hoster_abst.dart';

@Injectable()
class GetBlockListController {
  final HosterAbst hosterAbst;

  GetBlockListController({
    required this.hosterAbst,
  });

  Future<Map<String, dynamic>> call({
    // String? username,
    // required String password,
    required String serverAddress,
    required String key,
    required String iv,
  }) async {
    return await hosterAbst.getBlockList(
      // username: username,
      // password: password,
      serverAddress: serverAddress,
      key: key,
      iv: iv,
    );
  }
}
