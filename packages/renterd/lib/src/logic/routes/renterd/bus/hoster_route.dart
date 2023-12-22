import 'package:http/http.dart' as http;

import '../../../../injection.dart';
import '../../../controllers/renterd/bus/hoster_controllers/fetch_some_host_controller.dart';
import '../../../controllers/renterd/bus/hoster_controllers/get_allow_list_controller.dart';
import '../../../controllers/renterd/bus/hoster_controllers/get_host_info_by_public_key_controller.dart';
import '../../../controllers/renterd/bus/hoster_controllers/get_host_scanning_controller.dart';
import '../../../controllers/renterd/bus/hoster_controllers/get_hosts_controller.dart';
import '../../../controllers/renterd/bus/hoster_controllers/post_interaction_controller.dart';
import '../../../controllers/renterd/bus/hoster_controllers/remove_hosts_controller.dart';
import '../../../controllers/renterd/bus/hoster_controllers/update_allow_list_controller.dart';
import '../../../controllers/renterd/bus/hoster_controllers/update_block_list_controller.dart';
import '../../../controllers/renterd/bus/hoster_controllers/update_some_host_controller.dart';

class Hoster {
  static Future<http.Response> getHostInfoByPublicKey({
    String? username,
    required String password,
    required String publicKey,
    required String serverAddress,
  }) async =>
      await Renterd.sl<GetHostInfoByPublicKeyController>().call(
        username: username,
        password: password,
        publicKey: publicKey,
        serverAddress: serverAddress,
      );

  static Future<http.Response> getHosts({
    String? username,
    required String password,
    required String serverAddress,
  }) async =>
      await Renterd.sl<GetHostsController>().call(
        username: username,
        password: password,
        serverAddress: serverAddress,
      );

  static Future<http.Response> updateAllowList({
    String? username,
    required String password,
    required List<String> addHostList,
    required List<String> removeHostList,
    required String serverAddress,
  }) async =>
      await Renterd.sl<UpdateAllowListController>().call(
        username: username,
        password: password,
        addHostList: addHostList,
        removeHostList: removeHostList,
        serverAddress: serverAddress,
      );
  static Future<http.Response> updateBlockList({
    String? username,
    required String password,
    required List<String> addHostList,
    required List<String> removeHostList,
    required String serverAddress,
  }) async =>
      await Renterd.sl<UpdateBlockListController>().call(
        username: username,
        password: password,
        addHostList: addHostList,
        removeHostList: removeHostList,
        serverAddress: serverAddress,
      );
  static Future<http.Response> getAllowList({
    String? username,
    required String password,
    required String serverAddress,
  }) async =>
      await Renterd.sl<GetAllowListController>().call(
        username: username,
        password: password,
        serverAddress: serverAddress,
      );

  static Future<http.Response> getBlockList({
    String? username,
    required String password,
    required String serverAddress,
  }) async =>
      await Renterd.sl<GetAllowListController>().call(
        username: username,
        password: password,
        serverAddress: serverAddress,
      );

  static Future<http.Response> postInteraction({
    String? username,
    required String password,
    required List<String> hostScanData,
    required String serverAddress,
  }) async =>
      await Renterd.sl<PostInteractionController>().call(
        username: username,
        password: password,
        hostScanData: hostScanData,
        serverAddress: serverAddress,
      );

  static Future<http.Response> removeHosts({
    String? username,
    required String password,
    required int minRecentScanFailures,
    required String maxDowntimeHours,
    required String serverAddress,
  }) async =>
      await Renterd.sl<RemoveHostsController>().call(
        username: username,
        password: password,
        minRecentScanFailures: minRecentScanFailures,
        maxDowntimeHours: maxDowntimeHours,
        serverAddress: serverAddress,
      );

  static Future<http.Response> getHostScannig({
    String? username,
    required String password,
    required int offset,
    required int limit,
    required String lastScan,
    required String serverAddress,
  }) async =>
      await Renterd.sl<GetHostScannigController>().call(
        username: username,
        password: password,
        offset: offset,
        limit: limit,
        lastScan: lastScan,
        serverAddress: serverAddress,
      );

  static Future<http.Response> fetchSomeHost({
    String? username,
    required String password,
    required String serverAddress,
  }) async =>
      await Renterd.sl<FetchSomeHostController>().call(
        username: username,
        password: password,
        serverAddress: serverAddress,
      );

  static Future<http.Response> updateSomeHost({
    String? username,
    required String password,
    required Map<String, dynamic> hostConfig,
    required String serverAddress,
  }) async =>
      await Renterd.sl<UpdateSomeHostController>().call(
        username: username,
        password: password,
        hostConfig: hostConfig,
        serverAddress: serverAddress,
      );
}
