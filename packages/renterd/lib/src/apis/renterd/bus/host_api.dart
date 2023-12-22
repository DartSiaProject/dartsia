String getHostInfoByPublicKeyApi(String publicKey, String serverAddress) =>
    "$serverAddress/api/bus/host/$publicKey";
String getHostsApi(String serverAddress) => "$serverAddress/api/bus/hosts";
String updateAllowListApi(String serverAddress) =>
    "$serverAddress/api/bus/hosts/allowlist";
String getAllowListApi(String serverAddress) =>
    "$serverAddress/api/bus/hosts/allowlist";
String updateBlockListApi(String serverAddress) =>
    "$serverAddress/api/bus/hosts/blocklist";
String getBlockListApi(String serverAddress) =>
    "$serverAddress/api/bus/hosts/blocklist";
String postInteractionApi(String serverAddress) =>
    "$serverAddress/api/bus/hosts/interactions";
String removeHostsApi(String serverAddress) =>
    "$serverAddress/api/bus/hosts/remove";
String getHostsScanningApi(
        int offset, int limit, String lastScan, String serverAddress) =>
    "$serverAddress/api/bus/hosts/scanning?offset=$offset&limit=$limit&lastScan=$lastScan";
String fetchSomeHostApi(String key, String serverAddress) =>
    "$serverAddress/api/bus/setting/$key";
String updateSomeHostApi(String key, String serverAddress) =>
    "$serverAddress/api/bus/setting/$key";
