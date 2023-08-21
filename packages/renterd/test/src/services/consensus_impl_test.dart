import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:renterd/src/apis/consensus_api.dart';
import 'package:renterd/src/services/consensus_impl.dart';

void main() async {
  late ConsensusImpl _consensusImpl;
  late String _ipAdress;
  late String _username;
  late String _password;

  setUp(() {
    _consensusImpl = ConsensusImpl();
    _ipAdress = "0a96-34-212-52-203";
    _username = "";
    _password = "Vykuj3546@";

    // todo :  ip local "127.0.0.1";
  });

  group('ConsensusImpl => ', () {
    // write tests

    test(
      "the acceptBlock function whose Accepts a mined block. Upon success, the block is forwarded to the node's peers and the whole p2p network like http.Response",
      () async {
        http.Response _response = await http.post(
          Uri.parse(postAcceptBlockApi(_ipAdress)),
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader:
                "Basic ${base64Encode(utf8.encode('$_username:$_password'))}"
          },
          body: json.encode(
            {
              "ParentID":
                  "bid:56e4d337f8554ce34071743b1976e164da01728d824b4963761154c965fb5625",
              "Nonce": 0,
              "Timestamp": DateTime.now().toString(),
              "MinerPayouts": [
                {
                  "Value": "299999000000000000000000000000",
                  "Address":
                      "addr:162a2c565d0c10997ad21697c78c80688807296b09ea599f402c2304730ee6f67563d7c53145",
                }
              ],
              "Transactions": [
                {
                  "SiacoinInputs": <dynamic>[],
                  "SiacoinOutputs": <dynamic>[],
                  "FileContracts": <dynamic>[],
                  "FileContractRevisions": <dynamic>[],
                  "StorageProofs": <dynamic>[],
                  "SiafundInputs": <dynamic>[],
                  "SiafundOutputs": <dynamic>[],
                  "MinerFees": <dynamic>[],
                  "ArbitraryData": [
                    "Tm9uU2lhAAAAAAAAAAAAADuAtj8zRWfR3ulRHvz7fb0="
                  ],
                  "Signatures": <dynamic>[]
                }
              ]
            },
          ),
        );

        final verifyValue = await _consensusImpl.acceptBlock(
          password: _password,
          address:
              "addr:162a2c565d0c10997ad21697c78c80688807296b09ea599f402c2304730ee6f67563d7c53145",
          arbitraryDataList: ["Tm9uU2lhAAAAAAAAAAAAADuAtj8zRWfR3ulRHvz7fb0="],
          parentId:
              "bid:56e4d337f8554ce34071743b1976e164da01728d824b4963761154c965fb5625",
          value: "299999000000000000000000000000",
          ipAdress: _ipAdress,
        );

        expect(
          _response.statusCode,
          verifyValue.statusCode,
        );
      },
    );

    test(
      "the getSiaFundFee function whose Given the total payout of a contract, this endpoint returns the appropriate siafund fee to pay like http.Response",
      () async {
        http.Response _response = await http.get(
          Uri.parse(getTotalPayoutApi(100000000, _ipAdress)),
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader:
                "Basic ${base64Encode(utf8.encode('$_username:$_password'))}"
          },
        );

        final verifyValue = await _consensusImpl.getSiaFundFee(
          password: _password,
          payout: 100000000,
          ipAdress: _ipAdress,
        );

        expect(
          _response.statusCode,
          verifyValue.statusCode,
        );
      },
    );
    test(
      "the getState function whose Returns some info regarding the current state of the consensus like http.Response",
      () async {
        http.Response _response = await http.get(
          Uri.parse(getStateApi(_ipAdress)),
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader:
                "Basic ${base64Encode(utf8.encode('$_username:$_password'))}"
          },
        );

        final verifyValue = await _consensusImpl.getState(
          password: _password,
          ipAdress: _ipAdress,
        );

        expect(
          _response.statusCode,
          verifyValue.statusCode,
        );
      },
    );
  });
}
