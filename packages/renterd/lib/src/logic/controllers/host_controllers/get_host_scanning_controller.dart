import 'package:http/http.dart' as http;

import '../../../abstract/host_absts/get_host_scanning_abst.dart';

class GetHostScannigController {
  final GetHostScannigAbst getHostScannigAbst;

  GetHostScannigController({
    required this.getHostScannigAbst,
  });

  Future<http.Response> call({
    required int offset,
    required int limit,
    required String lastScan,
  }) async {
    return await getHostScannigAbst.getHostScannig(
      offset: offset,
      limit: limit,
      lastScan: lastScan,
    );
  }
}
