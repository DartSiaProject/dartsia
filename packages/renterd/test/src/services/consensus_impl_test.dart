import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:renterd/src/apis/consensus_api.dart';
import 'package:renterd/src/services/consensus_impl.dart';

void main() async {
  late ConsensusImpl _consensusImpl;
  late String _ipAdress;

  setUp(() {
    _consensusImpl = ConsensusImpl();
    _ipAdress = "127.0.0.1";
  });

  group('ConsensusImpl => ', () {
    // write tests

    test(
      "the acceptBlock function whose Accepts a mined block. Upon success, the block is forwarded to the node's peers and the whole p2p network like http.Response",
      () async {
        String? username;
        String password = "renterd";
        http.Response _response = await http.post(
          Uri.parse(postAcceptBlockApi(_ipAdress)),
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader:
                "Basic ${base64Encode(utf8.encode('$username:$password'))}"
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
                  "SiacoinInputs": [],
                  "SiacoinOutputs": [],
                  "FileContracts": [],
                  "FileContractRevisions": [],
                  "StorageProofs": [],
                  "SiafundInputs": [],
                  "SiafundOutputs": [],
                  "MinerFees": [],
                  "ArbitraryData": [
                    "Tm9uU2lhAAAAAAAAAAAAADuAtj8zRWfR3ulRHvz7fb0="
                  ],
                  "Signatures": []
                }
              ]
            },
          ),
        );

        final verifyValue = await _consensusImpl.acceptBlock(
          password: 'renterd',
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
        String? username;
        String password = "renterd";
        http.Response _response = await http.get(
          Uri.parse(getTotalPayoutApi(100000000, _ipAdress)),
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader:
                "Basic ${base64Encode(utf8.encode('$username:$password'))}"
          },
        );

        final verifyValue = await _consensusImpl.getSiaFundFee(
          password: 'renterd',
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
        String? username;
        String password = "renterd";
        http.Response _response = await http.get(
          Uri.parse(getStateApi(_ipAdress)),
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader:
                "Basic ${base64Encode(utf8.encode('$username:$password'))}"
          },
        );

        final verifyValue = await _consensusImpl.getState(
          password: 'renterd',
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
