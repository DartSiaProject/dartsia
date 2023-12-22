@Timeout(Duration(seconds: 90))
import 'package:flutter_test/flutter_test.dart';
import 'package:renterd/src/injection.dart';
import 'package:renterd/src/logic/controllers/renterd/bus/accounts_controllers/add_deposit_controller.dart';
import 'package:renterd/src/logic/controllers/renterd/bus/accounts_controllers/get_all_accounts_controller.dart';
import 'package:renterd/src/logic/controllers/renterd/bus/accounts_controllers/get_an_account_by_id_controller.dart';
import 'package:renterd/src/logic/controllers/renterd/bus/accounts_controllers/lock_an_account_controller.dart';
import 'package:renterd/src/logic/controllers/renterd/bus/accounts_controllers/reset_drift_controller.dart';
import 'package:renterd/src/logic/controllers/renterd/bus/accounts_controllers/sync_balance_controller.dart';
import 'package:renterd/src/logic/controllers/renterd/bus/accounts_controllers/un_lock_an_account_controller.dart';
import 'package:renterd/src/logic/controllers/renterd/bus/accounts_controllers/update_balance_controller.dart';
import 'package:renterd/src/logic/routes/renterd/bus/accounts_route.dart';

void main() async {
  Renterd.init();

  late GetAllAccountsController _getAllAccountsController;
  late GetAnAccountByIdController _getAnAccountByIdController;
  late LockAnAccountController _lockAnAccountController;
  late ResetDriftController _resetDriftController;
  late UnLockAnAccountController _unLockAnAccountController;
  late UpdateBalanceController _updateBalanceController;
  late SyncBalanceController _syncBalanceController;
  late AddDepositController _addDepositController;
  late String _serverAddress;
  late String _password;

  setUp(() {
    _getAllAccountsController = Renterd.sl<GetAllAccountsController>();
    _getAnAccountByIdController = Renterd.sl<GetAnAccountByIdController>();
    _lockAnAccountController = Renterd.sl<LockAnAccountController>();
    _resetDriftController = Renterd.sl<ResetDriftController>();
    _unLockAnAccountController = Renterd.sl<UnLockAnAccountController>();
    _updateBalanceController = Renterd.sl<UpdateBalanceController>();
    _syncBalanceController = Renterd.sl<SyncBalanceController>();
    _addDepositController = Renterd.sl<AddDepositController>();
    _serverAddress = "https://0a96-34-212-52-203.ngrok-free.app";
    _password = "Vykuj3546@";
  });

  group('AccountsRoute =>', () {
    // write tests

    test(
      'the getAllAccounts Returns all known ephemeral accounts from the bus like http.Response Type',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        final testValue = await _getAllAccountsController.call(
          password: _password,
          serverAddress: _serverAddress,
        );

        //Act - Call the function that is to be tested

        final verifyValue = await Accounts.getAllAccounts(
          password: _password,
          serverAddress: _serverAddress,
        );

        //Assert - Compare the actual result and expected result
        expect(testValue.statusCode, verifyValue.statusCode);
      },
    );
    test(
      "the getAnAccountById function Returns the account with the given ID. If it doesn't exist, it will be created. The provided host's key will be attached to the account as additional metadata like http.Response Type",
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        final testValue = await _getAnAccountByIdController.call(
            password: _password,
            accountId:
                'ed25519:99611c808ccb74402f0c80ea0b22cefe3b46a73abe1072c90687658d44dead75',
            serverAddress: _serverAddress,
            hostKey:
                'ed25519:0c920d0254011f1065eeb99aa909c644b991780c1155ce0aa34cce09e6eabdc9');

        //Act - Call the function that is to be tested

        final verifyValue = await Accounts.getAnAcountById(
            password: _password,
            accountId:
                'ed25519:99611c808ccb74402f0c80ea0b22cefe3b46a73abe1072c90687658d44dead75',
            serverAddress: _serverAddress,
            hostKey:
                'ed25519:0c920d0254011f1065eeb99aa909c644b991780c1155ce0aa34cce09e6eabdc9');

        //Assert - Compare the actual result and expected result
        expect(testValue.statusCode, verifyValue.statusCode);
      },
    );
    test(
      "the lockAnAccount This Function whose Commonly used by the worker, this endpoint allows for locking an account either exclusively or not like http.Response",
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        final testValue = await _lockAnAccountController.call(
            password: _password,
            accountId:
                'ed25519:99611c808ccb74402f0c80ea0b22cefe3b46a73abe1072c90687658d44dead75',
            serverAddress: _serverAddress,
            hostKey:
                'ed25519:0c920d0254011f1065eeb99aa909c644b991780c1155ce0aa34cce09e6eabdc9',
            exclusive: false);

        //Act - Call the function that is to be tested

        final verifyValue = await Accounts.lockAnAccount(
            password: _password,
            accountId:
                'ed25519:99611c808ccb74402f0c80ea0b22cefe3b46a73abe1072c90687658d44dead75',
            serverAddress: _serverAddress,
            hostKey:
                'ed25519:0c920d0254011f1065eeb99aa909c644b991780c1155ce0aa34cce09e6eabdc9',
            exclusive: false);

        //Assert - Compare the actual result and expected result
        expect(testValue.statusCode, verifyValue.statusCode);
      },
    );

    test(
      "the resetDrift This Function whose Resets the drift on ephemeral accounts. The drift tracks by how much Siacoin the expected balance of renterd differs from the host's over time. If the drift is too large, the autopilot refuses to pour more money into a host's account. Resetting the drift will cause the autopilot to fund the account again like http.Response",
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        final testValue = await _resetDriftController.call(
          password: _password,
          accountId:
              'ed25519:99611c808ccb74402f0c80ea0b22cefe3b46a73abe1072c90687658d44dead75',
          serverAddress: _serverAddress,
        );

        //Act - Call the function that is to be tested

        final verifyValue = await Accounts.resetDrift(
          password: _password,
          accountId:
              'ed25519:99611c808ccb74402f0c80ea0b22cefe3b46a73abe1072c90687658d44dead75',
          serverAddress: _serverAddress,
        );

        //Assert - Compare the actual result and expected result
        expect(testValue.statusCode, verifyValue.statusCode);
      },
    );

    test(
      "the unlock account This Function whose This is the counterpart to the account locking endpoint. The lock id returned when locking an account can be used to unlock it again before the locking duration has passed and the account gets unlocked automatically, like http.Response",
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        final testValue = await _unLockAnAccountController.call(
          password: _password,
          accountId:
              'ed25519:99611c808ccb74402f0c80ea0b22cefe3b46a73abe1072c90687658d44dead75',
          lockId: '13874228167312385374',
          serverAddress: _serverAddress,
        );

        //Act - Call the function that is to be tested

        final verifyValue = await Accounts.unLockAnAccount(
          password: _password,
          accountId:
              'ed25519:99611c808ccb74402f0c80ea0b22cefe3b46a73abe1072c90687658d44dead75',
          lockId: '13874228167312385374',
          serverAddress: _serverAddress,
        );

        //Assert - Compare the actual result and expected result
        expect(testValue.statusCode, verifyValue.statusCode);
      },
    );
    test(
      "the updateBalance This Function whose Updates the balance of an account to the provided value. The caller should acquire an exclusive lock before calling this endpoint, like http.Response",
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        final testValue = await _updateBalanceController.call(
          password: _password,
          accountId:
              'ed25519:99611c808ccb74402f0c80ea0b22cefe3b46a73abe1072c90687658d44dead75',
          amount: 1000000,
          host:
              'ed25519:0c920d0254011f1065eeb99aa909c644b991780c1155ce0aa34cce09e6eabdc9',
          serverAddress: _serverAddress,
        );

        //Act - Call the function that is to be tested

        final verifyValue = await Accounts.updateBalance(
          password: _password,
          accountId:
              'ed25519:99611c808ccb74402f0c80ea0b22cefe3b46a73abe1072c90687658d44dead75',
          amount: 1000000,
          host:
              'ed25519:0c920d0254011f1065eeb99aa909c644b991780c1155ce0aa34cce09e6eabdc9',
          serverAddress: _serverAddress,
        );
        //Assert - Compare the actual result and expected result
        expect(testValue.statusCode, verifyValue.statusCode);
      },
    );
    test(
      "the syncBalance This Function This endpoint marks the accoutn as requiring a balance sync. Usually set by workers when operations fail with an error indicating an insufficient balance",
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        final testValue = await _syncBalanceController.call(
          password: _password,
          accountId:
              'ed25519:99611c808ccb74402f0c80ea0b22cefe3b46a73abe1072c90687658d44dead75',
          host:
              'ed25519:0c920d0254011f1065eeb99aa909c644b991780c1155ce0aa34cce09e6eabdc9',
          serverAddress: _serverAddress,
        );

        //Act - Call the function that is to be tested

        final verifyValue = await Accounts.syncBalance(
          password: _password,
          accountId:
              'ed25519:99611c808ccb74402f0c80ea0b22cefe3b46a73abe1072c90687658d44dead75',
          host:
              'ed25519:0c920d0254011f1065eeb99aa909c644b991780c1155ce0aa34cce09e6eabdc9',
          serverAddress: _serverAddress,
        );
        //Assert - Compare the actual result and expected result
        expect(testValue.statusCode, verifyValue.statusCode);
      },
    );
    test(
      "addDeposit This Function whose Endpoint used for depositing or withdrawing tokens into/from an ephemeral account. The caller should hold a non-exlusive lock on the account like http.Response",
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        final testValue = await _addDepositController.call(
            password: _password,
            accountId:
                'ed25519:99611c808ccb74402f0c80ea0b22cefe3b46a73abe1072c90687658d44dead75',
            host:
                "ed25519:0c920d0254011f1065eeb99aa909c644b991780c1155ce0aa34cce09e6eabdc9",
            serverAddress: _serverAddress,
            amount: 1000000);

        //Act - Call the function that is to be tested

        final verifyValue = await Accounts.addDeposit(
            password: _password,
            accountId:
                'ed25519:99611c808ccb74402f0c80ea0b22cefe3b46a73abe1072c90687658d44dead75',
            host:
                "ed25519:0c920d0254011f1065eeb99aa909c644b991780c1155ce0aa34cce09e6eabdc9",
            serverAddress: _serverAddress,
            amount: 1000000);
        //Assert - Compare the actual result and expected result
        expect(testValue.statusCode, verifyValue.statusCode);
      },
    );
  });
}
