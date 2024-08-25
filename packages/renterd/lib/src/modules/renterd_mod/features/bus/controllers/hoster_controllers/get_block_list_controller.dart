import 'package:injectable/injectable.dart';

import '../../data/abstract/hoster_abst.dart';

@Injectable()
class GetBlockListController {
  final HosterAbst hosterAbst;

  GetBlockListController({
    required this.hosterAbst,
  });

  Future<Map<String, dynamic>> call({
    String? username,
    required String password,
    required String serverAddress,
  }) async {
    return await hosterAbst.getBlockList(
      username: username,
      password: password,
      serverAddress: serverAddress,
    );
  }
}
