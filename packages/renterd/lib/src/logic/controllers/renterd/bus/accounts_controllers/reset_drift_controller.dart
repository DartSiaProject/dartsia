import 'package:http/http.dart' as http;

import '../../../../../abstract/renterd/bus/accounts_abst.dart';

class ResetDriftController {
  final AccountsAbst accountsAbst;

  ResetDriftController({
    required this.accountsAbst,
  });

  Future<http.Response> call({
    String? username,
    required String password,
    required String accountId,
    required String serverAddress,
  }) async {
    return await accountsAbst.resetDrift(
      username: username,
      password: password,
      accountId: accountId,
      serverAddress: serverAddress,
    );
  }
}
