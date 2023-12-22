import 'package:http/http.dart' as http;

import '../../../../../abstract/renterd/bus/accounts_abst.dart';

class UpdateBalanceController {
  final AccountsAbst accountsAbst;

  UpdateBalanceController({
    required this.accountsAbst,
  });

  Future<http.Response> call({
    String? username,
    required String password,
    required String accountId,
    required String host,
    required int amount,
    required String serverAddress,
  }) async {
    return await accountsAbst.updateBalance(
      username: username,
      password: password,
      accountId: accountId,
      host: host,
      amount: amount,
      serverAddress: serverAddress,
    );
  }
}
