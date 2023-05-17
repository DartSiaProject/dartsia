import 'package:http/http.dart' as http;

import '../../../abstract/host_absts/update_block_list_abst.dart';

class UpdateBlockListController {
  final UpdateBlockListAbst updateBlockListAbst;

  UpdateBlockListController({
    required this.updateBlockListAbst,
  });

  Future<http.Response> call({
    List<String>? addHostList,
    List<String>? removeHostList,
  }) async {
    return await updateBlockListAbst.updateBlockList(
      addHostList: addHostList,
      removeHostList: removeHostList,
    );
  }
}
