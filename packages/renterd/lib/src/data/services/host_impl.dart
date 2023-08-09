import 'dart:convert';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../../abstract/host_abst.dart';
import '../../apis/host_api.dart';

/// Project : [Renterd's Package]
/// Description : This file contains these Functionnalities []
/// Author : [CotradeChain]
/// onCreated : 24/05/2023
/// onUpadted : #
/// Upadted by : #
/// AuthorCode : James Brel

class HostImpl implements HostAbst {
  /// Note : This Function whose Returns the current allowlist of the bus like http.Response
  @override
  Future<http.Response> getAllowList({
    String? username,
    required String password,
  }) async {
    http.Response _response = await http.get(
      Uri.parse(
        "${dotenv.env['ROOT_URL']}$getAllowListApi",
      ),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader:
            "Basic ${base64Encode(utf8.encode('$username:$password'))}"
      },
    );
    return _response;
  }

  /// Note : This Fucntion whose Returns the current blocklist of the bus like http.Response
  @override
  Future<http.Response> getBlockList({
    String? username,
    required String password,
  }) async {
    http.Response _response = await http.get(
      Uri.parse(
        "${dotenv.env['ROOT_URL']}$getBlockListApi",
      ),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader:
            "Basic ${base64Encode(utf8.encode('$username:$password'))}"
      },
    );
    return _response;
  }

  /// Note : This Function whose Returns some information about the host identified by a given public key like http.Response
  @override
  Future<http.Response> getHostInfoByPublicKey({
    String? username,
    required String password,
    required String publicKey,
  }) async {
    http.Response _response = await http.get(
      Uri.parse(
        "${dotenv.env['ROOT_URL']}${getHostInfoByPublicKeyApi(publicKey)}",
      ),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader:
            "Basic ${base64Encode(utf8.encode('$username:$password'))}"
      },
    );
    return _response;
  }

  /// Note : This Function whose Returns a list of hosts for scanning. Hosts that have been scanned recently can be ignored by adjusting the lastScan argument like http.Response
  @override
  Future<http.Response> getHostScannig({
    String? username,
    required String password,
    required int offset,
    required int limit,
    required String lastScan,
  }) async {
    http.Response _response = await http.get(
      Uri.parse(
        "${dotenv.env['ROOT_URL']}${getHostsScanningApi(offset, limit, lastScan)}",
      ),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader:
            "Basic ${base64Encode(utf8.encode('$username:$password'))}"
      },
    );
    return _response;
  }

  /// Note : This Function whose Returns information about all hosts known to the bus like http.Response
  @override
  Future<http.Response> getHosts({
    String? username,
    required String password,
  }) async {
    http.Response _response = await http.get(
      Uri.parse(
        "${dotenv.env['ROOT_URL']}$getHostsApi",
      ),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader:
            "Basic ${base64Encode(utf8.encode('$username:$password'))}"
      },
    );
    return _response;
  }

  /// Note : This Function whose Records host ineractions in the bus. Commonly called by workers when scanning hosts like http.Response
  @override
  Future<http.Response> postInteraction({
    String? username,
    required String password,
    required List<String> hostScanData,
  }) async {
    http.Response _response = await http.post(
        Uri.parse(
          "${dotenv.env['ROOT_URL']}$postInteractionApi",
        ),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader:
              "Basic ${base64Encode(utf8.encode('$username:$password'))}"
        },
        body: json.encode(hostScanData));
    return _response;
  }

  /// Note : This Function Removes all hosts with a given downtime and minimum number of total scans from the bus
  @override
  Future<http.Response> removeHosts({
    String? username,
    required String password,
    required int minRecentScanFailures,
    required String maxDowntimeHours,
  }) async {
    http.Response _response = await http.post(
        Uri.parse(
          "${dotenv.env['ROOT_URL']}$removeHostsApi",
        ),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader:
              "Basic ${base64Encode(utf8.encode('$username:$password'))}"
        },
        body: json.encode({
          "minRecentScanFailures": minRecentScanFailures,
          "maxDowntimeHours": maxDowntimeHours,
        }));
    return _response;
  }

  /// Note : This Function whose Updates the allowlist of the bus by adding/removing hosts by their public key
  @override
  Future<http.Response> updateAllowList({
    String? username,
    required String password,
    required List<String> addHostList,
    required List<String> removeHostList,
  }) async {
    http.Response _response = await http.put(
        Uri.parse(
          "${dotenv.env['ROOT_URL']}$updateAllowListApi",
        ),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader:
              "Basic ${base64Encode(utf8.encode('$username:$password'))}"
        },
        body: json.encode({
          "add": addHostList,
          "remove": removeHostList,
          "clear": false,
        }));
    return _response;
  }

  /// Note : This Function Updates the blocklist of the bus by adding/removing hosts by their domain or IP address
  @override
  Future<http.Response> updateBlockList({
    String? username,
    required String password,
    required List<String> addHostList,
    required List<String> removeHostList,
  }) async {
    http.Response _response = await http.put(
        Uri.parse(
          "${dotenv.env['ROOT_URL']}$updateBlockListApi",
        ),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader:
              "Basic ${base64Encode(utf8.encode('$username:$password'))}"
        },
        body: json.encode({
          "add": addHostList,
          "remove": removeHostList,
          "clear": false,
        }));
    return _response;
  }
}
