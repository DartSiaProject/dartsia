import 'package:http/http.dart' as http;

import '../../../abstract/host_abst.dart';

class FetchSomeHostController {
  final HostAbst hostAbst;

  FetchSomeHostController({
    required this.hostAbst,
  });

  Future<http.Response> call({
    String? username,
    required String password,
  }) async {
    return await hostAbst.fetchSomeHost(
      username: username,
      password: password,
    );
  }
}
