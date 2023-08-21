import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:renterd/src/apis/account_api.dart';
import 'package:renterd/src/services/accounts_impl.dart';

void main() async {
  late AccountsImpl _accountsImpl;
  late String _ipAdress;
  late String _username;
  late String _password;

  setUp(() {
    _accountsImpl = AccountsImpl();
    _ipAdress = "0a96-34-212-52-203";
    _username = "";
    _password = "Vykuj3546@";

    // todo :  ip local "127.0.0.1";
  });

  group(
    'AccoutsImpl =>',
    () {
      // write tests
      test(
        'the getAllAccounts function returns all known ephemeral accounts from the bus into',
        () async {
          http.Response _response = await http.get(
            Uri.parse(getAccountsApi(_ipAdress)),
            headers: {
              HttpHeaders.contentTypeHeader: "application/json",
              HttpHeaders.authorizationHeader:
                  "Basic ${base64Encode(utf8.encode('$_username:$_password'))}"
            },
          );

          final verifyValue = await _accountsImpl.getAllAccounts(
            password: _password,
            ipAdress: _ipAdress,
          );

          expect(
            _response.statusCode,
            verifyValue.statusCode,
          );
        },
      );

      test(
        "the getAnAccountById function Returns the account with the given ID. If it doesn't exist, it will be created. The provided host's key will be attached to the account as additional metadata like http.Response",
        () async {
          http.Response _response = await http.post(
              Uri.parse(getAnAccountByIdApi(
                  "ed25519:99611c808ccb74402f0c80ea0b22cefe3b46a73abe1072c90687658d44dead75",
                  _ipAdress)),
              headers: {
                HttpHeaders.contentTypeHeader: "application/json",
                HttpHeaders.authorizationHeader:
                    "Basic ${base64Encode(utf8.encode('$_username:$_password'))}"
              },
              body: json.encode({
                "hostKey":
                    "ed25519:0c920d0254011f1065eeb99aa909c644b991780c1155ce0aa34cce09e6eabdc9"
              }));

          final verifyValue = await _accountsImpl.getAnAccountById(
              password: _password,
              accountId:
                  'ed25519:99611c808ccb74402f0c80ea0b22cefe3b46a73abe1072c90687658d44dead75',
              hostKey:
                  "ed25519:0c920d0254011f1065eeb99aa909c644b991780c1155ce0aa34cce09e6eabdc9",
              ipAdress: _ipAdress);

          expect(
            _response.statusCode,
            verifyValue.statusCode,
          );
        },
      );

      test(
        "the lockAnAccount This Function whose Commonly used by the worker, this endpoint allows for locking an account either exclusively or not like http.Response",
        () async {
          http.Response _response = await http.post(
              Uri.parse(
                lockAnAccountApi(
                    "ed25519:99611c808ccb74402f0c80ea0b22cefe3b46a73abe1072c90687658d44dead75",
                    _ipAdress),
              ),
              headers: {
                HttpHeaders.contentTypeHeader: "application/json",
                HttpHeaders.authorizationHeader:
                    "Basic ${base64Encode(utf8.encode('$_username:$_password'))}"
              },
              body: json.encode({
                "hostKey":
                    "ed25519:0c920d0254011f1065eeb99aa909c644b991780c1155ce0aa34cce09e6eabdc9",
                "exclusive": false,
                "duration": "1000",
              }));

          final verifyValue = await _accountsImpl.lockAnAccount(
            password: _password,
            accountId:
                'ed25519:99611c808ccb74402f0c80ea0b22cefe3b46a73abe1072c90687658d44dead75',
            hostKey:
                "ed25519:0c920d0254011f1065eeb99aa909c644b991780c1155ce0aa34cce09e6eabdc9",
            exclusive: false,
            ipAdress: _ipAdress,
          );

          expect(
            _response.statusCode,
            verifyValue.statusCode,
          );
        },
      );

      test(
        "the resetDrift This Function whose Resets the drift on ephemeral accounts. The drift tracks by how much Siacoin the expected balance of renterd differs from the host's over time. If the drift is too large, the autopilot refuses to pour more money into a host's account. Resetting the drift will cause the autopilot to fund the account again like http.Response",
        () async {
          http.Response _response = await http.post(
            Uri.parse(
              resetDriftApi(
                  "ed25519:99611c808ccb74402f0c80ea0b22cefe3b46a73abe1072c90687658d44dead75",
                  _ipAdress),
            ),
            headers: {
              HttpHeaders.contentTypeHeader: "application/json",
              HttpHeaders.authorizationHeader:
                  "Basic ${base64Encode(utf8.encode('$_username:$_password'))}"
            },
          );

          final verifyValue = await _accountsImpl.resetDrift(
            password: _password,
            accountId:
                'ed25519:99611c808ccb74402f0c80ea0b22cefe3b46a73abe1072c90687658d44dead75',
            ipAdress: _ipAdress,
          );

          expect(
            _response.statusCode,
            verifyValue.statusCode,
          );
        },
      );

      test(
        "the unlock account This Function whose This is the counterpart to the account locking endpoint. The lock id returned when locking an account can be used to unlock it again before the locking duration has passed and the account gets unlocked automatically, like http.Response",
        () async {
          http.Response _response = await http.post(
              Uri.parse(unLockAnAccountApi(
                  "ed25519:99611c808ccb74402f0c80ea0b22cefe3b46a73abe1072c90687658d44dead75",
                  _ipAdress)),
              headers: {
                HttpHeaders.contentTypeHeader: "application/json",
                HttpHeaders.authorizationHeader:
                    "Basic ${base64Encode(utf8.encode('$_username:$_password'))}"
              },
              body: json.encode(
                  {"lockID": BigInt.parse('13874228167312385374').toInt()}));

          final verifyValue = await _accountsImpl.unLockAnAccount(
            password: _password,
            accountId:
                'ed25519:99611c808ccb74402f0c80ea0b22cefe3b46a73abe1072c90687658d44dead75',
            lockId: '13874228167312385374',
            ipAdress: _ipAdress,
          );

          expect(
            _response.statusCode,
            verifyValue.statusCode,
          );
        },
      );
      test(
        "updateBalance This Function whose Updates the balance of an account to the provided value. The caller should acquire an exclusive lock before calling this endpoint, like http.Response",
        () async {
          http.Response _response = await http.post(
              Uri.parse(updateBalanceApi(
                  "ed25519:99611c808ccb74402f0c80ea0b22cefe3b46a73abe1072c90687658d44dead75",
                  _ipAdress)),
              headers: {
                HttpHeaders.contentTypeHeader: "application/json",
                HttpHeaders.authorizationHeader:
                    "Basic ${base64Encode(utf8.encode('$_username:$_password'))}"
              },
              body: json.encode({
                "host":
                    "ed25519:0c920d0254011f1065eeb99aa909c644b991780c1155ce0aa34cce09e6eabdc9",
                "amount": 1000000
              }));

          final verifyValue = await _accountsImpl.updateBalance(
            password: _password,
            accountId:
                'ed25519:99611c808ccb74402f0c80ea0b22cefe3b46a73abe1072c90687658d44dead75',
            amount: 1000000,
            host:
                'ed25519:0c920d0254011f1065eeb99aa909c644b991780c1155ce0aa34cce09e6eabdc9',
            ipAdress: _ipAdress,
          );

          expect(
            _response.statusCode,
            verifyValue.statusCode,
          );
        },
      );

      test(
        "syncBalance This Function This endpoint marks the accoutn as requiring a balance sync. Usually set by workers when operations fail with an error indicating an insufficient balance ",
        () async {
          http.Response _response = await http.post(
              Uri.parse(syncBalanceApi(
                  "ed25519:99611c808ccb74402f0c80ea0b22cefe3b46a73abe1072c90687658d44dead75",
                  _ipAdress)),
              headers: {
                HttpHeaders.contentTypeHeader: "application/json",
                HttpHeaders.authorizationHeader:
                    "Basic ${base64Encode(utf8.encode('$_username:$_password'))}"
              },
              body: json.encode({
                "host":
                    "ed25519:0c920d0254011f1065eeb99aa909c644b991780c1155ce0aa34cce09e6eabdc9",
              }));

          final verifyValue = await _accountsImpl.syncBalance(
            password: _password,
            accountId:
                'ed25519:99611c808ccb74402f0c80ea0b22cefe3b46a73abe1072c90687658d44dead75',
            host:
                'ed25519:0c920d0254011f1065eeb99aa909c644b991780c1155ce0aa34cce09e6eabdc9',
            ipAdress: _ipAdress,
          );

          expect(
            _response.statusCode,
            verifyValue.statusCode,
          );
        },
      );
      test(
        "addDeposit This Function whose Endpoint used for depositing or withdrawing tokens into/from an ephemeral account. The caller should hold a non-exlusive lock on the account like http.Response",
        () async {
          http.Response _response = await http.post(
              Uri.parse(addDepositApi(
                  "ed25519:99611c808ccb74402f0c80ea0b22cefe3b46a73abe1072c90687658d44dead75",
                  _ipAdress)),
              headers: {
                HttpHeaders.contentTypeHeader: "application/json",
                HttpHeaders.authorizationHeader:
                    "Basic ${base64Encode(utf8.encode('$_username:$_password'))}"
              },
              body: json.encode({
                "host":
                    "ed25519:0c920d0254011f1065eeb99aa909c644b991780c1155ce0aa34cce09e6eabdc9",
                "amount": 1000000
              }));

          final verifyValue = await _accountsImpl.addDeposit(
              password: _password,
              accountId:
                  'ed25519:99611c808ccb74402f0c80ea0b22cefe3b46a73abe1072c90687658d44dead75',
              host:
                  "ed25519:0c920d0254011f1065eeb99aa909c644b991780c1155ce0aa34cce09e6eabdc9",
              amount: 1000000,
              ipAdress: _ipAdress);

          expect(
            _response.statusCode,
            verifyValue.statusCode,
          );
        },
      );
    },
  );
}
