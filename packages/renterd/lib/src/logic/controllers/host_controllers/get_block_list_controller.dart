import 'package:http/http.dart' as http;

import '../../../abstract/host_absts/get_Block_list_abst.dart';

class GetBlockListController {
  final GetBlockListAbst getBlockListAbst;

  GetBlockListController({
    required this.getBlockListAbst,
  });

  Future<http.Response> call() async {
    return await getBlockListAbst.getBlockList();
  }
}
