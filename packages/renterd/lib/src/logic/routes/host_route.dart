import 'package:http/http.dart' as http;
import 'package:renterd/src/logic/controllers/host_controllers/update_block_list_controller.dart';

import '../../injection.dart';
import '../controllers/host_controllers/get_allow_list_controller.dart';
import '../controllers/host_controllers/get_host_info_by_public_key_controller.dart';
import '../controllers/host_controllers/get_host_scanning_controller.dart';
import '../controllers/host_controllers/get_hosts_controller.dart';
import '../controllers/host_controllers/post_interaction_controller.dart';
import '../controllers/host_controllers/remove_hosts_controller.dart';
import '../controllers/host_controllers/update_allow_list_controller.dart';

class Host {
  static Future<http.Response> getHostInfoByPublicKey({
    String? username,
    required String password,
    required String publicKey,
  }) async =>
      await sl<GetHostInfoByPublicKeyController>().call(
        username: username,
        password: password,
        publicKey: publicKey,
      );

  static Future<http.Response> getHosts({
    String? username,
    required String password,
  }) async =>
      await sl<GetHostsController>().call(
        username: username,
        password: password,
      );

  static Future<http.Response> updateAllowList({
    String? username,
    required String password,
    required List<String> addHostList,
    required List<String> removeHostList,
  }) async =>
      await sl<UpdateAllowListController>().call(
        username: username,
        password: password,
        addHostList: addHostList,
        removeHostList: removeHostList,
      );
  static Future<http.Response> updateBlockList({
    String? username,
    required String password,
    required List<String> addHostList,
    required List<String> removeHostList,
  }) async =>
      await sl<UpdateBlockListController>().call(
        username: username,
        password: password,
        addHostList: addHostList,
        removeHostList: removeHostList,
      );
  static Future<http.Response> getAllowList({
    String? username,
    required String password,
  }) async =>
      await sl<GetAllowListController>().call(
        username: username,
        password: password,
      );

  static Future<http.Response> getBlockList({
    String? username,
    required String password,
  }) async =>
      await sl<GetAllowListController>().call(
        username: username,
        password: password,
      );

  static Future<http.Response> postInteraction({
    String? username,
    required String password,
    required List<String> hostScanData,
  }) async =>
      await sl<PostInteractionController>().call(
        username: username,
        password: password,
        hostScanData: hostScanData,
      );

  static Future<http.Response> removeHosts({
    String? username,
    required String password,
    required int minRecentScanFailures,
    required String maxDowntimeHours,
  }) async =>
      await sl<RemoveHostsController>().call(
        username: username,
        password: password,
        minRecentScanFailures: minRecentScanFailures,
        maxDowntimeHours: maxDowntimeHours,
      );

  static Future<http.Response> getHostScannig({
    String? username,
    required String password,
    required int offset,
    required int limit,
    required String lastScan,
  }) async =>
      await sl<GetHostScannigController>().call(
        username: username,
        password: password,
        offset: offset,
        limit: limit,
        lastScan: lastScan,
      );
}
