@Timeout(Duration(seconds: 90))
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:renterd/src/abstract/hoster_abst.dart';
import 'package:renterd/src/logic/controllers/hoster_controllers/fetch_some_host_controller.dart';
import 'package:renterd/src/logic/controllers/hoster_controllers/get_allow_list_controller.dart';
import 'package:renterd/src/logic/controllers/hoster_controllers/get_block_list_controller.dart';
import 'package:renterd/src/logic/controllers/hoster_controllers/get_host_info_by_public_key_controller.dart';
import 'package:renterd/src/logic/controllers/hoster_controllers/get_host_scanning_controller.dart';
import 'package:renterd/src/logic/controllers/hoster_controllers/get_hosts_controller.dart';
import 'package:renterd/src/logic/controllers/hoster_controllers/post_interaction_controller.dart';
import 'package:renterd/src/logic/controllers/hoster_controllers/remove_hosts_controller.dart';
import 'package:renterd/src/logic/controllers/hoster_controllers/update_allow_list_controller.dart';
import 'package:renterd/src/logic/controllers/hoster_controllers/update_block_list_controller.dart';
import 'package:renterd/src/logic/controllers/hoster_controllers/update_some_host_controller.dart';

class MockHosterAbst extends Mock implements HosterAbst {}

class MockResponse extends Mock implements Response {}

