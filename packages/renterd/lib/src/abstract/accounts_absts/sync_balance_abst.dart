import 'package:http/http.dart' as http;

abstract class SyncBalanceAbst {
  Future<http.Response> syncBalance({
    required String accountId,
    required String host,
  });
}
