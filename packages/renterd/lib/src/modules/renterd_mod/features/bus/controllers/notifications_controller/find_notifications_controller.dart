import 'package:injectable/injectable.dart';
import 'package:renterd/src/modules/renterd_mod/features/bus/data/abstract/notification_abst.dart';

@Injectable()
class FindNotificationsController {
  final NotificationAbst notificationAbst;

  FindNotificationsController({
    required this.notificationAbst,
  });

  Future<Map<String, dynamic>> call({
    required String serverAddress,
    required String key,
    required String iv,
    int limit = 10,
    int offset = 0,
  }) async {
    return await notificationAbst.findAll(
      serverAddress: serverAddress,
      key: key,
      iv: iv,
      limit: limit,
      offset: offset,
    );
  }
}
