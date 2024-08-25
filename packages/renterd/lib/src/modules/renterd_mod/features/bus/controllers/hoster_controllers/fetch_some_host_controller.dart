import 'package:injectable/injectable.dart';

import '../../data/abstract/hoster_abst.dart';

@Injectable()
class FetchSomeHostController {
  final HosterAbst hosterAbst;

  FetchSomeHostController({
    required this.hosterAbst,
  });

  Future<Map<String, dynamic>> call({
    String? username,
    required String password,
    required String serverAddress,
  }) async {
    return await hosterAbst.fetchSomeHost(
      username: username,
      password: password,
      serverAddress: serverAddress,
    );
  }
}
