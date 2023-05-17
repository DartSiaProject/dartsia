import 'package:http/http.dart' as http;

import '../../../abstract/host_absts/update_allow_list_abst.dart';

class UpdateAllowListController {
  final UpdateAllowListAbst updateAllowListAbst;

  UpdateAllowListController({
    required this.updateAllowListAbst,
  });

  Future<http.Response> call({
    List<String>? addHostList,
    List<String>? removeHostList,
  }) async {
    return await updateAllowListAbst.updateAllowList(
      addHostList: addHostList,
      removeHostList: removeHostList,
    );
  }
}
