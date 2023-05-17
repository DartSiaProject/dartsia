import 'package:http/http.dart' as http;

import '../../../abstract/host_absts/get_host_info_by_public_key_abst.dart';

class GetHostInfoByPublicKeyController {
  final GetHostInfoByPublicKeyAbst getHostInfoByPublicKeyAbst;

  GetHostInfoByPublicKeyController({
    required this.getHostInfoByPublicKeyAbst,
  });

  Future<http.Response> call({
    required String publicKey,
  }) async {
    return await getHostInfoByPublicKeyAbst.getHostInfoByPublicKey(
        publicKey: publicKey);
  }
}
