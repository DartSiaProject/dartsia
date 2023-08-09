const getContractsApi = "api/bus/contracts";
String postContractsApi(String id) => "api/bus/contract/$id";
String acquireAContractApi(String id) => "api/bus/contract/$id/acquire";
String releasePreviousContractApi(String id) => "api/bus/contract/$id/release";
String getContractByIdApi(String id) => "api/bus/contract/$id";
String deleteContractByIdApi(String id) => "api/bus/contract/$id";
