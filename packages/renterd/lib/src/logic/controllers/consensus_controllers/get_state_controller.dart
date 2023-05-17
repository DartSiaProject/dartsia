import 'package:http/http.dart' as http;

import '../../../abstract/consensus_absts/get_state_abst.dart';

class GetStateController {
  final GetStateAbst getStateAbst;

  GetStateController({
    required this.getStateAbst,
  });

  Future<http.Response> call() async {
    return await getStateAbst.getState();
  }
}
