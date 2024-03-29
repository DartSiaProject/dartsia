import 'package:http/http.dart' as http;

import '../../../../../abstract/renterd/bus/accounts_abst.dart';

class GetAnAccountByIdController {
  final AccountsAbst accountsAbst;

  GetAnAccountByIdController({
    required this.accountsAbst,
  });

  Future<http.Response> call({
    String? username,
    required String password,
    required String accountId,
    required String hostKey,
    required String serverAddress,
  }) async {
    return await accountsAbst.getAnAccountById(
      username: username,
      password: password,
      accountId: accountId,
      hostKey: hostKey,
      serverAddress: serverAddress,
    );
  }
}
