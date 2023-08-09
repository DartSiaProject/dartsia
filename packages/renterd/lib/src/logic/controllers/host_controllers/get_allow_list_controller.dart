import 'package:http/http.dart' as http;

import '../../../abstract/host_abst.dart';

class GetAllowListController {
  final HostAbst hostAbst;

  GetAllowListController({
    required this.hostAbst,
  });

  Future<http.Response> call({
    String? username,
    required String password,
  }) async {
    return await hostAbst.getAllowList(
      username: username,
      password: password,
    );
  }
}
