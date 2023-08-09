import 'package:flutter_test/flutter_test.dart';
import 'package:renterd/src/injection.dart' as insert;
import 'package:renterd/src/logic/controllers/host_controllers/fetch_some_host_controller.dart';
import 'package:renterd/src/logic/controllers/host_controllers/get_allow_list_controller.dart';
import 'package:renterd/src/logic/controllers/host_controllers/get_block_list_controller.dart';
import 'package:renterd/src/logic/controllers/host_controllers/get_host_info_by_public_key_controller.dart';
import 'package:renterd/src/logic/controllers/host_controllers/get_host_scanning_controller.dart';
import 'package:renterd/src/logic/controllers/host_controllers/get_hosts_controller.dart';
import 'package:renterd/src/logic/controllers/host_controllers/post_interaction_controller.dart';
import 'package:renterd/src/logic/controllers/host_controllers/remove_hosts_controller.dart';
import 'package:renterd/src/logic/controllers/host_controllers/update_allow_list_controller.dart';
import 'package:renterd/src/logic/controllers/host_controllers/update_block_list_controller.dart';
import 'package:renterd/src/logic/controllers/host_controllers/update_some_host_controller.dart';
import 'package:renterd/src/logic/routes/host_route.dart';

void main() async {
  await insert.initialization();
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

  setUp(() {
    _getAllowListController = insert.sl<GetAllowListController>();
    _getBlockListController = insert.sl<GetBlockListController>();
    _getHostInfoByPublicKeyController =
        insert.sl<GetHostInfoByPublicKeyController>();
    _getHostScannigController = insert.sl<GetHostScannigController>();
    _getHostsController = insert.sl<GetHostsController>();
    _postInteractionController = insert.sl<PostInteractionController>();
    _removeHostsController = insert.sl<RemoveHostsController>();
    _updateAllowListController = insert.sl<UpdateAllowListController>();
    _updateBlockListController = insert.sl<UpdateBlockListController>();
    _fetchSomeHostController = insert.sl<FetchSomeHostController>();
    _updateSomeHostController = insert.sl<UpdateSomeHostController>();
  });

  group('HostRoute => ', () {
    // write tests
    test(
      "the getAllowList function whose Returns the current allowlist of the bus like http.Response",
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        final testValue = await _getAllowListController.call(
          password: 'renterd',
        );

        //Act - Call the function that is to be tested

        final verifyValue = await Hoster.getAllowList(
          password: 'renterd',
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
          password: 'renterd',
        );

        //Act - Call the function that is to be tested

        final verifyValue = await Hoster.getBlockList(
          password: 'renterd',
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
            password: 'renterd',
            publicKey:
                "ed25519:b050c0c63f9f3b4d5a89acadf628e8d8c6f8768e38fbe731e429334e0fd2cece");

        //Act - Call the function that is to be tested

        final verifyValue = await Hoster.getHostInfoByPublicKey(
            password: 'renterd',
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
          password: 'renterd',
          lastScan: "2023-03-30T15%3A45%3A52%2B02%3A00",
          limit: 10,
          offset: 0,
        );

        //Act - Call the function that is to be tested

        final verifyValue = await Hoster.getHostScannig(
          password: 'renterd',
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
          password: 'renterd',
        );

        //Act - Call the function that is to be tested

        final verifyValue = await Hoster.getHosts(
          password: 'renterd',
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
          password: 'renterd',
          hostScanData: [],
        );

        //Act - Call the function that is to be tested

        final verifyValue = await Hoster.postInteraction(
          password: 'renterd',
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
          password: 'renterd',
          maxDowntimeHours: '1000',
          minRecentScanFailures: 3,
        );

        //Act - Call the function that is to be tested

        final verifyValue = await Hoster.removeHosts(
          password: 'renterd',
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
          password: 'renterd',
          addHostList: [],
          removeHostList: [
            "ed25519:6f7ac63891fa2eadeb3031b75817a4beaae91070f485c3d139f1ffd3107d6aa8"
          ],
        );

        //Act - Call the function that is to be tested

        final verifyValue = await Hoster.updateAllowList(
          password: 'renterd',
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
          password: 'renterd',
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
        expect(testValue.statusCode, verifyValue.statusCode);
      },
    );

    test(
      "the fetchSomeHost function whose return the user's host ",
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        final testValue = await _fetchSomeHostController.call(
          password: 'renterd',
        );

        //Act - Call the function that is to be tested

        final verifyValue = await Hoster.fetchSomeHost(
          password: 'renterd',
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
          password: 'renterd',
          hostConfig: {},
        );

        //Act - Call the function that is to be tested

        final verifyValue = await Hoster.updateSomeHost(
          password: 'renterd',
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
