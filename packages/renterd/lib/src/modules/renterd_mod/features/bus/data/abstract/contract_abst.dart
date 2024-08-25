abstract class ContractAbst {
  Future<Map<String, dynamic>> acquireAContract({
    String? username,
    required String password,
    required String id,
    required String duration,
    required int priority,
    required String serverAddress,
  });
  Future<Map<String, dynamic>> addContract({
    String? username,
    required String password,
    required String id,
    required Map<dynamic, dynamic> contract,
    required String totalCost,
    required int startHeight,
    required String serverAddress,
  });
  Future<Map<String, dynamic>> deleteContractById({
    String? username,
    required String password,
    required String id,
    required String serverAddress,
  });
  Future<Map<String, dynamic>> getContractById({
    String? username,
    required String password,
    required String id,
    required String serverAddress,
  });
  Future<Map<String, dynamic>> getContracts({
    String? username,
    required String password,
    required String serverAddress,
  });
  Future<Map<String, dynamic>> releasePreviousContract({
    String? username,
    required String password,
    required String id,
    required int lockId,
    required String serverAddress,
  });
}
