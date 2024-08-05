import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import '../../data/abstract/hoster_abst.dart';

@Injectable()
class UpdateSomeHostController {
  final HosterAbst hosterAbst;

  UpdateSomeHostController({
    required this.hosterAbst,
  });

  Future<http.Response> call({
    String? username,
    required String password,
    required Map<String, dynamic> hostConfig,
    required String serverAddress,
  }) async {
    return await hosterAbst.updateSomeHost(
      username: username,
      password: password,
      hostConfig: hostConfig,
      serverAddress: serverAddress,
    );
  }
}
