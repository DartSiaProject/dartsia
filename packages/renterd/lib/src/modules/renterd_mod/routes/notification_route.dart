import 'package:renterd/src/modules/renterd_mod/features/bus/controllers/notifications_controller/dismiss_notifications_controller.dart';
import 'package:renterd/src/modules/renterd_mod/features/bus/controllers/notifications_controller/find_notifications_controller.dart';

import '../../../core/configs/injectors_config/injector.dart';

class Notification {
  static Future<Map<String, dynamic>> findAll({
    required String serverAddress,
    required String key,
    required String iv,
    int limit = 10,
    int offset = 0,
  }) async =>
      await sl<FindNotificationsController>().call(
        serverAddress: serverAddress,
        key: key,
        iv: iv,
        limit: limit,
        offset: offset,
      );

  static Future<Map<String, dynamic>> dismissList({
    required String serverAddress,
    required String key,
    required String iv,
    required List<String> ids,
  }) async =>
      await sl<DismissNotificationsController>().call(
        serverAddress: serverAddress,
        key: key,
        iv: iv,
        ids: ids,
      );
}
