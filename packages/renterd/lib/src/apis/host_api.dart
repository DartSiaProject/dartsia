String getHostInfoByPublicKeyApi(String publicKey) => "api/bus/host/$publicKey";
const String getHostsApi = "api/bus/hosts";
const String updateAllowListApi = "api/bus/hosts/allowlist";
const String getAllowListApi = "api/bus/hosts/allowlist";
const String updateBlockListApi = "api/bus/hosts/blocklist";
const String getBlockListApi = "api/bus/hosts/blocklist";
const String postInteractionApi = "api/bus/hosts/interactions";
const String removeHostsApi = "api/bus/hosts/remove";
String getHostsScanningApi(int offset, int limit, String lastScan) =>
    "api/bus/hosts/scanning?offset=$offset&limit=$limit&lastScan=$lastScan";
