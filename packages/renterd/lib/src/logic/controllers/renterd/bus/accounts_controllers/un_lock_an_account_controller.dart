import 'package:http/http.dart' as http;

import '../../../../../abstract/renterd/bus/accounts_abst.dart';

class UnLockAnAccountController {
  final AccountsAbst accountsAbst;

  UnLockAnAccountController({
    required this.accountsAbst,
  });

  Future<http.Response> call({
    String? username,
    required String password,
    required String accountId,
    required String lockId,
    required String serverAddress,
  }) async {
    return await accountsAbst.unLockAnAccount(
      username: username,
      password: password,
      accountId: accountId,
      lockId: lockId,
      serverAddress: serverAddress,
    );
  }
}
