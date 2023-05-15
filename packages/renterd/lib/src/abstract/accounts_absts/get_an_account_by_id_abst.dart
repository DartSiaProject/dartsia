import 'package:http/http.dart' as http;

abstract class GetAnAccountByIdAbst {
  Future<http.Response> getAnAccountById({
    required String accountId,
    required String hostKey,
  });
}
