import 'package:http/http.dart' as http;

import '../../../abstract/host_abst.dart';

class GetBlockListController {
  final HostAbst hostAbst;

  GetBlockListController({
    required this.hostAbst,
  });

  Future<http.Response> call({
    String? username,
    required String password,
  }) async {
    return await hostAbst.getBlockList(
      username: username,
      password: password,
    );
  }
}
