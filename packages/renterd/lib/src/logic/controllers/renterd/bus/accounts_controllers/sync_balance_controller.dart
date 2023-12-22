import 'package:http/http.dart' as http;

import '../../../../../abstract/renterd/bus/accounts_abst.dart';

class SyncBalanceController {
  final AccountsAbst accountsAbst;

  SyncBalanceController({
    required this.accountsAbst,
  });

  Future<http.Response> call({
    String? username,
    required String password,
    required String accountId,
    required String host,
    required String serverAddress,
  }) async {
    return await accountsAbst.syncBalance(
      username: username,
      password: password,
      accountId: accountId,
      host: host,
      serverAddress: serverAddress,
    );
  }
}
