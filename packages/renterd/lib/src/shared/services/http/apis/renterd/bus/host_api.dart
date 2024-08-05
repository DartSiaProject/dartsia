class HostApi {
  static String getHostInfoByPublicKey(
          String publicKey, String serverAddress) =>
      "$serverAddress/api/bus/host/$publicKey";
  static String getHosts(String serverAddress) =>
      "$serverAddress/api/bus/hosts";
  static String updateAllowList(String serverAddress) =>
      "$serverAddress/api/bus/hosts/allowlist";
  static String getAllowList(String serverAddress) =>
      "$serverAddress/api/bus/hosts/allowlist";
  static String updateBlockList(String serverAddress) =>
      "$serverAddress/api/bus/hosts/blocklist";
  static String getBlockList(String serverAddress) =>
      "$serverAddress/api/bus/hosts/blocklist";
  static String postInteraction(String serverAddress) =>
      "$serverAddress/api/bus/hosts/interactions";
  static String removeHosts(String serverAddress) =>
      "$serverAddress/api/bus/hosts/remove";
  static String getHostsScanning(
          int offset, int limit, String lastScan, String serverAddress) =>
      "$serverAddress/api/bus/hosts/scanning?offset=$offset&limit=$limit&lastScan=$lastScan";
  static String fetchSomeHost(String key, String serverAddress) =>
      "$serverAddress/api/bus/setting/$key";
  static String updateSomeHost(String key, String serverAddress) =>
      "$serverAddress/api/bus/setting/$key";
}
