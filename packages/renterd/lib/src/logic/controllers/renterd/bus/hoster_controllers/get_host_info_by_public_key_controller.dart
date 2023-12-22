import 'package:http/http.dart' as http;

import '../../../../../abstract/renterd/bus/hoster_abst.dart';

class GetHostInfoByPublicKeyController {
  final HosterAbst hosterAbst;

  GetHostInfoByPublicKeyController({
    required this.hosterAbst,
  });

  Future<http.Response> call({
    String? username,
    required String password,
    required String publicKey,
    required String serverAddress,
  }) async {
    return await hosterAbst.getHostInfoByPublicKey(
      username: username,
      password: password,
      publicKey: publicKey,
      serverAddress: serverAddress,
    );
  }
}
