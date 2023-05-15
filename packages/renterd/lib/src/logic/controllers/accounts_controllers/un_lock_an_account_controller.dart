import 'package:http/http.dart' as http;

import '../../../abstract/accounts_absts/un_lock_an_account_abst.dart';

class UnLockAnAccountController {
  final UnLockAnAccountAbst unLockAnAccountAbst;

  UnLockAnAccountController({
    required this.unLockAnAccountAbst,
  });

  Future<http.Response> call({
    required String accountId,
    required int lockId,
  }) async {
    return await unLockAnAccountAbst.unLockAnAccount(
      accountId: accountId,
      lockId: lockId,
    );
  }
}
