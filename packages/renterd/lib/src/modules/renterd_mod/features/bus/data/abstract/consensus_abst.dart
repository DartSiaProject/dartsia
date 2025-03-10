abstract class ConsensusAbst {
  Future<Map<String, dynamic>> acceptBlock({
    // String? username,
    // required String password,
    required String parentId,
    required String address,
    required String value,
    required List<String> arbitraryDataList,
    required String serverAddress,
    required String key,
    required String iv,
  });

  Future<Map<String, dynamic>> getSiaFundFee({
    // String? username,
    // required String password,
    required int payout,
    required String serverAddress,
    required String key,
    required String iv,
  });

  Future<Map<String, dynamic>> getState({
    // String? username,
    // required String password,
    required String serverAddress,
    required String key,
    required String iv,
  });
}
