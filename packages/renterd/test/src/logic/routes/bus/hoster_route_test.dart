@Timeout(Duration(seconds: 90))
import 'package:flutter_test/flutter_test.dart';
import 'package:renterd/src/injection.dart';
import 'package:renterd/src/logic/controllers/renterd/bus/hoster_controllers/fetch_some_host_controller.dart';
import 'package:renterd/src/logic/controllers/renterd/bus/hoster_controllers/get_allow_list_controller.dart';
import 'package:renterd/src/logic/controllers/renterd/bus/hoster_controllers/get_block_list_controller.dart';
import 'package:renterd/src/logic/controllers/renterd/bus/hoster_controllers/get_host_info_by_public_key_controller.dart';
import 'package:renterd/src/logic/controllers/renterd/bus/hoster_controllers/get_host_scanning_controller.dart';
import 'package:renterd/src/logic/controllers/renterd/bus/hoster_controllers/get_hosts_controller.dart';
import 'package:renterd/src/logic/controllers/renterd/bus/hoster_controllers/post_interaction_controller.dart';
import 'package:renterd/src/logic/controllers/renterd/bus/hoster_controllers/remove_hosts_controller.dart';
import 'package:renterd/src/logic/controllers/renterd/bus/hoster_controllers/update_allow_list_controller.dart';
import 'package:renterd/src/logic/controllers/renterd/bus/hoster_controllers/update_block_list_controller.dart';
import 'package:renterd/src/logic/controllers/renterd/bus/hoster_controllers/update_some_host_controller.dart';
import 'package:renterd/src/logic/routes/renterd/bus/hoster_route.dart';

