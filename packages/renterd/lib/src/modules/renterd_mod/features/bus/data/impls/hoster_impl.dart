import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import '../../../../../../shared/services/http/apis/renterd/bus/host_api.dart';
import '../abstract/hoster_abst.dart';

/// Project : [Renterd's Package]
/// Description : This file contains these Functionnalities [getAllowList, getBlockList, getHostInfoByPublicKey, getHostScannig, getHosts, postInteraction, removeHosts, updateAllowList, updateBlockList, fetchSomeHost, updateSomeHost]
/// Author : [CotradeChain]
/// onCreated : 24/05/2023
/// onUpadted : 14/08/2023
/// AuthorCode : James Brel

@LazySingleton(as: HosterAbst)
class HosterImpl implements HosterAbst {
  /// Note : This Function whose Returns the current allowlist of the bus like http.Response
  @override
  Future<http.Response> getAllowList({
    String? username,
    required String password,
    required String serverAddress,
  }) async {
    http.Response _response = await http.get(
      Uri.parse(
        HostApi.getAllowList(serverAddress),
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
    required String serverAddress,
  }) async {
    http.Response _response = await http.get(
      Uri.parse(
        HostApi.getBlockList(serverAddress),
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
    required String serverAddress,
  }) async {
    http.Response _response = await http.get(
      Uri.parse(
        HostApi.getHostInfoByPublicKey(publicKey, serverAddress),
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
    required String serverAddress,
  }) async {
    http.Response _response = await http.get(
      Uri.parse(
        HostApi.getHostsScanning(offset, limit, lastScan, serverAddress),
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
    required String serverAddress,
  }) async {
    http.Response _response = await http.get(
      Uri.parse(
        HostApi.getHosts(serverAddress),
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
  Future<http.Response> postInteraction(
      {String? username,
      required String password,
      required List<String> hostScanData,
      required String serverAddress}) async {
    http.Response _response = await http.post(
        Uri.parse(
          HostApi.postInteraction(serverAddress),
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
    required String serverAddress,
  }) async {
    http.Response _response = await http.post(
        Uri.parse(
          HostApi.removeHosts(serverAddress),
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
    required String serverAddress,
  }) async {
    http.Response _response = await http.put(
        Uri.parse(
          HostApi.updateAllowList(serverAddress),
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
    required String serverAddress,
  }) async {
    http.Response _response = await http.put(
        Uri.parse(
          HostApi.updateBlockList(serverAddress),
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

  /// Note : This Function help the user to get his personal host
  @override
  Future<http.Response> fetchSomeHost({
    String? username,
    required String password,
    required String serverAddress,
  }) async {
    http.Response _response = await http.get(
      Uri.parse(
        HostApi.fetchSomeHost("gouging", serverAddress),
      ),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader:
            "Basic ${base64Encode(utf8.encode('$username:$password'))}"
      },
    );
    return _response;
  }

  /// Note : This Function help the user to configure some host
  @override
  Future<http.Response> updateSomeHost({
    String? username,
    required String password,
    required Map<String, dynamic> hostConfig,
    required String serverAddress,
  }) async {
    http.Response _response = await http.put(
        Uri.parse(
          HostApi.updateSomeHost("gouging", serverAddress),
        ),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader:
              "Basic ${base64Encode(utf8.encode('$username:$password'))}"
        },
        body: json.encode(hostConfig));
    return _response;
  }
}
