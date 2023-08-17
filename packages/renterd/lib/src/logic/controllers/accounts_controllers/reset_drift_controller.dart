import 'package:http/http.dart' as http;

import '../../../abstract/accounts_abst.dart';

class ResetDriftController {
  final AccountsAbst accountsAbst;

  ResetDriftController({
    required this.accountsAbst,
  });

  Future<http.Response> call({
    String? username,
    required String password,
    required String accountId,
    required String ipAdress,
  }) async {
    return await accountsAbst.resetDrift(
      username: username,
      password: password,
      accountId: accountId,
      ipAdress: ipAdress,
    );
  }
}
