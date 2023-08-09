import 'package:http/http.dart' as http;

import '../../../abstract/accounts_abst.dart';

class AddDepositController {
  final AccountsAbst accountsAbst;

  AddDepositController({
    required this.accountsAbst,
  });

  Future<http.Response> call({
    String? username,
    required String password,
    required String accountId,
    required String host,
    required int amount,
  }) async {
    return await accountsAbst.addDeposit(
      username: username,
      password: password,
      accountId: accountId,
      host: host,
      amount: amount,
    );
  }
}
