import 'package:http/http.dart' as http;

import '../../../abstract/accounts_absts/lock_an_account_abst.dart';

class LockAnAccountController {
  final LockAnAccountAbst lockAnAccountAbst;

  LockAnAccountController({
    required this.lockAnAccountAbst,
  });

  Future<http.Response> call({
    required String accountId,
    required String hostKey,
    required bool exclusive,
  }) async {
    return await lockAnAccountAbst.lockAnAccount(
      accountId: accountId,
      hostKey: hostKey,
      exclusive: exclusive,
    );
  }
}
