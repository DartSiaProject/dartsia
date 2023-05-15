import 'package:http/http.dart' as http;

abstract class AddDepositAbst {
  Future<http.Response> addDeposit({
    required String accountId,
    required String host,
    required int amount,
  });
}
