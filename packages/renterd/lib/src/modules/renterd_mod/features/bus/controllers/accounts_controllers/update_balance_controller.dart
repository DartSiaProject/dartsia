import 'package:injectable/injectable.dart';

import '../../data/abstract/accounts_abst.dart';

@Injectable()
class UpdateBalanceController {
  final AccountsAbst accountsAbst;

  UpdateBalanceController({
    required this.accountsAbst,
  });

  Future<Map<String, dynamic>> call({
    // String? username,
    // required String password,
    required String accountId,
    required String host,
    required int amount,
    required String serverAddress,
    required String key,
    required String iv,
  }) async {
    return await accountsAbst.updateBalance(
      // username: username,
      // password: password,
      accountId: accountId,
      host: host,
      amount: amount,
      serverAddress: serverAddress,
      key: key,
      iv: iv,
    );
  }
}
