import 'package:http/http.dart' as http;

import '../../injection.dart';
import '../controllers/consensus_controllers/accept_block_controller.dart';
import '../controllers/consensus_controllers/get_sia_fund_fee_controller.dart';
import '../controllers/consensus_controllers/get_state_controller.dart';

class Consensus {
  static Future<http.Response> acceptBlock({
    required String parentId,
    required String address,
    required String value,
    required List<String> arbitraryDataList,
  }) async =>
      await sl<AcceptBlockController>().call(
        parentId: parentId,
        address: address,
        value: value,
        arbitraryDataList: arbitraryDataList,
      );
  static Future<http.Response> getState() async =>
      await sl<GetStateController>().call();

  static Future<http.Response> getSiaFundFee({required int payout}) async =>
      await sl<GetSiaFundFeeController>().call(payout: payout);
}
