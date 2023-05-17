import 'package:http/http.dart' as http;

import '../../../abstract/host_absts/get_hosts_abst.dart';

class GetHostsController {
  final GetHostsAbst getHostsAbst;

  GetHostsController({
    required this.getHostsAbst,
  });

  Future<http.Response> call() async {
    return await getHostsAbst.getHosts();
  }
}
