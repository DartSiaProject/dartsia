import 'dart:convert';
import 'dart:io';

import 'package:injectable/injectable.dart';

import '../../../../../../shared/services/http/apis/renterd/bus/account_api.dart';
import '../../../../../../shared/services/http/requests/http_get_request.dart';
import '../../../../../../shared/services/http/requests/http_post_request.dart';
import '../abstract/accounts_abst.dart';

/// Project : [Renterd's Package]
/// Description : This file contains these Functionnalities [getAllAccounts, addDeposit, getAnAccountById, lockAnAccount, resetDrift, syncBalance, unLockAnAccount, updateBalance]
/// Author : [CotradeChain]
/// onCreated : 24/05/2023
/// onUpadted : 14/08/2023
/// AuthorCode : James Brel

@LazySingleton(as: AccountsAbst)
class AccountsImpl implements AccountsAbst {
  /// Note: This Function Returns all known ephemeral accounts from the bus like var
  @override
  Future<Map<String, dynamic>> getAllAccounts({
    String? username,
    required String password,
    required String serverAddress,
  }) async {
    var _response = await HttpGetRequest.get(
      api: AccountApi.getAccounts(serverAddress),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader:
            "Basic ${base64Encode(utf8.encode('$username:$password'))}"
      },
    );

    // http.get(
    //   Uri.parse(AccountApi.getAccounts(serverAddress)),
    //   headers: {
    //
    //     HttpHeaders.authorizationHeader:
    //         "Basic ${base64Encode(utf8.encode('$username:$password'))}"
    //   },
    // );
    return _response;
  }

  /// Note: This Function whose Endpoint used for depositing or withdrawing tokens into/from an ephemeral account. The caller should hold a non-exlusive lock on the account like var
  @override
  Future<Map<String, dynamic>> addDeposit({
    String? username,
    required String password,
    required String accountId,
    required String host,
    required int amount,
    required String serverAddress,
  }) async {
    var _response = await HttpPostRequest.post(
      api: AccountApi.addDeposit(accountId, serverAddress),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader:
            "Basic ${base64Encode(utf8.encode('$username:$password'))}"
      },
      content: {
        "host": host,
        "amount": amount,
      },
    );

    // await http.post(
    //     Uri.parse(AccountApi.addDeposit(accountId, serverAddress)),
    //     headers: {
    //
    //       HttpHeaders.authorizationHeader:
    //           "Basic ${base64Encode(utf8.encode('$username:$password'))}"
    //     },
    //     body: json.encode({
    //       "host": host,
    //       "amount": amount,
    //     }));
    return _response;
  }

  /// Note: This Function whose Returns the account with the given ID. If it doesn't exist, it will be created. The provided host's key will be attached to the account as additional metadata like var
  @override
  Future<Map<String, dynamic>> getAnAccountById({
    String? username,
    required String password,
    required String accountId,
    required String hostKey,
    required String serverAddress,
  }) async {
    var _response = await HttpPostRequest.post(
      api: AccountApi.getAnAccountById(accountId, serverAddress),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader:
            "Basic ${base64Encode(utf8.encode('$username:$password'))}"
      },
      content: {"hostKey": hostKey},
    );

    // await http.post(
    //     Uri.parse(AccountApi.getAnAccountById(accountId, serverAddress)),
    //     headers: {
    //
    //       HttpHeaders.authorizationHeader:
    //           "Basic ${base64Encode(utf8.encode('$username:$password'))}"
    //     },
    //     body: json.encode({"hostKey": hostKey}));
    return _response;
  }

  /// Note: This Function whose Commonly used by the worker, this endpoint allows for locking an account either exclusively or not like var
  @override
  Future<Map<String, dynamic>> lockAnAccount({
    String? username,
    required String password,
    required String accountId,
    required String hostKey,
    required bool exclusive,
    required String serverAddress,
  }) async {
    var _response = await HttpPostRequest.post(
      api: AccountApi.lockAnAccount(accountId, serverAddress),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader:
            "Basic ${base64Encode(utf8.encode('$username:$password'))}"
      },
      content: {
        "hostKey": hostKey,
        "exclusive": exclusive,
        "duration": "1000",
      },
    );

    //  await http.post(
    //     Uri.parse(AccountApi.lockAnAccount(accountId, serverAddress)),
    //     headers: {
    //
    //       HttpHeaders.authorizationHeader:
    //           "Basic ${base64Encode(utf8.encode('$username:$password'))}"
    //     },
    //     body: json.encode({
    //       "hostKey": hostKey,
    //       "exclusive": exclusive,
    //       "duration": "1000",
    //     }));
    return _response;
  }

  /// Note: This Function whose Resets the drift on ephemeral accounts. The drift tracks by how much Siacoin the expected balance of renterd differs from the host's over time. If the drift is too large, the autopilot refuses to pour more money into a host's account. Resetting the drift will cause the autopilot to fund the account again like var
  @override
  Future<Map<String, dynamic>> resetDrift({
    String? username,
    required String password,
    required String accountId,
    required String serverAddress,
  }) async {
    var _response = await HttpPostRequest.post(
      api: AccountApi.resetDrift(accountId, serverAddress),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader:
            "Basic ${base64Encode(utf8.encode('$username:$password'))}"
      },
    );

    // await http.post(
    //   Uri.parse(AccountApi.resetDrift(accountId, serverAddress)),
    //   headers: {
    //
    //     HttpHeaders.authorizationHeader:
    //         "Basic ${base64Encode(utf8.encode('$username:$password'))}"
    //   },
    // );
    return _response;
  }

  /// Note : This Function This endpoint marks the accoutn as requiring a balance sync. Usually set by workers when operations fail with an error indicating an insufficient balance
  @override
  Future<Map<String, dynamic>> syncBalance({
    String? username,
    required String password,
    required String accountId,
    required String host,
    required String serverAddress,
  }) async {
    var _response = await HttpPostRequest.post(
      api: AccountApi.syncBalance(accountId, serverAddress),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader:
            "Basic ${base64Encode(utf8.encode('$username:$password'))}"
      },
      content: {
        "host": host,
      },
    );

    // await http.post(Uri.parse(AccountApi.syncBalance(accountId, serverAddress)),
    //     headers: {
    //
    //       HttpHeaders.authorizationHeader:
    //           "Basic ${base64Encode(utf8.encode('$username:$password'))}"
    //     },
    //     body: json.encode({
    //       "host": host,
    //     }));
    return _response;
  }

  /// Note : This Function whose This is the counterpart to the account locking endpoint. The lock id returned when locking an account can be used to unlock it again before the locking duration has passed and the account gets unlocked automatically, like var
  @override
  Future<Map<String, dynamic>> unLockAnAccount({
    String? username,
    required String password,
    required String accountId,
    required String lockId,
    required String serverAddress,
  }) async {
    var _response = await HttpPostRequest.post(
      api: AccountApi.unLockAnAccount(accountId, serverAddress),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader:
            "Basic ${base64Encode(utf8.encode('$username:$password'))}"
      },
      content: {
        "lockID": BigInt.parse(lockId).toInt(),
      },
    );

    // await http.post(
    //     Uri.parse(AccountApi.unLockAnAccount(accountId, serverAddress)),
    //     headers: {
    //
    //       HttpHeaders.authorizationHeader:
    //           "Basic ${base64Encode(utf8.encode('$username:$password'))}"
    //     },
    //     body: json.encode({"lockID": BigInt.parse(lockId).toInt()}));
    return _response;
  }

  /// Note : This Function whose Updates the balance of an account to the provided value. The caller should acquire an exclusive lock before calling this endpoint, like var
  @override
  Future<Map<String, dynamic>> updateBalance({
    String? username,
    required String password,
    required String accountId,
    required String host,
    required int amount,
    required String serverAddress,
  }) async {
    var _response = await HttpPostRequest.post(
      api: AccountApi.updateBalance(accountId, serverAddress),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader:
            "Basic ${base64Encode(utf8.encode('$username:$password'))}"
      },
      content: {
        "host": host,
        "amount": amount,
      },
    );

    // await http.post(
    //     Uri.parse(AccountApi.updateBalance(accountId, serverAddress)),
    //     headers: {
    //
    //       HttpHeaders.authorizationHeader:
    //           "Basic ${base64Encode(utf8.encode('$username:$password'))}"
    //     },
    //     body: json.encode({
    //       "host": host,
    //       "amount": amount,
    //     }));
    return _response;
  }
}
