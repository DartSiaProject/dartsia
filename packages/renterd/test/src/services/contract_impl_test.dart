import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:renterd/src/apis/contracts_api.dart';
import 'package:renterd/src/services/contract_impl.dart';

void main() async {
  late ContractImpl _contractImpl;
  late String _ipAdress;
  late String _username;
  late String _password;

  setUp(() {
    _contractImpl = ContractImpl();
    _ipAdress = "0a96-34-212-52-203";
    _username = "";
    _password = "Vykuj3546@";

    // todo :  ip local "127.0.0.1";
  });

  group('ContractImpl => ', () {
    // write tests

    test(
      "the acquireAContract function whose Acquires a contract for up to a given duration. Similar to ephemeral accounts, contracts can be unlocked ahead of time using the unlock endpoint with the returned lock id like http.Response",
      () async {
        http.Response _response = await http.post(
          Uri.parse(acquireAContractApi(
              "fcid:06025daad00bb361df5a897b33a82ec24f61499757a3a4b7053a921314b9099b",
              _ipAdress)),
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader:
                "Basic ${base64Encode(utf8.encode('$_username:$_password'))}"
          },
          body: json.encode({
            "duration": "10000",
            "priority": 10,
          }),
        );

        final verifyValue = await _contractImpl.acquireAContract(
          password: _password,
          duration: "10000",
          id: 'fcid:06025daad00bb361df5a897b33a82ec24f61499757a3a4b7053a921314b9099b',
          priority: 10,
          ipAdress: _ipAdress,
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
        http.Response _response = await http.post(
          Uri.parse(postContractsApi(
              "fcid:06025daad00bb361df5a897b33a82ec24f61499757a3a4b7053a921314b9099b",
              _ipAdress)),
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader:
                "Basic ${base64Encode(utf8.encode('$_username:$_password'))}"
          },
          body: json.encode(
            {
              "contract": <dynamic>{},
              "startHeight": 53,
              "totalCost": "16666666666666666666666666"
            },
          ),
        );

        final verifyValue = await _contractImpl.addContract(
          password: _password,
          contract: {},
          id: 'fcid:06025daad00bb361df5a897b33a82ec24f61499757a3a4b7053a921314b9099b',
          startHeight: 53,
          totalCost: "16666666666666666666666666",
          ipAdress: _ipAdress,
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
        http.Response _response = await http.delete(
          Uri.parse(deleteContractByIdApi(
              "fcid:06025daad00bb361df5a897b33a82ec24f61499757a3a4b7053a921314b9099b",
              _ipAdress)),
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader:
                "Basic ${base64Encode(utf8.encode('$_username:$_password'))}"
          },
        );

        final verifyValue = await _contractImpl.deleteContractById(
          password: _password,
          id: 'fcid:06025daad00bb361df5a897b33a82ec24f61499757a3a4b7053a921314b9099b',
          ipAdress: _ipAdress,
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
        http.Response _response = await http.get(
          Uri.parse(getContractByIdApi(
              "fcid:06025daad00bb361df5a897b33a82ec24f61499757a3a4b7053a921314b9099b",
              _ipAdress)),
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader:
                "Basic ${base64Encode(utf8.encode('$_username:$_password'))}"
          },
        );

        final verifyValue = await _contractImpl.getContractById(
          password: _password,
          id: 'fcid:06025daad00bb361df5a897b33a82ec24f61499757a3a4b7053a921314b9099b',
          ipAdress: _ipAdress,
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
        http.Response _response = await http.get(
          Uri.parse(getContractsApi(_ipAdress)),
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader:
                "Basic ${base64Encode(utf8.encode('$_username:$_password'))}"
          },
        );

        final verifyValue = await _contractImpl.getContracts(
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
      "the releasePreviousContract function whose Releases a previously acquired contract using the obtained lock id like http.Response",
      () async {
        http.Response _response = await http.post(
          Uri.parse(releasePreviousContractApi(
              "fcid:06025daad00bb361df5a897b33a82ec24f61499757a3a4b7053a921314b9099b",
              _ipAdress)),
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader:
                "Basic ${base64Encode(utf8.encode('$_username:$_password'))}"
          },
          body: json.encode({
            "lockID": 609920465282217447,
          }),
        );

        final verifyValue = await _contractImpl.releasePreviousContract(
          password: _password,
          id: "fcid:06025daad00bb361df5a897b33a82ec24f61499757a3a4b7053a921314b9099b",
          lockId: 609920465282217447,
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
