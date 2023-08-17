import 'package:http/http.dart' as http;

import '../../../abstract/hoster_abst.dart';

class GetHostInfoByPublicKeyController {
  final HosterAbst hosterAbst;

  GetHostInfoByPublicKeyController({
    required this.hosterAbst,
  });

  Future<http.Response> call({
    String? username,
    required String password,
    required String publicKey,
    required String ipAdress,
  }) async {
    return await hosterAbst.getHostInfoByPublicKey(
      username: username,
      password: password,
      publicKey: publicKey,
      ipAdress: ipAdress,
    );
  }
}
