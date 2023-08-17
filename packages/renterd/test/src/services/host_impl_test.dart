import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:renterd/src/apis/host_api.dart';
import 'package:renterd/src/services/hoster_impl.dart';

void main() async {
  late HosterImpl _hosterImpl;
  late String _ipAdress;

  setUp(() {
    _hosterImpl = HosterImpl();
    _ipAdress = "127.0.0.1";
  });

  group('HosterIml => ', () {
    // write tests
    test(
      "the getAllowList function whose Returns the current allowlist of the bus like http.Response",
      () async {
        String? username;
        String password = "renterd";
        http.Response _response = await http.get(
          Uri.parse(
            getAllowListApi(_ipAdress),
          ),
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader:
                "Basic ${base64Encode(utf8.encode('$username:$password'))}"
          },
        );

        final verifyValue = await _hosterImpl.getAllowList(
          password: 'renterd',
          ipAdress: _ipAdress,
        );

        expect(
          _response.statusCode,
          verifyValue.statusCode,
        );
      },
    );
    test(
      "the getBlockList function whose Returns the current blocklist of the bus like http.Response",
      () async {
        String? username;
        String password = "renterd";
        http.Response _response = await http.get(
          Uri.parse(
            getBlockListApi(_ipAdress),
          ),
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader:
                "Basic ${base64Encode(utf8.encode('$username:$password'))}"
          },
        );

        final verifyValue = await _hosterImpl.getBlockList(
          password: 'renterd',
          ipAdress: _ipAdress,
        );

        expect(
          _response.statusCode,
          verifyValue.statusCode,
        );
      },
    );
    test(
      "the getHostInfoByPublicKey function whose Returns some information about the host identified by a given public key like http.Response",
      () async {
        String? username;
        String password = "renterd";
        http.Response _response = await http.get(
          Uri.parse(
            getHostInfoByPublicKeyApi(
                "ed25519:b050c0c63f9f3b4d5a89acadf628e8d8c6f8768e38fbe731e429334e0fd2cece",
                _ipAdress),
          ),
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader:
                "Basic ${base64Encode(utf8.encode('$username:$password'))}"
          },
        );

        final verifyValue = await _hosterImpl.getHostInfoByPublicKey(
          password: 'renterd',
          publicKey:
              "ed25519:b050c0c63f9f3b4d5a89acadf628e8d8c6f8768e38fbe731e429334e0fd2cece",
          ipAdress: _ipAdress,
        );

        expect(
          _response.statusCode,
          verifyValue.statusCode,
        );
      },
    );
    test(
      "the getHostScannig function whose Returns a list of hosts for scanning. Hosts that have been scanned recently can be ignored by adjusting the lastScan argument like http.Response",
      () async {
        String? username;
        String password = "renterd";
        http.Response _response = await http.get(
          Uri.parse(
            getHostsScanningApi(
                0, 10, "2023-03-30T15%3A45%3A52%2B02%3A00", _ipAdress),
          ),
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader:
                "Basic ${base64Encode(utf8.encode('$username:$password'))}"
          },
        );

        final verifyValue = await _hosterImpl.getHostScannig(
          password: 'renterd',
          lastScan: "2023-03-30T15%3A45%3A52%2B02%3A00",
          limit: 10,
          offset: 0,
          ipAdress: _ipAdress,
        );

        expect(
          _response.statusCode,
          verifyValue.statusCode,
        );
      },
    );
    test(
      "the getHosts function whose Returns information about all hosts known to the bus like http.Response",
      () async {
        String? username;
        String password = "renterd";
        http.Response _response = await http.get(
          Uri.parse(
            getHostsApi(_ipAdress),
          ),
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader:
                "Basic ${base64Encode(utf8.encode('$username:$password'))}"
          },
        );

        final verifyValue = await _hosterImpl.getHosts(
          password: 'renterd',
          ipAdress: _ipAdress,
        );

        expect(
          _response.statusCode,
          verifyValue.statusCode,
        );
      },
    );

    test(
      "the postInteraction function whose Records host ineractions in the bus. Commonly called by workers when scanning hosts like http.Response",
      () async {
        String? username;
        String password = "renterd";
        http.Response _response = await http.post(
            Uri.parse(
              postInteractionApi(_ipAdress),
            ),
            headers: {
              HttpHeaders.contentTypeHeader: "application/json",
              HttpHeaders.authorizationHeader:
                  "Basic ${base64Encode(utf8.encode('$username:$password'))}"
            },
            body: json.encode([]));

        final verifyValue = await _hosterImpl.postInteraction(
          password: 'renterd',
          hostScanData: [],
          ipAdress: _ipAdress,
        );

        expect(
          _response.statusCode,
          verifyValue.statusCode,
        );
      },
    );

    test(
      "the removeHosts function whose Removes all hosts with a given downtime and minimum number of total scans from the bus",
      () async {
        String? username;
        String password = "renterd";
        http.Response _response = await http.post(
            Uri.parse(
              removeHostsApi(_ipAdress),
            ),
            headers: {
              HttpHeaders.contentTypeHeader: "application/json",
              HttpHeaders.authorizationHeader:
                  "Basic ${base64Encode(utf8.encode('$username:$password'))}"
            },
            body: json.encode({
              "minRecentScanFailures": 3,
              "maxDowntimeHours": "1000",
            }));

        final verifyValue = await _hosterImpl.removeHosts(
          password: 'renterd',
          maxDowntimeHours: '1000',
          minRecentScanFailures: 3,
          ipAdress: _ipAdress,
        );

        expect(
          _response.statusCode,
          verifyValue.statusCode,
        );
      },
    );
    test(
      "the updateAllowList function whose Updates the allowlist of the bus by adding/removing hosts by their public key",
      () async {
        String? username;
        String password = "renterd";
        http.Response _response = await http.put(
            Uri.parse(
              updateAllowListApi(_ipAdress),
            ),
            headers: {
              HttpHeaders.contentTypeHeader: "application/json",
              HttpHeaders.authorizationHeader:
                  "Basic ${base64Encode(utf8.encode('$username:$password'))}"
            },
            body: json.encode({
              "add": [],
              "remove": [
                "ed25519:6f7ac63891fa2eadeb3031b75817a4beaae91070f485c3d139f1ffd3107d6aa8"
              ],
              "clear": false
            }));

        final verifyValue = await _hosterImpl.updateAllowList(
          password: 'renterd',
          addHostList: [],
          removeHostList: [
            "ed25519:6f7ac63891fa2eadeb3031b75817a4beaae91070f485c3d139f1ffd3107d6aa8"
          ],
          ipAdress: _ipAdress,
        );

        expect(
          _response.statusCode,
          verifyValue.statusCode,
        );
      },
    );
    test(
      "the updateBlockList function whose Updates the blocklist of the bus by adding/removing hosts by their domain or IP address",
      () async {
        String? username;
        String password = "renterd";
        http.Response _response = await http.put(
            Uri.parse(
              updateBlockListApi(_ipAdress),
            ),
            headers: {
              HttpHeaders.contentTypeHeader: "application/json",
              HttpHeaders.authorizationHeader:
                  "Basic ${base64Encode(utf8.encode('$username:$password'))}"
            },
            body: json.encode({
              "add": [],
              "remove": [
                "siacentral.ddnsfree.com",
                "siacentral.mooo.com",
                "51.158.108.244",
                "45.148.30.56"
              ],
              "clear": false
            }));

        final verifyValue = await _hosterImpl.updateBlockList(
          password: 'renterd',
          addHostList: [],
          removeHostList: [
            "siacentral.ddnsfree.com",
            "siacentral.mooo.com",
            "51.158.108.244",
            "45.148.30.56"
          ],
          ipAdress: _ipAdress,
        );

        expect(
          _response.statusCode,
          verifyValue.statusCode,
        );
      },
    );

    test('the fetchSomeHost function helps the user to get his host', () async {
      String? username;
      String password = "renterd";
      http.Response _response = await http.get(
        Uri.parse(
          fetchSomeHostApi("gouging", _ipAdress),
        ),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader:
              "Basic ${base64Encode(utf8.encode('$username:$password'))}"
        },
      );

      print(_response.statusCode);

      final verifyValue = await _hosterImpl.fetchSomeHost(
          password: 'renterd', ipAdress: _ipAdress);

      expect(
        _response.statusCode,
        verifyValue.statusCode,
      );
    });

    test('the fetchSomeHost function helps the user to update some host',
        () async {
      String? username;
      String password = "renterd";
      http.Response _response = await http.put(
        Uri.parse(
          updateSomeHostApi("gouging", _ipAdress),
        ),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader:
              "Basic ${base64Encode(utf8.encode('$username:$password'))}"
        },
        body: json.encode({}),
      );

      final verifyValue = await _hosterImpl.updateSomeHost(
          password: 'renterd', hostConfig: {}, ipAdress: _ipAdress);

      expect(
        _response.statusCode,
        verifyValue.statusCode,
      );
    });
  });
}
