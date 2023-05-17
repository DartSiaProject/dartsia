import 'package:http/http.dart' as http;

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
    required String publicKey,
  }) async =>
      await sl<GetHostInfoByPublicKeyController>().call(publicKey: publicKey);

  static Future<http.Response> getHosts() async =>
      await sl<GetHostsController>().call();

  static Future<http.Response> updateAllowList({
    List<String>? addHostList,
    List<String>? removeHostList,
  }) async =>
      await sl<UpdateAllowListController>().call(
        addHostList: addHostList,
        removeHostList: removeHostList,
      );
  static Future<http.Response> getAllowList() async =>
      await sl<GetAllowListController>().call();

  static Future<http.Response> getBlockList() async =>
      await sl<GetAllowListController>().call();

  static Future<http.Response> postInteraction({
    required List<String> hostScanData,
  }) async =>
      await sl<PostInteractionController>().call(hostScanData: hostScanData);

  static Future<http.Response> removeHosts({
    required int minRecentScanFailures,
    required String maxDowntimeHours,
  }) async =>
      await sl<RemoveHostsController>().call(
          minRecentScanFailures: minRecentScanFailures,
          maxDowntimeHours: maxDowntimeHours);

  static Future<http.Response> getHostScannig({
    required int offset,
    required int limit,
    required String lastScan,
  }) async =>
      await sl<GetHostScannigController>().call(
        offset: offset,
        limit: limit,
        lastScan: lastScan,
      );
}
