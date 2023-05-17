import 'package:http/http.dart' as http;

import '../../../abstract/host_absts/post_interaction_abst.dart';

class PostInteractionController {
  final PostInteractionAbst postInteractionAbst;

  PostInteractionController({
    required this.postInteractionAbst,
  });

  Future<http.Response> call({
    required List<String> hostScanData,
  }) async {
    return await postInteractionAbst.postInteraction(
        hostScanData: hostScanData);
  }
}
