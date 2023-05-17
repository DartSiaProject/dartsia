import 'package:http/http.dart' as http;

abstract class GetHostInfoByPublicKeyAbst {
  Future<http.Response> getHostInfoByPublicKey({required String publicKey});
}
