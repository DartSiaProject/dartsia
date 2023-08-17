import 'package:renterd/src/utils/constants/string_const.dart';

String getAccountsApi(String ipAdress) =>
    "${endPoint(ipAdress)}/api/bus/accounts";
String getAnAccountByIdApi(String accounId, String ipAdress) =>
    "${endPoint(ipAdress)}/api/bus/accounts/$accounId";
String lockAnAccountApi(String accounId, String ipAdress) =>
    "${endPoint(ipAdress)}/api/bus/accounts/$accounId/lock";
String unLockAnAccountApi(String accounId, String ipAdress) =>
    "${endPoint(ipAdress)}/api/bus/accounts/$accounId/unlock";
String addDepositApi(String accounId, String ipAdress) =>
    "${endPoint(ipAdress)}/api/bus/accounts/$accounId/add";
String updateBalanceApi(String accounId, String ipAdress) =>
    "${endPoint(ipAdress)}/api/bus/accounts/$accounId/update";
String syncBalanceApi(String accounId, String ipAdress) =>
    "${endPoint(ipAdress)}/api/bus/accounts/$accounId/requiressync";
String resetDriftApi(String accounId, String ipAdress) =>
    "${endPoint(ipAdress)}/api/bus/accounts/$accounId/resetdrift";
