import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:renterd/src/abstract/accounts_abst.dart';
import 'package:renterd/src/logic/controllers/accounts_controllers/add_deposit_controller.dart';
import 'package:renterd/src/logic/controllers/accounts_controllers/get_all_accounts_controller.dart';
import 'package:renterd/src/logic/controllers/accounts_controllers/get_an_account_by_id_controller.dart';
import 'package:renterd/src/logic/controllers/accounts_controllers/lock_an_account_controller.dart';
import 'package:renterd/src/logic/controllers/accounts_controllers/reset_drift_controller.dart';
import 'package:renterd/src/logic/controllers/accounts_controllers/sync_balance_controller.dart';
import 'package:renterd/src/logic/controllers/accounts_controllers/un_lock_an_account_controller.dart';
import 'package:renterd/src/logic/controllers/accounts_controllers/update_balance_controller.dart';

class MockAccountsAbst extends Mock implements AccountsAbst {}

class MockResponse extends Mock implements Response {}

void main() {
  late MockResponse _mockResponse;
  late MockAccountsAbst _mockAccountsAbst;
  late GetAllAccountsController _getAllAccountsController;
  late GetAnAccountByIdController _getAnAccountByIdController;
  late LockAnAccountController _lockAnAccountController;
  late ResetDriftController _resetDriftController;
  late UnLockAnAccountController _unLockAnAccountController;
  late UpdateBalanceController _updateBalanceController;
  late SyncBalanceController _syncBalanceController;
  late AddDepositController _addDepositController;
  late String _ipAdress;

  setUp(() {
    _mockResponse = MockResponse();
    _mockAccountsAbst = MockAccountsAbst();
    _getAllAccountsController =
        GetAllAccountsController(accountsAbst: _mockAccountsAbst);
    _getAnAccountByIdController =
        GetAnAccountByIdController(accountsAbst: _mockAccountsAbst);
    _lockAnAccountController =
        LockAnAccountController(accountsAbst: _mockAccountsAbst);
    _resetDriftController =
        ResetDriftController(accountsAbst: _mockAccountsAbst);
    _unLockAnAccountController =
        UnLockAnAccountController(accountsAbst: _mockAccountsAbst);
    _updateBalanceController =
        UpdateBalanceController(accountsAbst: _mockAccountsAbst);
    _syncBalanceController =
        SyncBalanceController(accountsAbst: _mockAccountsAbst);
    _addDepositController =
        AddDepositController(accountsAbst: _mockAccountsAbst);
    _ipAdress = "127.0.0.1";
  });

  group('AccountsController => ', () {
    // write tests

    test(
        'the call function of the "get all accounts Controller" should return a response type',
        () async {
      //Arrange - Setup facts, Put Expected outputs or Initilize
      when(() => _mockAccountsAbst.getAllAccounts(
          password: "renterd",
          ipAdress: _ipAdress)).thenAnswer((_) async => _mockResponse);

      final verifyVariable = await _getAllAccountsController.call(
          password: "renterd", ipAdress: _ipAdress);

      //Assert - Compare the actual result and expected result
      expect(verifyVariable, _mockResponse);
      verify(() => _mockAccountsAbst.getAllAccounts(
          password: "renterd", ipAdress: _ipAdress)).called(1);
      verifyNoMoreInteractions(_mockAccountsAbst);
      verifyNoMoreInteractions(_mockResponse);
    });
    test(
        'the call function of the "get an account by id Controller" should return a response type',
        () async {
      //Arrange - Setup facts, Put Expected outputs or Initilize
      when(() => _mockAccountsAbst.getAnAccountById(
          password: "renterd",
          accountId:
              'ed25519:99611c808ccb74402f0c80ea0b22cefe3b46a73abe1072c90687658d44dead75',
          hostKey:
              'ed25519:0c920d0254011f1065eeb99aa909c644b991780c1155ce0aa34cce09e6eabdc9',
          ipAdress: _ipAdress)).thenAnswer((_) async => _mockResponse);

      final verifyVariable = await _getAnAccountByIdController.call(
          password: "renterd",
          accountId:
              'ed25519:99611c808ccb74402f0c80ea0b22cefe3b46a73abe1072c90687658d44dead75',
          hostKey:
              'ed25519:0c920d0254011f1065eeb99aa909c644b991780c1155ce0aa34cce09e6eabdc9',
          ipAdress: _ipAdress);

      //Assert - Compare the actual result and expected result
      expect(verifyVariable, _mockResponse);
      verify(() => _mockAccountsAbst.getAnAccountById(
          password: "renterd",
          accountId:
              'ed25519:99611c808ccb74402f0c80ea0b22cefe3b46a73abe1072c90687658d44dead75',
          hostKey:
              'ed25519:0c920d0254011f1065eeb99aa909c644b991780c1155ce0aa34cce09e6eabdc9',
          ipAdress: _ipAdress)).called(1);
      verifyNoMoreInteractions(_mockAccountsAbst);
      verifyNoMoreInteractions(_mockResponse);
    });

    test(
        'the call function of the "lock An Account Controller" should return a response type',
        () async {
      //Arrange - Setup facts, Put Expected outputs or Initilize
      when(() => _mockAccountsAbst.lockAnAccount(
          password: "renterd",
          accountId:
              'ed25519:99611c808ccb74402f0c80ea0b22cefe3b46a73abe1072c90687658d44dead75',
          hostKey:
              'ed25519:0c920d0254011f1065eeb99aa909c644b991780c1155ce0aa34cce09e6eabdc9',
          exclusive: false,
          ipAdress: _ipAdress)).thenAnswer((_) async => _mockResponse);

      final verifyVariable = await _lockAnAccountController.call(
          password: "renterd",
          accountId:
              'ed25519:99611c808ccb74402f0c80ea0b22cefe3b46a73abe1072c90687658d44dead75',
          hostKey:
              'ed25519:0c920d0254011f1065eeb99aa909c644b991780c1155ce0aa34cce09e6eabdc9',
          exclusive: false,
          ipAdress: _ipAdress);

      //Assert - Compare the actual result and expected result
      expect(verifyVariable, _mockResponse);
      verify(() => _mockAccountsAbst.lockAnAccount(
          password: "renterd",
          accountId:
              'ed25519:99611c808ccb74402f0c80ea0b22cefe3b46a73abe1072c90687658d44dead75',
          hostKey:
              'ed25519:0c920d0254011f1065eeb99aa909c644b991780c1155ce0aa34cce09e6eabdc9',
          exclusive: false,
          ipAdress: _ipAdress)).called(1);
      verifyNoMoreInteractions(_mockAccountsAbst);
      verifyNoMoreInteractions(_mockResponse);
    });
    test(
        'the call function of the "resetDrift Controller" should return a response type',
        () async {
      //Arrange - Setup facts, Put Expected outputs or Initilize
      when(() => _mockAccountsAbst.resetDrift(
          password: "renterd",
          accountId:
              'ed25519:99611c808ccb74402f0c80ea0b22cefe3b46a73abe1072c90687658d44dead75',
          ipAdress: _ipAdress)).thenAnswer((_) async => _mockResponse);

      final verifyVariable = await _resetDriftController.call(
        password: "renterd",
        accountId:
            'ed25519:99611c808ccb74402f0c80ea0b22cefe3b46a73abe1072c90687658d44dead75',
        ipAdress: _ipAdress,
      );

      //Assert - Compare the actual result and expected result
      expect(verifyVariable, _mockResponse);
      verify(() => _mockAccountsAbst.resetDrift(
            password: "renterd",
            accountId:
                'ed25519:99611c808ccb74402f0c80ea0b22cefe3b46a73abe1072c90687658d44dead75',
            ipAdress: _ipAdress,
          )).called(1);
      verifyNoMoreInteractions(_mockAccountsAbst);
      verifyNoMoreInteractions(_mockResponse);
    });
    test(
        'the call function of the "unlock Controller" should return a response type',
        () async {
      //Arrange - Setup facts, Put Expected outputs or Initilize
      when(() => _mockAccountsAbst.unLockAnAccount(
            password: "renterd",
            accountId:
                'ed25519:99611c808ccb74402f0c80ea0b22cefe3b46a73abe1072c90687658d44dead75',
            ipAdress: _ipAdress,
            lockId: '13874228167312385374',
          )).thenAnswer((_) async => _mockResponse);

      final verifyVariable = await _unLockAnAccountController.call(
        password: "renterd",
        accountId:
            'ed25519:99611c808ccb74402f0c80ea0b22cefe3b46a73abe1072c90687658d44dead75',
        lockId: '13874228167312385374',
        ipAdress: _ipAdress,
      );

      //Assert - Compare the actual result and expected result
      expect(verifyVariable, _mockResponse);
      verify(() => _mockAccountsAbst.unLockAnAccount(
            password: "renterd",
            accountId:
                'ed25519:99611c808ccb74402f0c80ea0b22cefe3b46a73abe1072c90687658d44dead75',
            lockId: '13874228167312385374',
            ipAdress: _ipAdress,
          )).called(1);
      verifyNoMoreInteractions(_mockAccountsAbst);
      verifyNoMoreInteractions(_mockResponse);
    });

    test(
        'the call function of the "update balance Controller" should return a response type',
        () async {
      //Arrange - Setup facts, Put Expected outputs or Initilize
      when(() => _mockAccountsAbst.updateBalance(
            password: "renterd",
            accountId:
                'ed25519:99611c808ccb74402f0c80ea0b22cefe3b46a73abe1072c90687658d44dead75',
            amount: 1000000,
            host:
                'ed25519:0c920d0254011f1065eeb99aa909c644b991780c1155ce0aa34cce09e6eabdc9',
            ipAdress: _ipAdress,
          )).thenAnswer((_) async => _mockResponse);

      final verifyVariable = await _updateBalanceController.call(
        password: "renterd",
        accountId:
            'ed25519:99611c808ccb74402f0c80ea0b22cefe3b46a73abe1072c90687658d44dead75',
        amount: 1000000,
        host:
            'ed25519:0c920d0254011f1065eeb99aa909c644b991780c1155ce0aa34cce09e6eabdc9',
        ipAdress: _ipAdress,
      );

      //Assert - Compare the actual result and expected result
      expect(verifyVariable, _mockResponse);
      verify(() => _mockAccountsAbst.updateBalance(
            password: "renterd",
            accountId:
                'ed25519:99611c808ccb74402f0c80ea0b22cefe3b46a73abe1072c90687658d44dead75',
            amount: 1000000,
            host:
                'ed25519:0c920d0254011f1065eeb99aa909c644b991780c1155ce0aa34cce09e6eabdc9',
            ipAdress: _ipAdress,
          )).called(1);
      verifyNoMoreInteractions(_mockAccountsAbst);
      verifyNoMoreInteractions(_mockResponse);
    });
    test(
        'the call function of the "sync balance Controller" should return a response type',
        () async {
      //Arrange - Setup facts, Put Expected outputs or Initilize
      when(() => _mockAccountsAbst.syncBalance(
            password: "renterd",
            accountId:
                'ed25519:99611c808ccb74402f0c80ea0b22cefe3b46a73abe1072c90687658d44dead75',
            host:
                'ed25519:0c920d0254011f1065eeb99aa909c644b991780c1155ce0aa34cce09e6eabdc9',
            ipAdress: _ipAdress,
          )).thenAnswer((_) async => _mockResponse);

      final verifyVariable = await _syncBalanceController.call(
        password: "renterd",
        accountId:
            'ed25519:99611c808ccb74402f0c80ea0b22cefe3b46a73abe1072c90687658d44dead75',
        host:
            'ed25519:0c920d0254011f1065eeb99aa909c644b991780c1155ce0aa34cce09e6eabdc9',
        ipAdress: _ipAdress,
      );

      //Assert - Compare the actual result and expected result
      expect(verifyVariable, _mockResponse);
      verify(() => _mockAccountsAbst.syncBalance(
            password: "renterd",
            accountId:
                'ed25519:99611c808ccb74402f0c80ea0b22cefe3b46a73abe1072c90687658d44dead75',
            host:
                'ed25519:0c920d0254011f1065eeb99aa909c644b991780c1155ce0aa34cce09e6eabdc9',
            ipAdress: _ipAdress,
          )).called(1);
      verifyNoMoreInteractions(_mockAccountsAbst);
      verifyNoMoreInteractions(_mockResponse);
    });
    test(
        'the call function of the "add deposit Controller" should return a response type',
        () async {
      //Arrange - Setup facts, Put Expected outputs or Initilize
      when(() => _mockAccountsAbst.addDeposit(
          password: "renterd",
          accountId:
              'ed25519:99611c808ccb74402f0c80ea0b22cefe3b46a73abe1072c90687658d44dead75',
          host:
              "ed25519:0c920d0254011f1065eeb99aa909c644b991780c1155ce0aa34cce09e6eabdc9",
          ipAdress: _ipAdress,
          amount: 1000000)).thenAnswer((_) async => _mockResponse);

      final verifyVariable = await _addDepositController.call(
          password: "renterd",
          accountId:
              'ed25519:99611c808ccb74402f0c80ea0b22cefe3b46a73abe1072c90687658d44dead75',
          host:
              "ed25519:0c920d0254011f1065eeb99aa909c644b991780c1155ce0aa34cce09e6eabdc9",
          ipAdress: _ipAdress,
          amount: 1000000);

      //Assert - Compare the actual result and expected result
      expect(verifyVariable, _mockResponse);
      verify(() => _mockAccountsAbst.addDeposit(
          password: "renterd",
          accountId:
              'ed25519:99611c808ccb74402f0c80ea0b22cefe3b46a73abe1072c90687658d44dead75',
          host:
              "ed25519:0c920d0254011f1065eeb99aa909c644b991780c1155ce0aa34cce09e6eabdc9",
          ipAdress: _ipAdress,
          amount: 1000000)).called(1);
      verifyNoMoreInteractions(_mockAccountsAbst);
      verifyNoMoreInteractions(_mockResponse);
    });
  });
}
