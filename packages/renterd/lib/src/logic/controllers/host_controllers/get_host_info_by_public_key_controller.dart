import 'package:http/http.dart' as http;

import '../../../abstract/host_abst.dart';

class GetHostInfoByPublicKeyController {
  final HostAbst hostAbst;

  GetHostInfoByPublicKeyController({
    required this.hostAbst,
  });

  Future<http.Response> call({
    String? username,
    required String password,
    required String publicKey,
  }) async {
    return await hostAbst.getHostInfoByPublicKey(
      username: username,
      password: password,
      publicKey: publicKey,
    );
  }
}
