class ContractsApi {
  static String getContracts(String serverAddress) =>
      "$serverAddress/api/bus/contracts";
  static String postContracts(String id, String serverAddress) =>
      "$serverAddress/api/bus/contract/$id";
  static String acquireAContract(String id, String serverAddress) =>
      "$serverAddress/api/bus/contract/$id/acquire";
  static String releasePreviousContract(String id, String serverAddress) =>
      "$serverAddress/api/bus/contract/$id/release";
  static String getContractById(String id, String serverAddress) =>
      "$serverAddress/api/bus/contract/$id";
  static String deleteContractById(String id, String serverAddress) =>
      "$serverAddress/api/bus/contract/$id";
}
