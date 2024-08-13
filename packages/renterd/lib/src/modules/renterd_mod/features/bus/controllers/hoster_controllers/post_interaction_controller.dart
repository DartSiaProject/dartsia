import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import '../../data/abstract/hoster_abst.dart';

@Injectable()
class PostInteractionController {
  final HosterAbst hosterAbst;

  PostInteractionController({
    required this.hosterAbst,
  });

  Future<http.Response> call({
    String? username,
    required String password,
    required List<String> hostScanData,
    required String serverAddress,
  }) async {
    return await hosterAbst.postInteraction(
      username: username,
      password: password,
      hostScanData: hostScanData,
      serverAddress: serverAddress,
    );
  }
}