import 'package:injectable/injectable.dart';

import '../../data/abstract/accounts_abst.dart';

@Injectable()
class GetAnAccountByIdController {
  final AccountsAbst accountsAbst;

  GetAnAccountByIdController({
    required this.accountsAbst,
  });

  Future<Map<String, dynamic>> call({
    // String? username,
    // required String password,
    required String accountId,
    required String hostKey,
    required String serverAddress,
    required String key,
    required String iv,
  }) async {
    return await accountsAbst.getAnAccountById(
      // username: username,
      // password: password,
      accountId: accountId,
      hostKey: hostKey,
      serverAddress: serverAddress,
      key: key,
      iv: iv,
    );
  }
}
