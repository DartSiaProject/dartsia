import 'package:http/http.dart' as http;

abstract class ContractAbst {
  Future<http.Response> acquireAContract({
    String? username,
    required String password,
    required String id,
    required String duration,
    required int priority,
    required String serverAddress,
  });
  Future<http.Response> addContract({
    String? username,
    required String password,
    required String id,
    required Map<dynamic, dynamic> contract,
    required String totalCost,
    required int startHeight,
    required String serverAddress,
  });
  Future<http.Response> deleteContractById({
    String? username,
    required String password,
    required String id,
    required String serverAddress,
  });
  Future<http.Response> getContractById({
    String? username,
    required String password,
    required String id,
    required String serverAddress,
  });
  Future<http.Response> getContracts({
    String? username,
    required String password,
    required String serverAddress,
  });
  Future<http.Response> releasePreviousContract({
    String? username,
    required String password,
    required String id,
    required int lockId,
    required String serverAddress,
  });
}
