import 'package:injectable/injectable.dart';

import '../../data/abstract/accounts_abst.dart';

@Injectable()
class GetAllAccountsController {
  final AccountsAbst accountsAbst;

  GetAllAccountsController({
    required this.accountsAbst,
  });

  Future<Map<String, dynamic>> call({
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
