import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../../../abstract/host_absts/get_host_scanning_abst.dart';
import '../../../apis/host_api.dart';

/// Project : Renterd's Package
/// Description : This file contains the function [get Host Scanning] whose Returns a list of hosts for scanning. Hosts that have been scanned recently can be ignored by adjusting the lastScan argument into response"
/// Author : James Brel
/// onCreated : 17/05/2023
/// onUpadted : #
/// Upadted by : #
class GetHostScannigImpl implements GetHostScannigAbst {
  @override
  Future<http.Response> getHostScannig({
    required int offset,
    required int limit,
    required String lastScan,
  }) async {
    http.Response _response = await http.get(
      Uri.parse(
        "${dotenv.env['ROOT_URL']}${getHostsScanningApi(offset, limit, lastScan)}",
      ),
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
      },
    );
    return _response;
  }
}
