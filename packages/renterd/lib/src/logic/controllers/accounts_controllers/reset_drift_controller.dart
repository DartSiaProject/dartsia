import 'package:http/http.dart' as http;

import '../../../abstract/accounts_absts/reset_drift_abst.dart';

class ResetDriftController {
  final ResetDriftAbst resetDriftAbst;

  ResetDriftController({
    required this.resetDriftAbst,
  });

  Future<http.Response> call({
    required String accountId,
    required String host,
    required int amount,
  }) async {
    return await resetDriftAbst.resetDrift(
      accountId: accountId,
      host: host,
      amount: amount,
    );
  }
}
