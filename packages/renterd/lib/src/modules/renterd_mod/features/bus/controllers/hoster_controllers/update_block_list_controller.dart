import 'package:injectable/injectable.dart';

import '../../data/abstract/hoster_abst.dart';

@Injectable()
class UpdateBlockListController {
  final HosterAbst hosterAbst;

  UpdateBlockListController({
    required this.hosterAbst,
  });

  Future<Map<String, dynamic>> call({
    String? username,
    required String password,
    required List<String> addHostList,
    required List<String> removeHostList,
    required String serverAddress,
  }) async {
    return await hosterAbst.updateBlockList(
      username: username,
      password: password,
      addHostList: addHostList,
      removeHostList: removeHostList,
      serverAddress: serverAddress,
    );
  }
}
