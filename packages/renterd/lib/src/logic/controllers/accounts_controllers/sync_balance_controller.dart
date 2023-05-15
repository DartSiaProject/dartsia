import 'package:http/http.dart' as http;

import '../../../abstract/accounts_absts/sync_balance_abst.dart';

class SyncBalanceController {
  final SyncBalanceAbst syncBalanceAbst;

  SyncBalanceController({
    required this.syncBalanceAbst,
  });

  Future<http.Response> call({
    required String accountId,
    required String host,
  }) async {
    return await syncBalanceAbst.syncBalance(
      accountId: accountId,
      host: host,
    );
  }
}
