import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../../../abstract/host_absts/remove_hosts_abst.dart';
import '../../../apis/host_api.dart';

/// Project : Renterd's Package
/// Description : This file contains the function [remove Hosts] whose Removes all hosts with a given downtime and minimum number of total scans from the bus into response"
/// Author : James Brel
/// onCreated : 17/05/2023
/// onUpadted : #
/// Upadted by : #
class RemoveHostsImpl implements RemoveHostsAbst {
  @override
  Future<http.Response> removeHosts({
    required int minRecentScanFailures,
    required String maxDowntimeHours,
  }) async {
    http.Response _response = await http.post(
        Uri.parse(
          "${dotenv.env['ROOT_URL']}$removeHostsApi",
        ),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
        },
        body: json.encode({
          "minRecentScanFailures": minRecentScanFailures,
          "maxDowntimeHours": maxDowntimeHours,
        }));
    return _response;
  }
}
