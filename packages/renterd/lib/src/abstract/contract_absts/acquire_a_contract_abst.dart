import 'package:http/http.dart' as http;

abstract class AcquireAContractAbst {
  Future<http.Response> acquireAContract({
    required String id,
    required String duration,
    required int priority,
  });
}
