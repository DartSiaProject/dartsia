import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import '../../data/abstract/hoster_abst.dart';

@Injectable()
class GetHostsController {
  final HosterAbst hosterAbst;

  GetHostsController({
    required this.hosterAbst,
  });

  Future<http.Response> call({
    String? username,
    required String password,
    required String serverAddress,
  }) async {
    return await hosterAbst.getHosts(
      username: username,
      password: password,
      serverAddress: serverAddress,
    );
  }
}
