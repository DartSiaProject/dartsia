import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:renterd/src/abstract/host_abst.dart';
import 'package:renterd/src/logic/controllers/host_controllers/get_allow_list_controller.dart';
import 'package:renterd/src/logic/controllers/host_controllers/get_block_list_controller.dart';
import 'package:renterd/src/logic/controllers/host_controllers/get_host_info_by_public_key_controller.dart';
import 'package:renterd/src/logic/controllers/host_controllers/get_host_scanning_controller.dart';
import 'package:renterd/src/logic/controllers/host_controllers/get_hosts_controller.dart';
import 'package:renterd/src/logic/controllers/host_controllers/post_interaction_controller.dart';
import 'package:renterd/src/logic/controllers/host_controllers/remove_hosts_controller.dart';
import 'package:renterd/src/logic/controllers/host_controllers/update_allow_list_controller.dart';
import 'package:renterd/src/logic/controllers/host_controllers/update_block_list_controller.dart';

class MockHostAbst extends Mock implements HostAbst {}

class MockResponse extends Mock implements Response {}

void main() {
  late MockHostAbst _mockHostAbst;
  late MockResponse _mockResponse;
  late GetAllowListController _getAllowListController;
  late GetBlockListController _getBlockListController;
  late GetHostInfoByPublicKeyController _getHostInfoByPublicKeyController;
  late GetHostScannigController _getHostScannigController;
  late GetHostsController _getHostsController;
  late PostInteractionController _postInteractionController;
  late RemoveHostsController _removeHostsController;
  late UpdateAllowListController _updateAllowListController;
  late UpdateBlockListController _updateBlockListController;
  setUp(() {
    _mockHostAbst = MockHostAbst();
    _mockResponse = MockResponse();
    _getAllowListController = GetAllowListController(hostAbst: _mockHostAbst);
    _getBlockListController = GetBlockListController(hostAbst: _mockHostAbst);
    _getHostInfoByPublicKeyController =
        GetHostInfoByPublicKeyController(hostAbst: _mockHostAbst);
    _getHostScannigController =
        GetHostScannigController(hostAbst: _mockHostAbst);
    _getHostsController = GetHostsController(hostAbst: _mockHostAbst);
    _postInteractionController =
        PostInteractionController(hostAbst: _mockHostAbst);
    _removeHostsController = RemoveHostsController(hostAbst: _mockHostAbst);
    _updateAllowListController =
        UpdateAllowListController(hostAbst: _mockHostAbst);
    _updateBlockListController =
        UpdateBlockListController(hostAbst: _mockHostAbst);
  });

  group('HostController => ', () {
    // write tests
    test(
      'the call function of the "Get AllowList Controller" should return a response type',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockHostAbst.getAllowList(
              password: 'renterd',
            )).thenAnswer((_) async => _mockResponse);

        final verifyVariable = await _getAllowListController.call(
          password: 'renterd',
        );

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, _mockResponse);
        verify(() => _mockHostAbst.getAllowList(
              password: 'renterd',
            )).called(1);
        verifyNoMoreInteractions(_mockHostAbst);
        verifyNoMoreInteractions(_mockResponse);
      },
    );
    test(
      'the call function of the "Get BlockList Controller" should return a response type',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockHostAbst.getBlockList(
              password: 'renterd',
            )).thenAnswer((_) async => _mockResponse);

        final verifyVariable = await _getBlockListController.call(
          password: 'renterd',
        );

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, _mockResponse);
        verify(() => _mockHostAbst.getBlockList(
              password: 'renterd',
            )).called(1);
        verifyNoMoreInteractions(_mockHostAbst);
        verifyNoMoreInteractions(_mockResponse);
      },
    );
    test(
      'the call function of the "Get HostInfo By PublicKey Controller" should return a response type',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockHostAbst.getHostInfoByPublicKey(
                password: 'renterd',
                publicKey:
                    "ed25519:b050c0c63f9f3b4d5a89acadf628e8d8c6f8768e38fbe731e429334e0fd2cece"))
            .thenAnswer((_) async => _mockResponse);

        final verifyVariable = await _getHostInfoByPublicKeyController.call(
            password: 'renterd',
            publicKey:
                "ed25519:b050c0c63f9f3b4d5a89acadf628e8d8c6f8768e38fbe731e429334e0fd2cece");

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, _mockResponse);
        verify(() => _mockHostAbst.getHostInfoByPublicKey(
                password: 'renterd',
                publicKey:
                    "ed25519:b050c0c63f9f3b4d5a89acadf628e8d8c6f8768e38fbe731e429334e0fd2cece"))
            .called(1);
        verifyNoMoreInteractions(_mockHostAbst);
        verifyNoMoreInteractions(_mockResponse);
      },
    );
    test(
      'the call function of the "Get HostScannig Controller" should return a response type',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockHostAbst.getHostScannig(
              password: 'renterd',
              lastScan: "2023-03-30T15%3A45%3A52%2B02%3A00",
              limit: 10,
              offset: 0,
            )).thenAnswer((_) async => _mockResponse);

        final verifyVariable = await _getHostScannigController.call(
          password: 'renterd',
          lastScan: "2023-03-30T15%3A45%3A52%2B02%3A00",
          limit: 10,
          offset: 0,
        );

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, _mockResponse);
        verify(() => _mockHostAbst.getHostScannig(
              password: 'renterd',
              lastScan: "2023-03-30T15%3A45%3A52%2B02%3A00",
              limit: 10,
              offset: 0,
            )).called(1);
        verifyNoMoreInteractions(_mockHostAbst);
        verifyNoMoreInteractions(_mockResponse);
      },
    );
    test(
      'the call function of the " Get Hosts Controller" should return a response type',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockHostAbst.getHosts(
              password: 'renterd',
            )).thenAnswer((_) async => _mockResponse);

        final verifyVariable = await _getHostsController.call(
          password: 'renterd',
        );

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, _mockResponse);
        verify(() => _mockHostAbst.getHosts(
              password: 'renterd',
            )).called(1);
        verifyNoMoreInteractions(_mockHostAbst);
        verifyNoMoreInteractions(_mockResponse);
      },
    );
    test(
      'the call function of the "Post Interaction Controller" should return a response type',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockHostAbst.postInteraction(
              password: 'renterd',
              hostScanData: [],
            )).thenAnswer((_) async => _mockResponse);

        final verifyVariable = await _postInteractionController.call(
          password: 'renterd',
          hostScanData: [],
        );

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, _mockResponse);
        verify(() => _mockHostAbst.postInteraction(
              password: 'renterd',
              hostScanData: [],
            )).called(1);
        verifyNoMoreInteractions(_mockHostAbst);
        verifyNoMoreInteractions(_mockResponse);
      },
    );
    test(
      'the call function of the "Remove Hosts Controller " should return a response type',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockHostAbst.removeHosts(
              password: 'renterd',
              maxDowntimeHours: '1000',
              minRecentScanFailures: 3,
            )).thenAnswer((_) async => _mockResponse);

        final verifyVariable = await _removeHostsController.call(
          password: 'renterd',
          maxDowntimeHours: '1000',
          minRecentScanFailures: 3,
        );

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, _mockResponse);
        verify(() => _mockHostAbst.removeHosts(
              password: 'renterd',
              maxDowntimeHours: '1000',
              minRecentScanFailures: 3,
            )).called(1);
        verifyNoMoreInteractions(_mockHostAbst);
        verifyNoMoreInteractions(_mockResponse);
      },
    );
    test(
      'the call function of the "Update AllowList Controller " should return a response type',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockHostAbst.updateAllowList(
              password: 'renterd',
              addHostList: [],
              removeHostList: [
                "ed25519:6f7ac63891fa2eadeb3031b75817a4beaae91070f485c3d139f1ffd3107d6aa8"
              ],
            )).thenAnswer((_) async => _mockResponse);

        final verifyVariable = await _updateAllowListController.call(
          password: 'renterd',
          addHostList: [],
          removeHostList: [
            "ed25519:6f7ac63891fa2eadeb3031b75817a4beaae91070f485c3d139f1ffd3107d6aa8"
          ],
        );

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, _mockResponse);
        verify(() => _mockHostAbst.updateAllowList(
              password: 'renterd',
              addHostList: [],
              removeHostList: [
                "ed25519:6f7ac63891fa2eadeb3031b75817a4beaae91070f485c3d139f1ffd3107d6aa8"
              ],
            )).called(1);
        verifyNoMoreInteractions(_mockHostAbst);
        verifyNoMoreInteractions(_mockResponse);
      },
    );
    test(
      'the call function of the "Update BlockList Controller " should return a response type',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockHostAbst.updateBlockList(
              password: 'renterd',
              addHostList: [],
              removeHostList: [
                "siacentral.ddnsfree.com",
                "siacentral.mooo.com",
                "51.158.108.244",
                "45.148.30.56"
              ],
            )).thenAnswer((_) async => _mockResponse);

        final verifyVariable = await _updateBlockListController.call(
          password: 'renterd',
          addHostList: [],
          removeHostList: [
            "siacentral.ddnsfree.com",
            "siacentral.mooo.com",
            "51.158.108.244",
            "45.148.30.56"
          ],
        );

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, _mockResponse);
        verify(() => _mockHostAbst.updateBlockList(
              password: 'renterd',
              addHostList: [],
              removeHostList: [
                "siacentral.ddnsfree.com",
                "siacentral.mooo.com",
                "51.158.108.244",
                "45.148.30.56"
              ],
            )).called(1);
        verifyNoMoreInteractions(_mockHostAbst);
        verifyNoMoreInteractions(_mockResponse);
      },
    );
  });
}
