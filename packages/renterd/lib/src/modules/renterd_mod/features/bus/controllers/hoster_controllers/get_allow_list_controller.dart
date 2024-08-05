import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import '../../data/abstract/hoster_abst.dart';

@Injectable()
class GetAllowListController {
  final HosterAbst hosterAbst;

  GetAllowListController({
    required this.hosterAbst,
  });

  Future<http.Response> call({
    String? username,
    required String password,
    required String serverAddress,
  }) async {
    return await hosterAbst.getAllowList(
      username: username,
      password: password,
      serverAddress: serverAddress,
    );
  }
}
