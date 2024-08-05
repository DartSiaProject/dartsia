import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import '../../data/abstract/accounts_abst.dart';

@Injectable()
class GetAllAccountsController {
  final AccountsAbst accountsAbst;

  GetAllAccountsController({
    required this.accountsAbst,
  });

  Future<http.Response> call({
    String? username,
    required String password,
    required String serverAddress,
  }) async {
    return await accountsAbst.getAllAccounts(
      password: password,
      username: username,
      serverAddress: serverAddress,
    );
  }
}
