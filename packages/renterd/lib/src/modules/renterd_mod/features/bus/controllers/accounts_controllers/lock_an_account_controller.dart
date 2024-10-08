import 'package:injectable/injectable.dart';

import '../../data/abstract/accounts_abst.dart';

@Injectable()
class LockAnAccountController {
  final AccountsAbst accountsAbst;

  LockAnAccountController({
    required this.accountsAbst,
  });

  Future<Map<String, dynamic>> call({
    // String? username,
    // required String password,
    required String accountId,
    required String hostKey,
    required bool exclusive,
    required String serverAddress,
    required String key,
    required String iv,
  }) async {
    return await accountsAbst.lockAnAccount(
      // username: username,
      // password: password,
      accountId: accountId,
      hostKey: hostKey,
      exclusive: exclusive,
      serverAddress: serverAddress,
      key: key,
      iv: iv,
    );
  }
}
