import 'package:injectable/injectable.dart';

import '../../data/abstract/accounts_abst.dart';

@Injectable()
class SyncBalanceController {
  final AccountsAbst accountsAbst;

  SyncBalanceController({
    required this.accountsAbst,
  });

  Future<Map<String, dynamic>> call({
    // String? username,
    // required String password,
    required String accountId,
    required String host,
    required String serverAddress,
    required String key,
    required String iv,
  }) async {
    return await accountsAbst.syncBalance(
      // username: username,
      // password: password,
      accountId: accountId,
      host: host,
      serverAddress: serverAddress,
      key: key,
      iv: iv,
    );
  }
}
