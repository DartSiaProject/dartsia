import 'package:http/http.dart' as http;

import '../../../abstract/host_abst.dart';

class GetHostsController {
  final HostAbst hostAbst;

  GetHostsController({
    required this.hostAbst,
  });

  Future<http.Response> call({
    String? username,
    required String password,
  }) async {
    return await hostAbst.getHosts(
      username: username,
      password: password,
    );
  }
}
