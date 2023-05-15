import 'package:http/http.dart' as http;

abstract class UpdateBalanceAbst {
  Future<http.Response> updateBalance({
    required String accountId,
    required String host,
    required int amount,
  });
}
