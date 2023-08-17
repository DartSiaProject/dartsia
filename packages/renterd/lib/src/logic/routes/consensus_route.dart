import 'package:http/http.dart' as http;

import '../../injection.dart';
import '../controllers/consensus_controllers/accept_block_controller.dart';
import '../controllers/consensus_controllers/get_sia_fund_fee_controller.dart';
import '../controllers/consensus_controllers/get_state_controller.dart';

class Consensus {
  static Future<http.Response> acceptBlock({
    String? username,
    required String password,
    required String parentId,
    required String address,
    required String value,
    required List<String> arbitraryDataList,
    required String ipAdress,
  }) async =>
      await sl<AcceptBlockController>().call(
        username: username,
        password: password,
        parentId: parentId,
        address: address,
        value: value,
        arbitraryDataList: arbitraryDataList,
        ipAdress: ipAdress,
      );
  static Future<http.Response> getState({
    String? username,
    required String password,
    required String ipAdress,
  }) async =>
      await sl<GetStateController>().call(
        username: username,
        password: password,
        ipAdress: ipAdress,
      );

  static Future<http.Response> getSiaFundFee({
    String? username,
    required String password,
    required int payout,
    required String ipAdress,
  }) async =>
      await sl<GetSiaFundFeeController>().call(
        username: username,
        password: password,
        payout: payout,
        ipAdress: ipAdress,
      );
}