void main() {
  late MockHosterAbst _mockHosterAbst;
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
  late FetchSomeHostController _fetchSomeHostController;
  late UpdateSomeHostController _updateSomeHostController;

  late String _ipAdress;
  late String _password;
  setUp(() {
    _mockHosterAbst = MockHosterAbst();
    _mockResponse = MockResponse();
    _getAllowListController =
        GetAllowListController(hosterAbst: _mockHosterAbst);
    _getBlockListController =
        GetBlockListController(hosterAbst: _mockHosterAbst);
    _getHostInfoByPublicKeyController =
        GetHostInfoByPublicKeyController(hosterAbst: _mockHosterAbst);
    _getHostScannigController =
        GetHostScannigController(hosterAbst: _mockHosterAbst);
    _getHostsController = GetHostsController(hosterAbst: _mockHosterAbst);
    _postInteractionController =
        PostInteractionController(hosterAbst: _mockHosterAbst);
    _removeHostsController = RemoveHostsController(hosterAbst: _mockHosterAbst);
    _updateAllowListController =
        UpdateAllowListController(hosterAbst: _mockHosterAbst);
    _updateBlockListController =
        UpdateBlockListController(hosterAbst: _mockHosterAbst);
    _fetchSomeHostController =
        FetchSomeHostController(hosterAbst: _mockHosterAbst);
    _updateSomeHostController =
        UpdateSomeHostController(hosterAbst: _mockHosterAbst);
    _ipAdress = "0a96-34-212-52-203";
    _password = "Vykuj3546@";

    // todo :  ip local "127.0.0.1";
  });

  group('HostController => ', () {
    // write tests
    test(
      'the call function of the "Get AllowList Controller" should return a response type',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockHosterAbst.getAllowList(
              password: _password,
              ipAdress: _ipAdress,
            )).thenAnswer((_) async => _mockResponse);

        final verifyVariable = await _getAllowListController.call(
          password: _password,
          ipAdress: _ipAdress,
        );

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, _mockResponse);
        verify(() => _mockHosterAbst.getAllowList(
              password: _password,
              ipAdress: _ipAdress,
            )).called(1);
        verifyNoMoreInteractions(_mockHosterAbst);
        verifyNoMoreInteractions(_mockResponse);
      },
    );
    test(
      'the call function of the "Get BlockList Controller" should return a response type',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockHosterAbst.getBlockList(
              password: _password,
              ipAdress: _ipAdress,
            )).thenAnswer((_) async => _mockResponse);

        final verifyVariable = await _getBlockListController.call(
          password: _password,
          ipAdress: _ipAdress,
        );

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, _mockResponse);
        verify(() => _mockHosterAbst.getBlockList(
              password: _password,
              ipAdress: _ipAdress,
            )).called(1);
        verifyNoMoreInteractions(_mockHosterAbst);
        verifyNoMoreInteractions(_mockResponse);
      },
    );
    test(
      'the call function of the "Get HostInfo By PublicKey Controller" should return a response type',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockHosterAbst.getHostInfoByPublicKey(
                password: _password,
                ipAdress: _ipAdress,
                publicKey:
                    "ed25519:b050c0c63f9f3b4d5a89acadf628e8d8c6f8768e38fbe731e429334e0fd2cece"))
            .thenAnswer((_) async => _mockResponse);

        final verifyVariable = await _getHostInfoByPublicKeyController.call(
            password: _password,
            ipAdress: _ipAdress,
            publicKey:
                "ed25519:b050c0c63f9f3b4d5a89acadf628e8d8c6f8768e38fbe731e429334e0fd2cece");

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, _mockResponse);
        verify(() => _mockHosterAbst.getHostInfoByPublicKey(
                password: _password,
                ipAdress: _ipAdress,
                publicKey:
                    "ed25519:b050c0c63f9f3b4d5a89acadf628e8d8c6f8768e38fbe731e429334e0fd2cece"))
            .called(1);
        verifyNoMoreInteractions(_mockHosterAbst);
        verifyNoMoreInteractions(_mockResponse);
      },
    );
    test(
      'the call function of the "Get HostScannig Controller" should return a response type',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockHosterAbst.getHostScannig(
              password: _password,
              ipAdress: _ipAdress,
              lastScan: "2023-03-30T15%3A45%3A52%2B02%3A00",
              limit: 10,
              offset: 0,
            )).thenAnswer((_) async => _mockResponse);

        final verifyVariable = await _getHostScannigController.call(
          password: _password,
          ipAdress: _ipAdress,
          lastScan: "2023-03-30T15%3A45%3A52%2B02%3A00",
          limit: 10,
          offset: 0,
        );

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, _mockResponse);
        verify(() => _mockHosterAbst.getHostScannig(
              password: _password,
              ipAdress: _ipAdress,
              lastScan: "2023-03-30T15%3A45%3A52%2B02%3A00",
              limit: 10,
              offset: 0,
            )).called(1);
        verifyNoMoreInteractions(_mockHosterAbst);
        verifyNoMoreInteractions(_mockResponse);
      },
    );
    test(
      'the call function of the " Get Hosts Controller" should return a response type',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockHosterAbst.getHosts(
              password: _password,
              ipAdress: _ipAdress,
            )).thenAnswer((_) async => _mockResponse);

        final verifyVariable = await _getHostsController.call(
          password: _password,
          ipAdress: _ipAdress,
        );

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, _mockResponse);
        verify(() => _mockHosterAbst.getHosts(
              password: _password,
              ipAdress: _ipAdress,
            )).called(1);
        verifyNoMoreInteractions(_mockHosterAbst);
        verifyNoMoreInteractions(_mockResponse);
      },
    );
    test(
      'the call function of the "Post Interaction Controller" should return a response type',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockHosterAbst.postInteraction(
              password: _password,
              ipAdress: _ipAdress,
              hostScanData: [],
            )).thenAnswer((_) async => _mockResponse);

        final verifyVariable = await _postInteractionController.call(
          password: _password,
          ipAdress: _ipAdress,
          hostScanData: [],
        );

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, _mockResponse);
        verify(() => _mockHosterAbst.postInteraction(
              password: _password,
              ipAdress: _ipAdress,
              hostScanData: [],
            )).called(1);
        verifyNoMoreInteractions(_mockHosterAbst);
        verifyNoMoreInteractions(_mockResponse);
      },
    );
    test(
      'the call function of the "Remove Hosts Controller " should return a response type',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockHosterAbst.removeHosts(
              password: _password,
              maxDowntimeHours: '1000',
              ipAdress: _ipAdress,
              minRecentScanFailures: 3,
            )).thenAnswer((_) async => _mockResponse);

        final verifyVariable = await _removeHostsController.call(
          password: _password,
          maxDowntimeHours: '1000',
          ipAdress: _ipAdress,
          minRecentScanFailures: 3,
        );

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, _mockResponse);
        verify(() => _mockHosterAbst.removeHosts(
              password: _password,
              maxDowntimeHours: '1000',
              ipAdress: _ipAdress,
              minRecentScanFailures: 3,
            )).called(1);
        verifyNoMoreInteractions(_mockHosterAbst);
        verifyNoMoreInteractions(_mockResponse);
      },
    );
    test(
      'the call function of the "Update AllowList Controller " should return a response type',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockHosterAbst.updateAllowList(
              password: _password,
              ipAdress: _ipAdress,
              addHostList: [],
              removeHostList: [
                "ed25519:6f7ac63891fa2eadeb3031b75817a4beaae91070f485c3d139f1ffd3107d6aa8"
              ],
            )).thenAnswer((_) async => _mockResponse);

        final verifyVariable = await _updateAllowListController.call(
          password: _password,
          ipAdress: _ipAdress,
          addHostList: [],
          removeHostList: [
            "ed25519:6f7ac63891fa2eadeb3031b75817a4beaae91070f485c3d139f1ffd3107d6aa8"
          ],
        );

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, _mockResponse);
        verify(() => _mockHosterAbst.updateAllowList(
              password: _password,
              ipAdress: _ipAdress,
              addHostList: [],
              removeHostList: [
                "ed25519:6f7ac63891fa2eadeb3031b75817a4beaae91070f485c3d139f1ffd3107d6aa8"
              ],
            )).called(1);
        verifyNoMoreInteractions(_mockHosterAbst);
        verifyNoMoreInteractions(_mockResponse);
      },
    );
    test(
      'the call function of the "Update BlockList Controller " should return a response type',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockHosterAbst.updateBlockList(
              password: _password,
              ipAdress: _ipAdress,
              addHostList: [],
              removeHostList: [
                "siacentral.ddnsfree.com",
                "siacentral.mooo.com",
                "51.158.108.244",
                "45.148.30.56"
              ],
            )).thenAnswer((_) async => _mockResponse);

        final verifyVariable = await _updateBlockListController.call(
          password: _password,
          addHostList: [],
          ipAdress: _ipAdress,
          removeHostList: [
            "siacentral.ddnsfree.com",
            "siacentral.mooo.com",
            "51.158.108.244",
            "45.148.30.56"
          ],
        );

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, _mockResponse);
        verify(() => _mockHosterAbst.updateBlockList(
              password: _password,
              addHostList: [],
              ipAdress: _ipAdress,
              removeHostList: [
                "siacentral.ddnsfree.com",
                "siacentral.mooo.com",
                "51.158.108.244",
                "45.148.30.56"
              ],
            )).called(1);
        verifyNoMoreInteractions(_mockHosterAbst);
        verifyNoMoreInteractions(_mockResponse);
      },
    );

    test(
      'the call function of the "FetchSomeHostController" should return a response type',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockHosterAbst.fetchSomeHost(
              password: _password,
              ipAdress: _ipAdress,
            )).thenAnswer((_) async => _mockResponse);

        final verifyVariable = await _fetchSomeHostController.call(
          password: _password,
          ipAdress: _ipAdress,
        );

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, _mockResponse);
        verify(() => _mockHosterAbst.fetchSomeHost(
              password: _password,
              ipAdress: _ipAdress,
            )).called(1);
        verifyNoMoreInteractions(_mockHosterAbst);
        verifyNoMoreInteractions(_mockResponse);
      },
    );

    test(
      'the call function of the "UpdateSomeHostController" should return a response type',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockHosterAbst.updateSomeHost(
              password: _password,
              ipAdress: _ipAdress,
              hostConfig: {},
            )).thenAnswer((_) async => _mockResponse);

        final verifyVariable = await _updateSomeHostController.call(
          password: _password,
          ipAdress: _ipAdress,
          hostConfig: {},
        );

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, _mockResponse);
        verify(() => _mockHosterAbst.updateSomeHost(
              password: _password,
              ipAdress: _ipAdress,
              hostConfig: {},
            )).called(1);
        verifyNoMoreInteractions(_mockHosterAbst);
        verifyNoMoreInteractions(_mockResponse);
      },
    );
  });
}
