import 'package:http/http.dart' as http;

abstract class PostInteractionAbst {
  Future<http.Response> postInteraction({
    required List<String> hostScanData,
  });
}
