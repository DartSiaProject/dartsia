import 'package:http/http.dart' as http;

abstract class UnLockAnAccountAbst {
  Future<http.Response> unLockAnAccount({
    required String accountId,
    required int lockId,
  });
}
