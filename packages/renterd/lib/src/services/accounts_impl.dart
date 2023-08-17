import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../abstract/accounts_abst.dart';
import '../apis/account_api.dart';

/// Project : [Renterd's Package]
/// Description : This file contains these Functionnalities [getAllAccounts, addDeposit, getAnAccountById, lockAnAccount, resetDrift, syncBalance, unLockAnAccount, updateBalance]
/// Author : [CotradeChain]
/// onCreated : 24/05/2023
/// onUpadted : 14/08/2023
/// AuthorCode : James Brel
class AccountsImpl implements AccountsAbst {
  /// Note: This Function Returns all known ephemeral accounts from the bus like http.Response
  @override
  Future<http.Response> getAllAccounts({
    String? username,
    required String password,
    required String ipAdress,
  }) async {
    http.Response _response = await http.get(
      Uri.parse(getAccountsApi(ipAdress)),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader:
            "Basic ${base64Encode(utf8.encode('$username:$password'))}"
      },
    );
    return _response;
  }

  /// Note: This Function whose Endpoint used for depositing or withdrawing tokens into/from an ephemeral account. The caller should hold a non-exlusive lock on the account like http.Response
  @override
  Future<http.Response> addDeposit({
    String? username,
    required String password,
    required String accountId,
    required String host,
    required int amount,
    required String ipAdress,
  }) async {
    http.Response _response =
        await http.post(Uri.parse(addDepositApi(accountId, ipAdress)),
            headers: {
              HttpHeaders.contentTypeHeader: "application/json",
              HttpHeaders.authorizationHeader:
                  "Basic ${base64Encode(utf8.encode('$username:$password'))}"
            },
            body: json.encode({
              "host": host,
              "amount": amount,
            }));
    return _response;
  }

  /// Note: This Function whose Returns the account with the given ID. If it doesn't exist, it will be created. The provided host's key will be attached to the account as additional metadata like http.Response
  @override
  Future<http.Response> getAnAccountById({
    String? username,
    required String password,
    required String accountId,
    required String hostKey,
    required String ipAdress,
  }) async {
    http.Response _response =
        await http.post(Uri.parse(getAnAccountByIdApi(accountId, ipAdress)),
            headers: {
              HttpHeaders.contentTypeHeader: "application/json",
              HttpHeaders.authorizationHeader:
                  "Basic ${base64Encode(utf8.encode('$username:$password'))}"
            },
            body: json.encode({"hostKey": hostKey}));
    return _response;
  }

  /// Note: This Function whose Commonly used by the worker, this endpoint allows for locking an account either exclusively or not like http.Response
  @override
  Future<http.Response> lockAnAccount({
    String? username,
    required String password,
    required String accountId,
    required String hostKey,
    required bool exclusive,
    required String ipAdress,
  }) async {
    http.Response _response =
        await http.post(Uri.parse(lockAnAccountApi(accountId, ipAdress)),
            headers: {
              HttpHeaders.contentTypeHeader: "application/json",
              HttpHeaders.authorizationHeader:
                  "Basic ${base64Encode(utf8.encode('$username:$password'))}"
            },
            body: json.encode({
              "hostKey": hostKey,
              "exclusive": exclusive,
              "duration": "1000",
            }));
    return _response;
  }

  /// Note: This Function whose Resets the drift on ephemeral accounts. The drift tracks by how much Siacoin the expected balance of renterd differs from the host's over time. If the drift is too large, the autopilot refuses to pour more money into a host's account. Resetting the drift will cause the autopilot to fund the account again like http.Response
  @override
  Future<http.Response> resetDrift({
    String? username,
    required String password,
    required String accountId,
    required String ipAdress,
  }) async {
    http.Response _response = await http.post(
      Uri.parse(resetDriftApi(accountId, ipAdress)),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader:
            "Basic ${base64Encode(utf8.encode('$username:$password'))}"
      },
    );
    return _response;
  }

  /// Note : This Function This endpoint marks the accoutn as requiring a balance sync. Usually set by workers when operations fail with an error indicating an insufficient balance
  @override
  Future<http.Response> syncBalance({
    String? username,
    required String password,
    required String accountId,
    required String host,
    required String ipAdress,
  }) async {
    http.Response _response =
        await http.post(Uri.parse(syncBalanceApi(accountId, ipAdress)),
            headers: {
              HttpHeaders.contentTypeHeader: "application/json",
              HttpHeaders.authorizationHeader:
                  "Basic ${base64Encode(utf8.encode('$username:$password'))}"
            },
            body: json.encode({
              "host": host,
            }));
    return _response;
  }

  /// Note : This Function whose This is the counterpart to the account locking endpoint. The lock id returned when locking an account can be used to unlock it again before the locking duration has passed and the account gets unlocked automatically, like http.Response
  @override
  Future<http.Response> unLockAnAccount({
    String? username,
    required String password,
    required String accountId,
    required String lockId,
    required String ipAdress,
  }) async {
    http.Response _response =
        await http.post(Uri.parse(unLockAnAccountApi(accountId, ipAdress)),
            headers: {
              HttpHeaders.contentTypeHeader: "application/json",
              HttpHeaders.authorizationHeader:
                  "Basic ${base64Encode(utf8.encode('$username:$password'))}"
            },
            body: json.encode({"lockID": BigInt.parse(lockId).toInt()}));
    return _response;
  }

  /// Note : This Function whose Updates the balance of an account to the provided value. The caller should acquire an exclusive lock before calling this endpoint, like http.Response
  @override
  Future<http.Response> updateBalance({
    String? username,
    required String password,
    required String accountId,
    required String host,
    required int amount,
    required String ipAdress,
  }) async {
    http.Response _response =
        await http.post(Uri.parse(updateBalanceApi(accountId, ipAdress)),
            headers: {
              HttpHeaders.contentTypeHeader: "application/json",
              HttpHeaders.authorizationHeader:
                  "Basic ${base64Encode(utf8.encode('$username:$password'))}"
            },
            body: json.encode({
              "host": host,
              "amount": amount,
            }));
    return _response;
  }
}
