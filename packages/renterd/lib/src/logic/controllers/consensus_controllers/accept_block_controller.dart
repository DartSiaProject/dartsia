import 'package:http/http.dart' as http;

import '../../../abstract/consensus_absts/accept_block_abst.dart';

class AcceptBlockController {
  final AcceptBlockAbst acceptBlockAbst;

  AcceptBlockController({
    required this.acceptBlockAbst,
  });

  Future<http.Response> call({
    required String parentId,
    required String address,
    required String value,
    required List<String> arbitraryDataList,
  }) async {
    return await acceptBlockAbst.acceptBlock(
      parentId: parentId,
      address: address,
      value: value,
      arbitraryDataList: arbitraryDataList,
    );
  }
}
