import 'package:http/http.dart' as http;

import '../../../abstract/host_abst.dart';

class UpdateAllowListController {
  final HostAbst hostAbst;

  UpdateAllowListController({
    required this.hostAbst,
  });

  Future<http.Response> call({
    String? username,
    required String password,
    required List<String> addHostList,
    required List<String> removeHostList,
  }) async {
    return await hostAbst.updateAllowList(
      username: username,
      password: password,
      addHostList: addHostList,
      removeHostList: removeHostList,
    );
  }
}
