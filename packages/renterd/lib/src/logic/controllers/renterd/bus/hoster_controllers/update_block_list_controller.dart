import 'package:http/http.dart' as http;

import '../../../../../abstract/renterd/bus/hoster_abst.dart';

class UpdateBlockListController {
  final HosterAbst hosterAbst;

  UpdateBlockListController({
    required this.hosterAbst,
  });

  Future<http.Response> call({
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
