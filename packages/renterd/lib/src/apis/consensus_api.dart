import 'package:renterd/src/utils/constants/string_const.dart';

String postAcceptBlockApi(String ipAdress) =>
    "${endPoint(ipAdress)}/api/bus/consensus/acceptblock";
String getStateApi(String ipAdress) =>
    "${endPoint(ipAdress)}/api/bus/consensus/state";
String getTotalPayoutApi(int payout, String ipAdress) =>
    "${endPoint(ipAdress)}/api/bus/consensus/siafundfee/$payout";
