import 'package:http/http.dart' as http;

abstract class ReleasePreviousContractAbst {
  Future<http.Response> releasePreviousContract({
    required String id,
    required int lockId,
  });
}
