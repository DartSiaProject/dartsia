import 'dart:convert';
import 'dart:io';

import 'package:injectable/injectable.dart';

import '../../../../../../shared/services/http/apis/renterd/bus/host_api.dart';
import '../../../../../../shared/services/http/requests/http_get_request.dart';
import '../../../../../../shared/services/http/requests/http_post_request.dart';
import '../../../../../../shared/services/http/requests/http_update_request.dart';
import '../abstract/hoster_abst.dart';

/// Project : [Renterd's Package]
/// Description : This file contains these Functionnalities [getAllowList, getBlockList, getHostInfoByPublicKey, getHostScannig, getHosts, postInteraction, removeHosts, updateAllowList, updateBlockList, fetchSomeHost, updateSomeHost]
/// Author : [CotradeChain]
/// onCreated : 24/05/2023
/// onUpadted : 14/08/2023
/// AuthorCode : James Brel

@LazySingleton(as: HosterAbst)
class HosterImpl implements HosterAbst {
  /// Note : This Function whose Returns the current allowlist of the bus like var
  @override
  Future<Map<String, dynamic>> getAllowList({
    String? username,
    required String password,
    required String serverAddress,
  }) async {
    var _response = await HttpGetRequest.get(
      api: HostApi.getAllowList(serverAddress),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader:
            "Basic ${base64Encode(utf8.encode('$username:$password'))}"
      },
    );

