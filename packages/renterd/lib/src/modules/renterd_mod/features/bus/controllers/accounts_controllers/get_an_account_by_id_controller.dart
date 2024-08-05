import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import '../../data/abstract/accounts_abst.dart';

@Injectable()
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