void main() async {
  Renterd.init();
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
  late String _serverAddress;
  late String _password;
  setUp(() {
    _getAllowListController = Renterd.sl<GetAllowListController>();
    _getBlockListController = Renterd.sl<GetBlockListController>();
    _getHostInfoByPublicKeyController =
        Renterd.sl<GetHostInfoByPublicKeyController>();
    _getHostScannigController = Renterd.sl<GetHostScannigController>();
    _getHostsController = Renterd.sl<GetHostsController>();
    _postInteractionController = Renterd.sl<PostInteractionController>();
    _removeHostsController = Renterd.sl<RemoveHostsController>();
    _updateAllowListController = Renterd.sl<UpdateAllowListController>();
    _updateBlockListController = Renterd.sl<UpdateBlockListController>();
    _fetchSomeHostController = Renterd.sl<FetchSomeHostController>();
    _updateSomeHostController = Renterd.sl<UpdateSomeHostController>();
    _serverAddress = "https://0a96-34-212-52-203.ngrok-free.app";
    _password = "Vykuj3546@";
  });

  group('HostRoute => ', () {
    // write tests
    test(
      "the getAllowList function whose Returns the current allowlist of the bus like http.Response",
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        final testValue = await _getAllowListController.call(
          password: _password,
          serverAddress: _serverAddress,
        );

        //Act - Call the function that is to be tested

        final verifyValue = await Hoster.getAllowList(
          password: _password,
          serverAddress: _serverAddress,
        );

        //Assert - Compare the actual result and expected result
        expect(testValue.statusCode, verifyValue.statusCode);
      },
    );
    test(
      "the getBlockList function whose Returns the current blocklist of the bus like http.Response",
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        final testValue = await _getBlockListController.call(
          password: _password,
          serverAddress: _serverAddress,
        );

        //Act - Call the function that is to be tested

        final verifyValue = await Hoster.getBlockList(
          password: _password,
          serverAddress: _serverAddress,
        );

        //Assert - Compare the actual result and expected result
        expect(testValue.statusCode, verifyValue.statusCode);
      },
    );
    test(
      "the getHostInfoByPublicKey function whose Returns some information about the host identified by a given public key like http.Response",
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        final testValue = await _getHostInfoByPublicKeyController.call(
            password: _password,
            serverAddress: _serverAddress,
            publicKey:
                "ed25519:b050c0c63f9f3b4d5a89acadf628e8d8c6f8768e38fbe731e429334e0fd2cece");

        //Act - Call the function that is to be tested

        final verifyValue = await Hoster.getHostInfoByPublicKey(
            password: _password,
            serverAddress: _serverAddress,
            publicKey:
                "ed25519:b050c0c63f9f3b4d5a89acadf628e8d8c6f8768e38fbe731e429334e0fd2cece");

        //Assert - Compare the actual result and expected result
        expect(testValue.statusCode, verifyValue.statusCode);
      },
    );
    test(
      "the getHostScannig function whose Returns a list of hosts for scanning. Hosts that have been scanned recently can be ignored by adjusting the lastScan argument like http.Response",
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        final testValue = await _getHostScannigController.call(
          password: _password,
          serverAddress: _serverAddress,
          lastScan: "2023-03-30T15%3A45%3A52%2B02%3A00",
          limit: 10,
          offset: 0,
        );

        //Act - Call the function that is to be tested

        final verifyValue = await Hoster.getHostScannig(
          password: _password,
          serverAddress: _serverAddress,
          lastScan: "2023-03-30T15%3A45%3A52%2B02%3A00",
          limit: 10,
          offset: 0,
        );

        //Assert - Compare the actual result and expected result
        expect(testValue.statusCode, verifyValue.statusCode);
      },
    );
    test(
      "the getHosts function whose Returns information about all hosts known to the bus like http.Response",
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        final testValue = await _getHostsController.call(
          password: _password,
          serverAddress: _serverAddress,
        );

        //Act - Call the function that is to be tested

        final verifyValue = await Hoster.getHosts(
          password: _password,
          serverAddress: _serverAddress,
        );

        //Assert - Compare the actual result and expected result
        expect(testValue.statusCode, verifyValue.statusCode);
      },
    );
    test(
      "the postInteraction function whose Records host ineractions in the bus. Commonly called by workers when scanning hosts like http.Response",
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        final testValue = await _postInteractionController.call(
          password: _password,
          serverAddress: _serverAddress,
          hostScanData: [],
        );

        //Act - Call the function that is to be tested

        final verifyValue = await Hoster.postInteraction(
          password: _password,
          serverAddress: _serverAddress,
          hostScanData: [],
        );

        //Assert - Compare the actual result and expected result
        expect(testValue.statusCode, verifyValue.statusCode);
      },
    );
    test(
      "the removeHosts function whose Removes all hosts with a given downtime and minimum number of total scans from the bus",
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        final testValue = await _removeHostsController.call(
          password: _password,
          serverAddress: _serverAddress,
          maxDowntimeHours: '1000',
          minRecentScanFailures: 3,
        );

        //Act - Call the function that is to be tested

        final verifyValue = await Hoster.removeHosts(
          password: _password,
          serverAddress: _serverAddress,
          maxDowntimeHours: '1000',
          minRecentScanFailures: 3,
        );

        //Assert - Compare the actual result and expected result
        expect(testValue.statusCode, verifyValue.statusCode);
      },
    );
    test(
      "the updateAllowList function whose Updates the allowlist of the bus by adding/removing hosts by their public key",
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        final testValue = await _updateAllowListController.call(
          password: _password,
          serverAddress: _serverAddress,
          addHostList: [],
          removeHostList: [
            "ed25519:6f7ac63891fa2eadeb3031b75817a4beaae91070f485c3d139f1ffd3107d6aa8"
          ],
        );

        //Act - Call the function that is to be tested

        final verifyValue = await Hoster.updateAllowList(
          password: _password,
          serverAddress: _serverAddress,
          addHostList: [],
          removeHostList: [
            "ed25519:6f7ac63891fa2eadeb3031b75817a4beaae91070f485c3d139f1ffd3107d6aa8"
          ],
        );

        //Assert - Compare the actual result and expected result
        expect(testValue.statusCode, verifyValue.statusCode);
      },
    );
    test(
      "the updateBlockList function whose Updates the blocklist of the bus by adding/removing hosts by their domain or IP address",
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        final testValue = await _updateBlockListController.call(
          password: _password,
          serverAddress: _serverAddress,
          addHostList: [],
          removeHostList: [
            "siacentral.ddnsfree.com",
            "siacentral.mooo.com",
            "51.158.108.244",
            "45.148.30.56"
          ],
        );

        //Act - Call the function that is to be tested

        final verifyValue = await Hoster.updateBlockList(
          password: _password,
          serverAddress: _serverAddress,
          addHostList: [],
          removeHostList: [
            "siacentral.ddnsfree.com",
            "siacentral.mooo.com",
            "51.158.108.244",
            "45.148.30.56"
          ],
        );

        //Assert - Compare the actual result and expected result
        expect(testValue.statusCode, verifyValue.statusCode);
      },
    );

    test(
      "the fetchSomeHost function whose return the user's host ",
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        final testValue = await _fetchSomeHostController.call(
          password: _password,
          serverAddress: _serverAddress,
        );

        print(testValue.statusCode);

        //Act - Call the function that is to be tested

        final verifyValue = await Hoster.fetchSomeHost(
          password: _password,
          serverAddress: _serverAddress,
        );

        //Assert - Compare the actual result and expected result
        expect(testValue.statusCode, verifyValue.statusCode);
      },
    );

    test(
      "the updateSomeHost function whose help the user to update some host",
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        final testValue = await _updateSomeHostController.call(
          password: _password,
          serverAddress: _serverAddress,
          hostConfig: {},
        );

        //Act - Call the function that is to be tested

        final verifyValue = await Hoster.updateSomeHost(
          password: _password,
          serverAddress: _serverAddress,
          hostConfig: {},
        );

        //Assert - Compare the actual result and expected result
        expect(
          testValue.statusCode,
          verifyValue.statusCode,
        );
      },
    );
  });
}
