import 'package:http/http.dart' as http;

import '../../../abstract/host_absts/get_allow_list_abst.dart';

class GetAllowListController {
  final GetAllowListAbst getAllowListAbst;

  GetAllowListController({
    required this.getAllowListAbst,
  });

  Future<http.Response> call() async {
    return await getAllowListAbst.getAllowList();
  }
}
