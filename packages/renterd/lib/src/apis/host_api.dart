import 'package:renterd/src/utils/constants/string_const.dart';

String getHostInfoByPublicKeyApi(String publicKey, String ipAdress) =>
    "${endPoint(ipAdress)}/api/bus/host/$publicKey";
String getHostsApi(String ipAdress) => "${endPoint(ipAdress)}/api/bus/hosts";
String updateAllowListApi(String ipAdress) =>
    "${endPoint(ipAdress)}/api/bus/hosts/allowlist";
String getAllowListApi(String ipAdress) =>
    "${endPoint(ipAdress)}/api/bus/hosts/allowlist";
String updateBlockListApi(String ipAdress) =>
    "${endPoint(ipAdress)}/api/bus/hosts/blocklist";
String getBlockListApi(String ipAdress) =>
    "${endPoint(ipAdress)}/api/bus/hosts/blocklist";
String postInteractionApi(String ipAdress) =>
    "${endPoint(ipAdress)}/api/bus/hosts/interactions";
String removeHostsApi(String ipAdress) =>
    "${endPoint(ipAdress)}/api/bus/hosts/remove";
String getHostsScanningApi(
        int offset, int limit, String lastScan, String ipAdress) =>
    "${endPoint(ipAdress)}/api/bus/hosts/scanning?offset=$offset&limit=$limit&lastScan=$lastScan";
String fetchSomeHostApi(String key, String ipAdress) =>
    "${endPoint(ipAdress)}/api/bus/setting/$key";
String updateSomeHostApi(String key, String ipAdress) =>
    "${endPoint(ipAdress)}/api/bus/setting/$key";
