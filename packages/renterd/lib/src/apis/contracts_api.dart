import 'package:renterd/src/utils/constants/string_const.dart';

String getContractsApi(String ipAdress) =>
    "${endPoint(ipAdress)}/api/bus/contracts";
String postContractsApi(String id, String ipAdress) =>
    "${endPoint(ipAdress)}/api/bus/contract/$id";
String acquireAContractApi(String id, String ipAdress) =>
    "${endPoint(ipAdress)}/api/bus/contract/$id/acquire";
String releasePreviousContractApi(String id, String ipAdress) =>
    "${endPoint(ipAdress)}/api/bus/contract/$id/release";
String getContractByIdApi(String id, String ipAdress) =>
    "${endPoint(ipAdress)}/api/bus/contract/$id";
String deleteContractByIdApi(String id, String ipAdress) =>
    "${endPoint(ipAdress)}/api/bus/contract/$id";
