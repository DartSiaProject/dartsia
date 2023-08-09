import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:renterd/src/abstract/contract_abst.dart';
import 'package:renterd/src/logic/controllers/contract_controllers/acquire_a_contract_controller.dart';
import 'package:renterd/src/logic/controllers/contract_controllers/add_contract_controller.dart';
import 'package:renterd/src/logic/controllers/contract_controllers/delete_contract_by_id_controller.dart';
import 'package:renterd/src/logic/controllers/contract_controllers/get_contract_by_id_controller.dart';
import 'package:renterd/src/logic/controllers/contract_controllers/get_contracts_controller.dart';
import 'package:renterd/src/logic/controllers/contract_controllers/release_presious_contract_controller.dart';

class MockContractAbst extends Mock implements ContractAbst {}

class MockResponse extends Mock implements Response {}

void main() {
  late MockContractAbst _mockContractAbst;
  late MockResponse _mockResponse;
  late AcquireAContractController _acquireAContractController;
  late AddContractController _addContractController;
  late DeleteContractByIdController _deleteContractByIdController;
  late GetContractByIdController _getContractByIdController;
  late GetContractsController _getContractsController;
  late ReleasePreviousContractController _releasePreviousContractController;

  setUp(() {
    _mockContractAbst = MockContractAbst();
    _mockResponse = MockResponse();
    _acquireAContractController =
        AcquireAContractController(contractAbst: _mockContractAbst);
    _addContractController =
        AddContractController(contractAbst: _mockContractAbst);
    _deleteContractByIdController =
        DeleteContractByIdController(contractAbst: _mockContractAbst);
    _getContractByIdController =
        GetContractByIdController(contractAbst: _mockContractAbst);
    _getContractsController =
        GetContractsController(contractAbst: _mockContractAbst);
    _releasePreviousContractController =
        ReleasePreviousContractController(contractAbst: _mockContractAbst);
  });

  group('ContractController => ', () {
    // write tests
    test(
      'the call function of the "Acquire A Contract Controller" should return a response type',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockContractAbst.acquireAContract(
              password: 'renterd',
              duration: "10000",
              id: 'fcid:06025daad00bb361df5a897b33a82ec24f61499757a3a4b7053a921314b9099b',
              priority: 10,
            )).thenAnswer((_) async => _mockResponse);

        final verifyVariable = await _acquireAContractController.call(
          password: 'renterd',
          duration: "10000",
          id: 'fcid:06025daad00bb361df5a897b33a82ec24f61499757a3a4b7053a921314b9099b',
          priority: 10,
        );

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, _mockResponse);
        verify(() => _mockContractAbst.acquireAContract(
              password: 'renterd',
              duration: "10000",
              id: 'fcid:06025daad00bb361df5a897b33a82ec24f61499757a3a4b7053a921314b9099b',
              priority: 10,
            )).called(1);
        verifyNoMoreInteractions(_mockContractAbst);
        verifyNoMoreInteractions(_mockResponse);
      },
    );
    test(
      'the call function of the "Add Contract Controller " should return a response type',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockContractAbst.addContract(
              password: 'renterd',
              contract: {},
              id: 'fcid:06025daad00bb361df5a897b33a82ec24f61499757a3a4b7053a921314b9099b',
              startHeight: 53,
              totalCost: "16666666666666666666666666",
            )).thenAnswer((_) async => _mockResponse);

        final verifyVariable = await _addContractController.call(
          password: 'renterd',
          contract: {},
          id: 'fcid:06025daad00bb361df5a897b33a82ec24f61499757a3a4b7053a921314b9099b',
          startHeight: 53,
          totalCost: "16666666666666666666666666",
        );

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, _mockResponse);
        verify(() => _mockContractAbst.addContract(
              password: 'renterd',
              contract: {},
              id: 'fcid:06025daad00bb361df5a897b33a82ec24f61499757a3a4b7053a921314b9099b',
              startHeight: 53,
              totalCost: "16666666666666666666666666",
            )).called(1);
        verifyNoMoreInteractions(_mockContractAbst);
        verifyNoMoreInteractions(_mockResponse);
      },
    );
    test(
      'the call function of the "Delete Contract By Id Controller" should return a response type',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockContractAbst.deleteContractById(
              password: 'renterd',
              id: 'fcid:06025daad00bb361df5a897b33a82ec24f61499757a3a4b7053a921314b9099b',
            )).thenAnswer((_) async => _mockResponse);

        final verifyVariable = await _deleteContractByIdController.call(
          password: 'renterd',
          id: 'fcid:06025daad00bb361df5a897b33a82ec24f61499757a3a4b7053a921314b9099b',
        );

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, _mockResponse);
        verify(() => _mockContractAbst.deleteContractById(
              password: 'renterd',
              id: 'fcid:06025daad00bb361df5a897b33a82ec24f61499757a3a4b7053a921314b9099b',
            )).called(1);
        verifyNoMoreInteractions(_mockContractAbst);
        verifyNoMoreInteractions(_mockResponse);
      },
    );
    test(
      'the call function of the "Get Contract By Id Controller" should return a response type',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockContractAbst.getContractById(
              password: 'renterd',
              id: 'fcid:06025daad00bb361df5a897b33a82ec24f61499757a3a4b7053a921314b9099b',
            )).thenAnswer((_) async => _mockResponse);

        final verifyVariable = await _getContractByIdController.call(
          password: 'renterd',
          id: 'fcid:06025daad00bb361df5a897b33a82ec24f61499757a3a4b7053a921314b9099b',
        );

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, _mockResponse);
        verify(() => _mockContractAbst.getContractById(
              password: 'renterd',
              id: 'fcid:06025daad00bb361df5a897b33a82ec24f61499757a3a4b7053a921314b9099b',
            )).called(1);
        verifyNoMoreInteractions(_mockContractAbst);
        verifyNoMoreInteractions(_mockResponse);
      },
    );
    test(
      'the call function of the "Get Contracts Controller " should return a response type',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockContractAbst.getContracts(
              password: 'renterd',
            )).thenAnswer((_) async => _mockResponse);

        final verifyVariable = await _getContractsController.call(
          password: 'renterd',
        );

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, _mockResponse);
        verify(() => _mockContractAbst.getContracts(
              password: 'renterd',
            )).called(1);
        verifyNoMoreInteractions(_mockContractAbst);
        verifyNoMoreInteractions(_mockResponse);
      },
    );
    test(
      'the call function of the "Release Previous Contract Controller" should return a response type',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockContractAbst.releasePreviousContract(
              password: 'renterd',
              id: "fcid:06025daad00bb361df5a897b33a82ec24f61499757a3a4b7053a921314b9099b",
              lockId: 609920465282217447,
            )).thenAnswer((_) async => _mockResponse);

        final verifyVariable = await _releasePreviousContractController.call(
          password: 'renterd',
          id: "fcid:06025daad00bb361df5a897b33a82ec24f61499757a3a4b7053a921314b9099b",
          lockId: 609920465282217447,
        );

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, _mockResponse);
        verify(() => _mockContractAbst.releasePreviousContract(
              password: 'renterd',
              id: "fcid:06025daad00bb361df5a897b33a82ec24f61499757a3a4b7053a921314b9099b",
              lockId: 609920465282217447,
            )).called(1);
        verifyNoMoreInteractions(_mockContractAbst);
        verifyNoMoreInteractions(_mockResponse);
      },
    );
  });
}
