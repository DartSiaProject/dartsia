String getContractsApi(String serverAddress) =>
    "$serverAddress/api/bus/contracts";
String postContractsApi(String id, String serverAddress) =>
    "$serverAddress/api/bus/contract/$id";
String acquireAContractApi(String id, String serverAddress) =>
    "$serverAddress/api/bus/contract/$id/acquire";
String releasePreviousContractApi(String id, String serverAddress) =>
    "$serverAddress/api/bus/contract/$id/release";
String getContractByIdApi(String id, String serverAddress) =>
    "$serverAddress/api/bus/contract/$id";
String deleteContractByIdApi(String id, String serverAddress) =>
    "$serverAddress/api/bus/contract/$id";
