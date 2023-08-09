import 'dart:convert';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:renterd/src/apis/contracts_api.dart';
import 'package:renterd/src/data/services/contract_impl.dart';
import 'package:renterd/src/injection.dart' as insert;

void main() async {
  await insert.initialization();
  late ContractImpl _contractImpl;

  setUp(() {
    _contractImpl = ContractImpl();
  });

  group('ContractImpl => ', () {
    // write tests

    test(
      "the acquireAContract function whose Acquires a contract for up to a given duration. Similar to ephemeral accounts, contracts can be unlocked ahead of time using the unlock endpoint with the returned lock id like http.Response",
      () async {
        String? username;
        String password = "renterd";
        http.Response _response = await http.post(
          Uri.parse(
              "${dotenv.env['ROOT_URL']}${acquireAContractApi("fcid:06025daad00bb361df5a897b33a82ec24f61499757a3a4b7053a921314b9099b")}"),
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader:
                "Basic ${base64Encode(utf8.encode('$username:$password'))}"
          },
          body: json.encode({
            "duration": "10000",
            "priority": 10,
          }),
        );

        final verifyValue = await _contractImpl.acquireAContract(
          password: 'renterd',
          duration: "10000",
          id: 'fcid:06025daad00bb361df5a897b33a82ec24f61499757a3a4b7053a921314b9099b',
          priority: 10,
        );

        expect(
          _response.statusCode,
          verifyValue.statusCode,
        );
      },
    );
    test(
      "the addContract function whose Adds a contract to the bus. Usually called by workers after forming a new contract like http.Response",
      () async {
        String? username;
        String password = "renterd";
        http.Response _response = await http.post(
          Uri.parse(
              "${dotenv.env['ROOT_URL']}${postContractsApi("fcid:06025daad00bb361df5a897b33a82ec24f61499757a3a4b7053a921314b9099b")}"),
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader:
                "Basic ${base64Encode(utf8.encode('$username:$password'))}"
          },
          body: json.encode(
            {
              "contract": {},
              "startHeight": 53,
              "totalCost": "16666666666666666666666666"
            },
          ),
        );

        final verifyValue = await _contractImpl.addContract(
          password: 'renterd',
          contract: {},
          id: 'fcid:06025daad00bb361df5a897b33a82ec24f61499757a3a4b7053a921314b9099b',
          startHeight: 53,
          totalCost: "16666666666666666666666666",
        );

        expect(
          _response.statusCode,
          verifyValue.statusCode,
        );
      },
    );
    test(
      "the deleteContractById function whose Deletes a contract from the bus. This doesn't remove the contract from the blockchain. The bus only stops being aware of the contract's existence and will therefore stop using it like http.Response",
      () async {
        String? username;
        String password = "renterd";
        http.Response _response = await http.delete(
          Uri.parse(
              "${dotenv.env['ROOT_URL']}${deleteContractByIdApi("fcid:06025daad00bb361df5a897b33a82ec24f61499757a3a4b7053a921314b9099b")}"),
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader:
                "Basic ${base64Encode(utf8.encode('$username:$password'))}"
          },
        );

        final verifyValue = await _contractImpl.deleteContractById(
          password: 'renterd',
          id: 'fcid:06025daad00bb361df5a897b33a82ec24f61499757a3a4b7053a921314b9099b',
        );

        expect(
          _response.statusCode,
          verifyValue.statusCode,
        );
      },
    );

    test(
      "the getContractById function whose Returns contract metadata for an active contract with the provided contract id like http.Response",
      () async {
        String? username;
        String password = "renterd";
        http.Response _response = await http.get(
          Uri.parse(
              "${dotenv.env['ROOT_URL']}${getContractByIdApi("fcid:06025daad00bb361df5a897b33a82ec24f61499757a3a4b7053a921314b9099b")}"),
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader:
                "Basic ${base64Encode(utf8.encode('$username:$password'))}"
          },
        );

        final verifyValue = await _contractImpl.getContractById(
          password: 'renterd',
          id: 'fcid:06025daad00bb361df5a897b33a82ec24f61499757a3a4b7053a921314b9099b',
        );

        expect(
          _response.statusCode,
          verifyValue.statusCode,
        );
      },
    );

    test(
      "the getContracts function whose Returns all active contracts the bus is aware of. This includes all contracts that have not expired, have not been renewed and also not manually archived yet. Contracts are also active if they are not part of a contract set like http.Response",
      () async {
        String? username;
        String password = "renterd";
        http.Response _response = await http.get(
          Uri.parse("${dotenv.env['ROOT_URL']}$getContractsApi"),
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader:
                "Basic ${base64Encode(utf8.encode('$username:$password'))}"
          },
        );

        final verifyValue = await _contractImpl.getContracts(
          password: 'renterd',
        );

        expect(
          _response.statusCode,
          verifyValue.statusCode,
        );
      },
    );

    test(
      "the releasePreviousContract function whose Releases a previously acquired contract using the obtained lock id like http.Response",
      () async {
        String? username;
        String password = "renterd";
        http.Response _response = await http.post(
          Uri.parse(
              "${dotenv.env['ROOT_URL']}${releasePreviousContractApi("fcid:06025daad00bb361df5a897b33a82ec24f61499757a3a4b7053a921314b9099b")}"),
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader:
                "Basic ${base64Encode(utf8.encode('$username:$password'))}"
          },
          body: json.encode({
            "lockID": 609920465282217447,
          }),
        );

        final verifyValue = await _contractImpl.releasePreviousContract(
          password: 'renterd',
          id: "fcid:06025daad00bb361df5a897b33a82ec24f61499757a3a4b7053a921314b9099b",
          lockId: 609920465282217447,
        );

        expect(
          _response.statusCode,
          verifyValue.statusCode,
        );
      },
    );
  });
}
