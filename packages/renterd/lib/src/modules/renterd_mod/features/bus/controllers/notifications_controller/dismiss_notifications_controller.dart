import 'package:injectable/injectable.dart';
import 'package:renterd/src/modules/renterd_mod/features/bus/data/abstract/notification_abst.dart';

@Injectable()
class DismissNotificationsController {
  final NotificationAbst notificationAbst;

  DismissNotificationsController({
    required this.notificationAbst,
  });

  Future<Map<String, dynamic>> call({
    required String serverAddress,
    required String key,
    required String iv,
    required List<String> ids,
  }) async {
    return await notificationAbst.dismissList(
      serverAddress: serverAddress,
      key: key,
      iv: iv,
      ids: ids,
    );
  }
}
