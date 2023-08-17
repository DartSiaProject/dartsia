import 'package:http/http.dart' as http;

import '../../../abstract/accounts_abst.dart';

class LockAnAccountController {
  final AccountsAbst accountsAbst;

  LockAnAccountController({
    required this.accountsAbst,
  });

  Future<http.Response> call({
    String? username,
    required String password,
    required String accountId,
    required String hostKey,
    required bool exclusive,
    required String ipAdress,
  }) async {
    return await accountsAbst.lockAnAccount(
      username: username,
      password: password,
      accountId: accountId,
      hostKey: hostKey,
      exclusive: exclusive,
      ipAdress: ipAdress,
    );
  }
}
