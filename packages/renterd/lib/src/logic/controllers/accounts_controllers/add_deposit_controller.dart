import 'package:http/http.dart' as http;

import '../../../abstract/accounts_absts/add_deposit_abst.dart';

class AddDepositController {
  final AddDepositAbst addDepositAbst;

  AddDepositController({
    required this.addDepositAbst,
  });

  Future<http.Response> call({
    required String accountId,
    required String host,
    required int amount,
  }) async {
    return await addDepositAbst.addDeposit(
      accountId: accountId,
      host: host,
      amount: amount,
    );
  }
}
