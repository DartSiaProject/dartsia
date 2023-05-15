import 'package:http/http.dart' as http;

import '../../../abstract/accounts_absts/update_balance_abst.dart';

class UpdateBalanceController {
  final UpdateBalanceAbst updateBalanceAbst;

  UpdateBalanceController({
    required this.updateBalanceAbst,
  });

  Future<http.Response> call({
    required String accountId,
    required String host,
    required int amount,
  }) async {
    return await updateBalanceAbst.updateBalance(
      accountId: accountId,
      host: host,
      amount: amount,
    );
  }
}
