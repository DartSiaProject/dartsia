import 'package:injectable/injectable.dart';

import '../../data/abstract/accounts_abst.dart';

@Injectable()
class ResetDriftController {
  final AccountsAbst accountsAbst;

  ResetDriftController({
    required this.accountsAbst,
  });

  Future<Map<String, dynamic>> call({
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
