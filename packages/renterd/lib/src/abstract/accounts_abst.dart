import 'package:http/http.dart' as http;

abstract class AccountsAbst {
  Future<http.Response> getAllAccounts({
    String? username,
    required String password,
  });

  Future<http.Response> addDeposit({
    String? username,
    required String password,
    required String accountId,
    required String host,
    required int amount,
  });

  Future<http.Response> getAnAccountById({
    String? username,
    required String password,
    required String accountId,
    required String hostKey,
  });

  Future<http.Response> lockAnAccount({
    String? username,
    required String password,
    required String accountId,
    required String hostKey,
    required bool exclusive,
  });

  Future<http.Response> resetDrift({
    String? username,
    required String password,
    required String accountId,
  });

  Future<http.Response> syncBalance({
    String? username,
    required String password,
    required String accountId,
    required String host,
  });

  Future<http.Response> unLockAnAccount({
    String? username,
    required String password,
    required String accountId,
    required String lockId,
  });

  Future<http.Response> updateBalance({
    String? username,
    required String password,
    required String accountId,
    required String host,
    required int amount,
  });
}
