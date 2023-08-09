import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:renterd/src/abstract/consensus_abst.dart';
import 'package:renterd/src/logic/controllers/consensus_controllers/accept_block_controller.dart';
import 'package:renterd/src/logic/controllers/consensus_controllers/get_sia_fund_fee_controller.dart';
import 'package:renterd/src/logic/controllers/consensus_controllers/get_state_controller.dart';

class MockConsensusAbst extends Mock implements ConsensusAbst {}

class MockResponse extends Mock implements Response {}

void main() {
  late MockConsensusAbst _mockConsensusAbst;
  late MockResponse _mockResponse;
  late AcceptBlockController _acceptBlockController;
  late GetSiaFundFeeController _getSiaFundFeeController;
  late GetStateController _getStateController;

  setUp(() {
    _mockConsensusAbst = MockConsensusAbst();
    _mockResponse = MockResponse();
    _acceptBlockController =
        AcceptBlockController(consensusAbst: _mockConsensusAbst);
    _getSiaFundFeeController =
        GetSiaFundFeeController(consensusAbst: _mockConsensusAbst);
    _getStateController = GetStateController(consensusAbst: _mockConsensusAbst);
  });

  group('ConsensusController => ', () {
    // write tests
    test(
        'the call function of the "accept Block Controller" should return a response type',
        () async {
      //Arrange - Setup facts, Put Expected outputs or Initilize
      when(() => _mockConsensusAbst.acceptBlock(
            password: 'renterd',
            address:
                "addr:162a2c565d0c10997ad21697c78c80688807296b09ea599f402c2304730ee6f67563d7c53145",
            arbitraryDataList: ["Tm9uU2lhAAAAAAAAAAAAADuAtj8zRWfR3ulRHvz7fb0="],
            parentId:
                "bid:56e4d337f8554ce34071743b1976e164da01728d824b4963761154c965fb5625",
            value: "299999000000000000000000000000",
          )).thenAnswer((_) async => _mockResponse);

      final verifyVariable = await _acceptBlockController.call(
        password: 'renterd',
        address:
            "addr:162a2c565d0c10997ad21697c78c80688807296b09ea599f402c2304730ee6f67563d7c53145",
        arbitraryDataList: ["Tm9uU2lhAAAAAAAAAAAAADuAtj8zRWfR3ulRHvz7fb0="],
        parentId:
            "bid:56e4d337f8554ce34071743b1976e164da01728d824b4963761154c965fb5625",
        value: "299999000000000000000000000000",
      );

      //Assert - Compare the actual result and expected result
      expect(verifyVariable, _mockResponse);
      verify(() => _mockConsensusAbst.acceptBlock(
            password: 'renterd',
            address:
                "addr:162a2c565d0c10997ad21697c78c80688807296b09ea599f402c2304730ee6f67563d7c53145",
            arbitraryDataList: ["Tm9uU2lhAAAAAAAAAAAAADuAtj8zRWfR3ulRHvz7fb0="],
            parentId:
                "bid:56e4d337f8554ce34071743b1976e164da01728d824b4963761154c965fb5625",
            value: "299999000000000000000000000000",
          )).called(1);
      verifyNoMoreInteractions(_mockConsensusAbst);
      verifyNoMoreInteractions(_mockResponse);
    });
    test(
        'the call function of the "get Sia Fund Fee Controller" should return a response type',
        () async {
      //Arrange - Setup facts, Put Expected outputs or Initilize
      when(() => _mockConsensusAbst.getSiaFundFee(
            password: 'renterd',
            payout: 100000000,
          )).thenAnswer((_) async => _mockResponse);

      final verifyVariable = await _getSiaFundFeeController.call(
        password: 'renterd',
        payout: 100000000,
      );

      //Assert - Compare the actual result and expected result
      expect(verifyVariable, _mockResponse);
      verify(() => _mockConsensusAbst.getSiaFundFee(
            password: 'renterd',
            payout: 100000000,
          )).called(1);
      verifyNoMoreInteractions(_mockConsensusAbst);
      verifyNoMoreInteractions(_mockResponse);
    });
    test(
        'the call function of the "get State Controller" should return a response type',
        () async {
      //Arrange - Setup facts, Put Expected outputs or Initilize
      when(() => _mockConsensusAbst.getState(
            password: 'renterd',
          )).thenAnswer((_) async => _mockResponse);

      final verifyVariable = await _getStateController.call(
        password: 'renterd',
      );

      //Assert - Compare the actual result and expected result
      expect(verifyVariable, _mockResponse);
      verify(() => _mockConsensusAbst.getState(
            password: 'renterd',
          )).called(1);
      verifyNoMoreInteractions(_mockConsensusAbst);
      verifyNoMoreInteractions(_mockResponse);
    });
  });
}