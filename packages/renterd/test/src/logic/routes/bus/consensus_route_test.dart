@Timeout(Duration(seconds: 90))
import 'package:flutter_test/flutter_test.dart';
import 'package:renterd/src/injection.dart';
import 'package:renterd/src/logic/controllers/renterd/bus/consensus_controllers/accept_block_controller.dart';
import 'package:renterd/src/logic/controllers/renterd/bus/consensus_controllers/get_sia_fund_fee_controller.dart';
import 'package:renterd/src/logic/controllers/renterd/bus/consensus_controllers/get_state_controller.dart';
import 'package:renterd/src/logic/routes/renterd/bus/consensus_route.dart';

void main() async {
  Renterd.init();
  late AcceptBlockController _acceptBlockController;
  late GetSiaFundFeeController _getSiaFundFeeController;
  late GetStateController _getStateController;
  late String _serverAddress;
  late String _password;

  setUp(() {
    _acceptBlockController = Renterd.sl<AcceptBlockController>();
    _getSiaFundFeeController = Renterd.sl<GetSiaFundFeeController>();
    _getStateController = Renterd.sl<GetStateController>();
    _serverAddress = "https://0a96-34-212-52-203.ngrok-free.app";
    _password = "Vykuj3546@";
  });

  group('ConsensusRoute => ', () {
    // write tests

    test(
      "the acceptBlock function whose Accepts a mined block. Upon success, the block is forwarded to the node's peers and the whole p2p network like http.Response",
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        final testValue = await _acceptBlockController.call(
          password: _password,
          address:
              "addr:162a2c565d0c10997ad21697c78c80688807296b09ea599f402c2304730ee6f67563d7c53145",
          arbitraryDataList: ["Tm9uU2lhAAAAAAAAAAAAADuAtj8zRWfR3ulRHvz7fb0="],
          parentId:
              "bid:56e4d337f8554ce34071743b1976e164da01728d824b4963761154c965fb5625",
          value: "299999000000000000000000000000",
          serverAddress: _serverAddress,
        );

        //Act - Call the function that is to be tested

        final verifyValue = await Consensus.acceptBlock(
          password: _password,
          address:
              "addr:162a2c565d0c10997ad21697c78c80688807296b09ea599f402c2304730ee6f67563d7c53145",
          arbitraryDataList: ["Tm9uU2lhAAAAAAAAAAAAADuAtj8zRWfR3ulRHvz7fb0="],
          parentId:
              "bid:56e4d337f8554ce34071743b1976e164da01728d824b4963761154c965fb5625",
          value: "299999000000000000000000000000",
          serverAddress: _serverAddress,
        );

        //Assert - Compare the actual result and expected result
        expect(testValue.statusCode, verifyValue.statusCode);
      },
    );

    test(
      "the getSiaFundFee function whose Given the total payout of a contract, this endpoint returns the appropriate siafund fee to pay like http.Response",
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        final testValue = await _getSiaFundFeeController.call(
          password: _password,
          payout: 100000000,
          serverAddress: _serverAddress,
        );

        //Act - Call the function that is to be tested

        final verifyValue = await Consensus.getSiaFundFee(
          password: _password,
          payout: 100000000,
          serverAddress: _serverAddress,
        );

        //Assert - Compare the actual result and expected result
        expect(testValue.statusCode, verifyValue.statusCode);
      },
    );
    test(
      "the getState function whose Returns some info regarding the current state of the consensus like http.Response",
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        final testValue = await _getStateController.call(
          password: _password,
          serverAddress: _serverAddress,
        );

        //Act - Call the function that is to be tested

        final verifyValue = await Consensus.getState(
          password: _password,
          serverAddress: _serverAddress,
        );

        //Assert - Compare the actual result and expected result
        expect(testValue.statusCode, verifyValue.statusCode);
      },
    );
  });
}
