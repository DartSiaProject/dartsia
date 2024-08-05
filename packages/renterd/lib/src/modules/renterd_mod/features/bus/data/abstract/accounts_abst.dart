import 'package:http/http.dart' as http;

abstract class AccountsAbst {
  Future<http.Response> getAllAccounts({
    String? username,
    required String password,
    required String serverAddress,
  });

  Future<http.Response> addDeposit({
    String? username,
    required String password,
    required String accountId,
    required String host,
    required int amount,
    required String serverAddress,
  });

  Future<http.Response> getAnAccountById({
    String? username,
    required String password,
    required String accountId,
    required String hostKey,
    required String serverAddress,
  });

  Future<http.Response> lockAnAccount({
    String? username,
    required String password,
    required String accountId,
    required String hostKey,
    required bool exclusive,
    required String serverAddress,
  });

  Future<http.Response> resetDrift({
    String? username,
    required String password,
    required String accountId,
    required String serverAddress,
  });

  Future<http.Response> syncBalance({
    String? username,
    required String password,
    required String accountId,
    required String host,
    required String serverAddress,
  });

  Future<http.Response> unLockAnAccount({
    String? username,
    required String password,
    required String accountId,
    required String lockId,
    required String serverAddress,
  });

  Future<http.Response> updateBalance({
    String? username,
    required String password,
    required String accountId,
    required String host,
    required int amount,
    required String serverAddress,
  });
}
