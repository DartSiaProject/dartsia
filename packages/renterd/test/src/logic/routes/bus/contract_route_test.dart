@Timeout(Duration(seconds: 90))
import 'package:flutter_test/flutter_test.dart';
import 'package:renterd/src/injection.dart';
import 'package:renterd/src/logic/controllers/renterd/bus/contract_controllers/acquire_a_contract_controller.dart';
import 'package:renterd/src/logic/controllers/renterd/bus/contract_controllers/add_contract_controller.dart';
import 'package:renterd/src/logic/controllers/renterd/bus/contract_controllers/delete_contract_by_id_controller.dart';
import 'package:renterd/src/logic/controllers/renterd/bus/contract_controllers/get_contract_by_id_controller.dart';
import 'package:renterd/src/logic/controllers/renterd/bus/contract_controllers/get_contracts_controller.dart';
import 'package:renterd/src/logic/controllers/renterd/bus/contract_controllers/release_presious_contract_controller.dart';
import 'package:renterd/src/logic/routes/renterd/bus/contract_route.dart';

void main() async {
  Renterd.init();
  late AcquireAContractController _acquireAContractController;
  late AddContractController _addContractController;
  late DeleteContractByIdController _deleteContractByIdController;
  late GetContractByIdController _getContractByIdController;
  late GetContractsController _getContractsController;
  late ReleasePreviousContractController _releasePreviousContractController;
  late String _serverAddress;
  late String _password;

  setUp(() {
    _acquireAContractController = Renterd.sl<AcquireAContractController>();
    _addContractController = Renterd.sl<AddContractController>();
    _deleteContractByIdController = Renterd.sl<DeleteContractByIdController>();
    _getContractByIdController = Renterd.sl<GetContractByIdController>();
    _getContractsController = Renterd.sl<GetContractsController>();
    _releasePreviousContractController =
        Renterd.sl<ReleasePreviousContractController>();
    _serverAddress = "https://0a96-34-212-52-203.ngrok-free.app";
    _password = "Vykuj3546@";
  });

  group('ContractRoute => ', () {
    // write tests
    test(
      "the acquireAContract function whose Acquires a contract for up to a given duration. Similar to ephemeral accounts, contracts can be unlocked ahead of time using the unlock endpoint with the returned lock id like http.Response",
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        final testValue = await _acquireAContractController.call(
          password: _password,
          duration: "10000",
          id: 'fcid:06025daad00bb361df5a897b33a82ec24f61499757a3a4b7053a921314b9099b',
          serverAddress: _serverAddress,
          priority: 10,
        );

        //Act - Call the function that is to be tested

        final verifyValue = await Contract.acquireAContract(
          password: _password,
          duration: "10000",
          id: 'fcid:06025daad00bb361df5a897b33a82ec24f61499757a3a4b7053a921314b9099b',
          serverAddress: _serverAddress,
          priority: 10,
        );

        //Assert - Compare the actual result and expected result
        expect(testValue.statusCode, verifyValue.statusCode);
      },
    );
    test(
      "the addContract function whose Adds a contract to the bus. Usually called by workers after forming a new contract like http.Response",
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        final testValue = await _addContractController.call(
          password: _password,
          contract: {},
          id: 'fcid:06025daad00bb361df5a897b33a82ec24f61499757a3a4b7053a921314b9099b',
          serverAddress: _serverAddress,
          startHeight: 53,
          totalCost: "16666666666666666666666666",
        );

        //Act - Call the function that is to be tested

        final verifyValue = await Contract.addContract(
          password: _password,
          contract: {},
          id: 'fcid:06025daad00bb361df5a897b33a82ec24f61499757a3a4b7053a921314b9099b',
          serverAddress: _serverAddress,
          startHeight: 53,
          totalCost: "16666666666666666666666666",
        );

        //Assert - Compare the actual result and expected result
        expect(testValue.statusCode, verifyValue.statusCode);
      },
    );
    test(
      "the deleteContractById function whose Deletes a contract from the bus. This doesn't remove the contract from the blockchain. The bus only stops being aware of the contract's existence and will therefore stop using it like http.Response",
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        final testValue = await _deleteContractByIdController.call(
          password: _password,
          id: 'fcid:06025daad00bb361df5a897b33a82ec24f61499757a3a4b7053a921314b9099b',
          serverAddress: _serverAddress,
        );

        //Act - Call the function that is to be tested

        final verifyValue = await Contract.deleteContractById(
          password: _password,
          id: 'fcid:06025daad00bb361df5a897b33a82ec24f61499757a3a4b7053a921314b9099b',
          serverAddress: _serverAddress,
        );

        //Assert - Compare the actual result and expected result
        expect(testValue.statusCode, verifyValue.statusCode);
      },
    );
    test(
      "the getContractById function whose Returns contract metadata for an active contract with the provided contract id like http.Response",
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        final testValue = await _getContractByIdController.call(
          password: _password,
          id: 'fcid:06025daad00bb361df5a897b33a82ec24f61499757a3a4b7053a921314b9099b',
          serverAddress: _serverAddress,
        );

        //Act - Call the function that is to be tested

        final verifyValue = await Contract.getContractById(
          password: _password,
          id: 'fcid:06025daad00bb361df5a897b33a82ec24f61499757a3a4b7053a921314b9099b',
          serverAddress: _serverAddress,
        );

        //Assert - Compare the actual result and expected result
        expect(testValue.statusCode, verifyValue.statusCode);
      },
    );
    test(
      "the getContracts function whose Returns all active contracts the bus is aware of. This includes all contracts that have not expired, have not been renewed and also not manually archived yet. Contracts are also active if they are not part of a contract set like http.Response",
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        final testValue = await _getContractsController.call(
          password: _password,
          serverAddress: _serverAddress,
        );

        //Act - Call the function that is to be tested

        final verifyValue = await Contract.getContracts(
          password: _password,
          serverAddress: _serverAddress,
        );

        //Assert - Compare the actual result and expected result
        expect(testValue.statusCode, verifyValue.statusCode);
      },
    );
    test(
      "the releasePreviousContract function whose Releases a previously acquired contract using the obtained lock id like http.Response",
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        final testValue = await _releasePreviousContractController.call(
          password: _password,
          id: "fcid:06025daad00bb361df5a897b33a82ec24f61499757a3a4b7053a921314b9099b",
          serverAddress: _serverAddress,
          lockId: 609920465282217447,
        );

        //Act - Call the function that is to be tested

        final verifyValue = await Contract.releasePreviousContract(
          password: _password,
          id: "fcid:06025daad00bb361df5a897b33a82ec24f61499757a3a4b7053a921314b9099b",
          serverAddress: _serverAddress,
          lockId: 609920465282217447,
        );

        //Assert - Compare the actual result and expected result
        expect(testValue.statusCode, verifyValue.statusCode);
      },
    );
  });
}
