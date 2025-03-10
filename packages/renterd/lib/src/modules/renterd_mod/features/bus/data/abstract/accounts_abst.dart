abstract class AccountsAbst {
  Future<Map<String, dynamic>> getAllAccounts({
    // String? username,
    // required String password,
    required String serverAddress,
    required String key,
    required String iv,
  });

  Future<Map<String, dynamic>> addDeposit({
    // String? username,
    // required String password,
    required String accountId,
    required String host,
    required int amount,
    required String serverAddress,
    required String key,
    required String iv,
  });

  Future<Map<String, dynamic>> getAnAccountById({
    // String? username,
    // required String password,
    required String accountId,
    required String hostKey,
    required String serverAddress,
    required String key,
    required String iv,
  });

  Future<Map<String, dynamic>> lockAnAccount({
    // String? username,
    // required String password,
    required String accountId,
    required String hostKey,
    required bool exclusive,
    required String serverAddress,
    required String key,
    required String iv,
  });

  Future<Map<String, dynamic>> resetDrift({
    // String? username,
    // required String password,
    required String accountId,
    required String serverAddress,
    required String key,
    required String iv,
  });

  Future<Map<String, dynamic>> syncBalance({
    // String? username,
    // required String password,
    required String accountId,
    required String host,
    required String serverAddress,
    required String key,
    required String iv,
  });

  Future<Map<String, dynamic>> unLockAnAccount({
    // String? username,
    // required String password,
    required String accountId,
    required String lockId,
    required String serverAddress,
    required String key,
    required String iv,
  });

  Future<Map<String, dynamic>> updateBalance({
    // String? username,
    // required String password,
    required String accountId,
    required String host,
    required int amount,
    required String serverAddress,
    required String key,
    required String iv,
  });
}
