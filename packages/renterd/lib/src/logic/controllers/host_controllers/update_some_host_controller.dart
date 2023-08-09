import 'package:http/http.dart' as http;

import '../../../abstract/host_abst.dart';

class UpdateSomeHostController {
  final HostAbst hostAbst;

  UpdateSomeHostController({
    required this.hostAbst,
  });

  Future<http.Response> call({
    String? username,
    required String password,
    required Map<String, dynamic> hostConfig,
  }) async {
    return await hostAbst.updateSomeHost(
      username: username,
      password: password,
      hostConfig: hostConfig,
    );
  }
}
