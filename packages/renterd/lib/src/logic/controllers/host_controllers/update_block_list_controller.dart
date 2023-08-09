import 'package:http/http.dart' as http;

import '../../../abstract/host_abst.dart';

class UpdateBlockListController {
  final HostAbst hostAbst;

  UpdateBlockListController({
    required this.hostAbst,
  });

  Future<http.Response> call({
    String? username,
    required String password,
    required List<String> addHostList,
    required List<String> removeHostList,
  }) async {
    return await hostAbst.updateBlockList(
      username: username,
      password: password,
      addHostList: addHostList,
      removeHostList: removeHostList,
    );
  }
}
