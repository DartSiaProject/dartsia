import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import '../../data/abstract/hoster_abst.dart';

@Injectable()
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