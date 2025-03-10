import '../../../core/configs/injectors_config/injector.dart';
import '../features/bus/controllers/consensus_controllers/accept_block_controller.dart';
import '../features/bus/controllers/consensus_controllers/get_sia_fund_fee_controller.dart';
import '../features/bus/controllers/consensus_controllers/get_state_controller.dart';

class Consensus {
  static Future<Map<String, dynamic>> acceptBlock({
    // String? username,
    // required String password,
    required String parentId,
    required String address,
    required String value,
    required List<String> arbitraryDataList,
    required String serverAddress,
    required String key,
    required String iv,
  }) async =>
      await sl<AcceptBlockController>().call(
        // username: username,
        // password: password,
        parentId: parentId,
        address: address,
        value: value,
        arbitraryDataList: arbitraryDataList,
        serverAddress: serverAddress,
        key: key,
        iv: iv,
      );
  static Future<Map<String, dynamic>> getState({
    // String? username,
    // required String password,
    required String serverAddress,
    required String key,
    required String iv,
  }) async =>
      await sl<GetStateController>().call(
        // username: username,
        // password: password,
        serverAddress: serverAddress,
        key: key,
        iv: iv,
      );

  static Future<Map<String, dynamic>> getSiaFundFee({
    // String? username,
    // required String password,
    required int payout,
    required String serverAddress,
    required String key,
    required String iv,
  }) async =>
      await sl<GetSiaFundFeeController>().call(
        // username: username,
        // password: password,
        payout: payout,
        serverAddress: serverAddress,
        key: key,
        iv: iv,
      );
}
