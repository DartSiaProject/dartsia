import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:renterd/src/modules/renterd_mod/features/bus/data/abstract/notification_abst.dart';
import 'package:renterd/src/shared/services/http/apis/renterd/bus/notification_api.dart';
import 'package:renterd/src/shared/services/http/requests/http_post_request.dart';

import '../../../../../../shared/services/cryptography/requests/encrypt_request.dart';
import '../../../../../../shared/services/http/requests/http_get_request.dart';

/// Project : [Renterd's Package]
/// Description: The current file contents these features [findAll, dismissList]
/// which are responsible for fetching all available notifications from the bus and
/// dismissing a list of notifications from the bus respectively.
/// Author: [Flashelperz]
/// Created on: [10/03/2025]
/// Updated on: [10/03/2025]
/// Updated by: [Flashelperz]
@LazySingleton(as: NotificationAbst)
class NotificationImpl implements NotificationAbst {
  /// Get the list of all available notifications from the bus
  /// limited by a specific number (10 by default)
  ///
  @override
  Future<Map<String, dynamic>> findAll({
    required String serverAddress,
    required String key,
    required String iv,
    int limit = 10,
    int offset = 0,
  }) async {
    var _headers = EncryptRequest.encryptStringWithAES256CBC(
      data: json.encode({
        "content-type": "application/json",
      }),
      key: key,
      iv: iv,
    );
    var _response = await HttpGetRequest.get<String>(
      api: "$serverAddress${NotificationApi.findAll}",
      queryParameters: {
        "header": _headers,
        "limit": limit,
        "offset": offset,
      },
    );

    return _response;
  }

  /// Dismiss a list of notifications from the bus
  ///
  @override
  Future<Map<String, dynamic>> dismissList({
    required String serverAddress,
    required String key,
    required String iv,
    required List<String> ids,
  }) async {
    var _headers = EncryptRequest.encryptStringWithAES256CBC(
      data: json.encode({
        "content-type": "application/json",
      }),
      key: key,
      iv: iv,
    );

    var _contents = EncryptRequest.encryptStringWithAES256CBC(
      data: json.encode(ids),
      key: key,
      iv: iv,
    );

    var _response = await HttpPostRequest.post<String>(
      api: "$serverAddress${NotificationApi.dismissList}",
      queryParameters: {
        "header": _headers,
      },
      content: json.encode({
        "data": _contents,
      }),
    );

    return _response;
  }
}