    // await http.get(
    //   Uri.parse(
    //     HostApi.getAllowList(serverAddress),
    //   ),
    //   headers: {
    //     HttpHeaders.contentTypeHeader: "application/json",
    //     HttpHeaders.authorizationHeader:
    //         "Basic ${base64Encode(utf8.encode('$username:$password'))}"
    //   },
    // );
    return _response;
  }

  /// Note : This Fucntion whose Returns the current blocklist of the bus like var
  @override
  Future<Map<String, dynamic>> getBlockList({
    String? username,
    required String password,
    required String serverAddress,
  }) async {
    var _response = await HttpGetRequest.get(
      api: HostApi.getBlockList(serverAddress),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader:
            "Basic ${base64Encode(utf8.encode('$username:$password'))}"
      },
    );

    // await http.get(
    //   Uri.parse(
    //     HostApi.getBlockList(serverAddress),
    //   ),
    //   headers: {
    //     HttpHeaders.contentTypeHeader: "application/json",
    //     HttpHeaders.authorizationHeader:
    //         "Basic ${base64Encode(utf8.encode('$username:$password'))}"
    //   },
    // );
    return _response;
  }

  /// Note : This Function whose Returns some information about the host identified by a given public key like var
  @override
  Future<Map<String, dynamic>> getHostInfoByPublicKey({
    String? username,
    required String password,
    required String publicKey,
    required String serverAddress,
  }) async {
    var _response = await HttpGetRequest.get(
      api: HostApi.getHostInfoByPublicKey(publicKey, serverAddress),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader:
            "Basic ${base64Encode(utf8.encode('$username:$password'))}"
      },
    );

    // await http.get(
    //   Uri.parse(
    //     HostApi.getHostInfoByPublicKey(publicKey, serverAddress),
    //   ),
    //   headers: {
    //     HttpHeaders.contentTypeHeader: "application/json",
    //     HttpHeaders.authorizationHeader:
    //         "Basic ${base64Encode(utf8.encode('$username:$password'))}"
    //   },
    // );
    return _response;
  }

  /// Note : This Function whose Returns a list of hosts for scanning. Hosts that have been scanned recently can be ignored by adjusting the lastScan argument like var
  @override
  Future<Map<String, dynamic>> getHostScannig({
    String? username,
    required String password,
    required int offset,
    required int limit,
    required String lastScan,
    required String serverAddress,
  }) async {
    var _response = await HttpGetRequest.get(
      api: HostApi.getHostsScanning(offset, limit, lastScan, serverAddress),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader:
            "Basic ${base64Encode(utf8.encode('$username:$password'))}"
      },
    );

    // await http.get(
    //   Uri.parse(
    //     HostApi.getHostsScanning(offset, limit, lastScan, serverAddress),
    //   ),
    //   headers: {
    //     HttpHeaders.contentTypeHeader: "application/json",
    //     HttpHeaders.authorizationHeader:
    //         "Basic ${base64Encode(utf8.encode('$username:$password'))}"
    //   },
    // );
    return _response;
  }

  /// Note : This Function whose Returns information about all hosts known to the bus like var
  @override
  Future<Map<String, dynamic>> getHosts({
    String? username,
    required String password,
    required String serverAddress,
  }) async {
    var _response = await HttpGetRequest.get(
      api: HostApi.getHosts(serverAddress),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader:
            "Basic ${base64Encode(utf8.encode('$username:$password'))}"
      },
    );

    // await http.get(
    //   Uri.parse(
    //     HostApi.getHosts(serverAddress),
    //   ),
    //   headers: {
    //     HttpHeaders.contentTypeHeader: "application/json",
    //     HttpHeaders.authorizationHeader:
    //         "Basic ${base64Encode(utf8.encode('$username:$password'))}"
    //   },
    // );
    return _response;
  }

  /// Note : This Function whose Records host ineractions in the bus. Commonly called by workers when scanning hosts like var
  @override
  Future<Map<String, dynamic>> postInteraction(
      {String? username,
      required String password,
      required List<String> hostScanData,
      required String serverAddress}) async {
    var _response = await HttpPostRequest.post(
      api: HostApi.postInteraction(serverAddress),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader:
            "Basic ${base64Encode(utf8.encode('$username:$password'))}"
      },
      content: hostScanData,
    );

    // await http.post(
    //   Uri.parse(
    //     HostApi.postInteraction(serverAddress),
    //   ),
    //   headers: {
    //     HttpHeaders.contentTypeHeader: "application/json",
    //     HttpHeaders.authorizationHeader:
    //         "Basic ${base64Encode(utf8.encode('$username:$password'))}"
    //   },
    //   body: json.encode(hostScanData),
    // );
    return _response;
  }

  /// Note : This Function Removes all hosts with a given downtime and minimum number of total scans from the bus
  @override
  Future<Map<String, dynamic>> removeHosts({
    String? username,
    required String password,
    required int minRecentScanFailures,
    required String maxDowntimeHours,
    required String serverAddress,
  }) async {
    var _response = await HttpPostRequest.post(
      api: HostApi.removeHosts(serverAddress),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader:
            "Basic ${base64Encode(utf8.encode('$username:$password'))}"
      },
      content: {
        "minRecentScanFailures": minRecentScanFailures,
        "maxDowntimeHours": maxDowntimeHours,
      },
    );

    // await http.post(
    //     Uri.parse(
    //       HostApi.removeHosts(serverAddress),
    //     ),
    //     headers: {
    //       HttpHeaders.contentTypeHeader: "application/json",
    //       HttpHeaders.authorizationHeader:
    //           "Basic ${base64Encode(utf8.encode('$username:$password'))}"
    //     },
    //     body: json.encode({
    //       "minRecentScanFailures": minRecentScanFailures,
    //       "maxDowntimeHours": maxDowntimeHours,
    //     }));
    return _response;
  }

  /// Note : This Function whose Updates the allowlist of the bus by adding/removing hosts by their public key
  @override
  Future<Map<String, dynamic>> updateAllowList({
    String? username,
    required String password,
    required List<String> addHostList,
    required List<String> removeHostList,
    required String serverAddress,
  }) async {
    var _response = await HttpUpdateRequest.put(
        api: HostApi.updateAllowList(serverAddress),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader:
              "Basic ${base64Encode(utf8.encode('$username:$password'))}"
        },
        content: {
          "add": addHostList,
          "remove": removeHostList,
          "clear": false,
        });

    // http.put(
    //     Uri.parse(
    //       HostApi.updateAllowList(serverAddress),
    //     ),
    //     headers: {
    //       HttpHeaders.contentTypeHeader: "application/json",
    //       HttpHeaders.authorizationHeader:
    //           "Basic ${base64Encode(utf8.encode('$username:$password'))}"
    //     },
    //     body: json.encode({
    //       "add": addHostList,
    //       "remove": removeHostList,
    //       "clear": false,
    //     }));
    return _response;
  }

  /// Note : This Function Updates the blocklist of the bus by adding/removing hosts by their domain or IP address
  @override
  Future<Map<String, dynamic>> updateBlockList({
    String? username,
    required String password,
    required List<String> addHostList,
    required List<String> removeHostList,
    required String serverAddress,
  }) async {
    var _response = await HttpUpdateRequest.put(
        api: HostApi.updateBlockList(serverAddress),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader:
              "Basic ${base64Encode(utf8.encode('$username:$password'))}"
        },
        content: {
          "add": addHostList,
          "remove": removeHostList,
          "clear": false,
        });
    // await http.put(
    //     Uri.parse(
    //       HostApi.updateBlockList(serverAddress),
    //     ),
    //     headers: {
    //       HttpHeaders.contentTypeHeader: "application/json",
    //       HttpHeaders.authorizationHeader:
    //           "Basic ${base64Encode(utf8.encode('$username:$password'))}"
    //     },
    //     body: json.encode({
    //       "add": addHostList,
    //       "remove": removeHostList,
    //       "clear": false,
    //     }));
    return _response;
  }

  /// Note : This Function help the user to get his personal host
  @override
  Future<Map<String, dynamic>> fetchSomeHost({
    String? username,
    required String password,
    required String serverAddress,
  }) async {
    var _response = await HttpGetRequest.get(
      api: HostApi.fetchSomeHost("gouging", serverAddress),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader:
            "Basic ${base64Encode(utf8.encode('$username:$password'))}"
      },
    );

    // await http.get(
    //   Uri.parse(
    //     HostApi.fetchSomeHost("gouging", serverAddress),
    //   ),
    //   headers: {
    //     HttpHeaders.contentTypeHeader: "application/json",
    //     HttpHeaders.authorizationHeader:
    //         "Basic ${base64Encode(utf8.encode('$username:$password'))}"
    //   },
    // );
    return _response;
  }

  /// Note : This Function help the user to configure some host
  @override
  Future<Map<String, dynamic>> updateSomeHost({
    String? username,
    required String password,
    required Map<String, dynamic> hostConfig,
    required String serverAddress,
  }) async {
    var _response = await HttpUpdateRequest.put(
      api: HostApi.updateSomeHost("gouging", serverAddress),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader:
            "Basic ${base64Encode(utf8.encode('$username:$password'))}"
      },
      content: hostConfig,
    );

    // await http.put(
    //     Uri.parse(
    //       HostApi.updateSomeHost("gouging", serverAddress),
    //     ),
    //     headers: {
    //       HttpHeaders.contentTypeHeader: "application/json",
    //       HttpHeaders.authorizationHeader:
    //           "Basic ${base64Encode(utf8.encode('$username:$password'))}"
    //     },
    //     body: json.encode(hostConfig));
    return _response;
  }
}
