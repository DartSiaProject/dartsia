import 'package:http/http.dart' as http;

abstract class LockAnAccountAbst {
  Future<http.Response> lockAnAccount({
    required String accountId,
    required String hostKey,
    required bool exclusive,
  });
}
