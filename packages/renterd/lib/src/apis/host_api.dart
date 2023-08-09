String getHostInfoByPublicKeyApi(String publicKey) => "api/bus/host/$publicKey";
const getHostsApi = "api/bus/hosts";
const updateAllowListApi = "api/bus/hosts/allowlist";
const getAllowListApi = "api/bus/hosts/allowlist";
const updateBlockListApi = "api/bus/hosts/blocklist";
const getBlockListApi = "api/bus/hosts/blocklist";
const postInteractionApi = "api/bus/hosts/interactions";
const removeHostsApi = "api/bus/hosts/remove";
String getHostsScanningApi(int offset, int limit, String lastScan) =>
    "api/bus/hosts/scanning?offset=$offset&limit=$limit&lastScan=$lastScan";
