import '../../../core/configs/injectors_config/injector.dart';
import '../features/bus/controllers/hoster_controllers/fetch_some_host_controller.dart';
import '../features/bus/controllers/hoster_controllers/get_allow_list_controller.dart';
import '../features/bus/controllers/hoster_controllers/get_host_info_by_public_key_controller.dart';
import '../features/bus/controllers/hoster_controllers/get_host_scanning_controller.dart';
import '../features/bus/controllers/hoster_controllers/get_hosts_controller.dart';
import '../features/bus/controllers/hoster_controllers/post_interaction_controller.dart';
import '../features/bus/controllers/hoster_controllers/remove_hosts_controller.dart';
import '../features/bus/controllers/hoster_controllers/update_allow_list_controller.dart';
import '../features/bus/controllers/hoster_controllers/update_block_list_controller.dart';
import '../features/bus/controllers/hoster_controllers/update_some_host_controller.dart';

class Hoster {
  static Future<Map<String, dynamic>> getHostInfoByPublicKey({
    // String? username,
    // required String password,
    required String publicKey,
    required String serverAddress,
    required String key,
    required String iv,
  }) async =>
      await sl<GetHostInfoByPublicKeyController>().call(
        // username: username,
        // password: password,
        publicKey: publicKey,
        serverAddress: serverAddress,
        key: key,
        iv: iv,
      );

  static Future<Map<String, dynamic>> getHosts({
    // String? username,
    // required String password,
    required String serverAddress,
    required String key,
    required String iv,
  }) async =>
      await sl<GetHostsController>().call(
        // username: username,
        // password: password,
        serverAddress: serverAddress,
        key: key,
        iv: iv,
      );

  static Future<Map<String, dynamic>> updateAllowList({
    // String? username,
    // required String password,
    required List<String> addHostList,
    required List<String> removeHostList,
    required String serverAddress,
    required String key,
    required String iv,
  }) async =>
      await sl<UpdateAllowListController>().call(
        // username: username,
        // password: password,
        addHostList: addHostList,
        removeHostList: removeHostList,
        serverAddress: serverAddress,
        key: key,
        iv: iv,
      );
  static Future<Map<String, dynamic>> updateBlockList({
    // String? username,
    // required String password,
    required List<String> addHostList,
    required List<String> removeHostList,
    required String serverAddress,
    required String key,
    required String iv,
  }) async =>
      await sl<UpdateBlockListController>().call(
        // username: username,
        // password: password,
        addHostList: addHostList,
        removeHostList: removeHostList,
        serverAddress: serverAddress,
        key: key,
        iv: iv,
      );
  static Future<Map<String, dynamic>> getAllowList({
    // String? username,
    // required String password,
    required String serverAddress,
    required String key,
    required String iv,
  }) async =>
      await sl<GetAllowListController>().call(
        // username: username,
        // password: password,
        serverAddress: serverAddress,
        key: key,
        iv: iv,
      );

  static Future<Map<String, dynamic>> getBlockList({
    // String? username,
    // required String password,
    required String serverAddress,
    required String key,
    required String iv,
  }) async =>
      await sl<GetAllowListController>().call(
        // username: username,
        // password: password,
        serverAddress: serverAddress,
        key: key,
        iv: iv,
      );

  static Future<Map<String, dynamic>> postInteraction({
    // String? username,
    // required String password,
    required List<String> hostScanData,
    required String serverAddress,
    required String key,
    required String iv,
  }) async =>
      await sl<PostInteractionController>().call(
        // username: username,
        // password: password,
        hostScanData: hostScanData,
        serverAddress: serverAddress,
        key: key,
        iv: iv,
      );

  static Future<Map<String, dynamic>> removeHosts({
    // String? username,
    // required String password,
    required int minRecentScanFailures,
    required String maxDowntimeHours,
    required String serverAddress,
    required String key,
    required String iv,
  }) async =>
      await sl<RemoveHostsController>().call(
        // username: username,
        // password: password,
        minRecentScanFailures: minRecentScanFailures,
        maxDowntimeHours: maxDowntimeHours,
        serverAddress: serverAddress,
        key: key,
        iv: iv,
      );

  static Future<Map<String, dynamic>> getHostScannig({
    // String? username,
    // required String password,
    required int offset,
    required int limit,
    required String lastScan,
    required String serverAddress,
    required String key,
    required String iv,
  }) async =>
      await sl<GetHostScannigController>().call(
        // username: username,
        // password: password,
        offset: offset,
        limit: limit,
        lastScan: lastScan,
        serverAddress: serverAddress,
        key: key,
        iv: iv,
      );

  static Future<Map<String, dynamic>> fetchSomeHost({
    // String? username,
    // required String password,
    required String serverAddress,
    required String key,
    required String iv,
  }) async =>
      await sl<FetchSomeHostController>().call(
        // username: username,
        // password: password,
        serverAddress: serverAddress,
        key: key,
        iv: iv,
      );

  static Future<Map<String, dynamic>> updateSomeHost({
    // String? username,
    // required String password,
    required Map<String, dynamic> hostConfig,
    required String serverAddress,
    required String key,
    required String iv,
  }) async =>
      await sl<UpdateSomeHostController>().call(
        // username: username,
        // password: password,
        hostConfig: hostConfig,
        serverAddress: serverAddress,
        key: key,
        iv: iv,
      );
}
