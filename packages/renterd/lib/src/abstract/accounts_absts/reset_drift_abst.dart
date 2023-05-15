import 'package:http/http.dart' as http;

abstract class ResetDriftAbst {
  Future<http.Response> resetDrift({
    required String accountId,
    required String host,
    required int amount,
  });
}
