class ConsensusApi {
  static String postAcceptBlock(String serverAddress) =>
      "$serverAddress/api/bus/consensus/acceptblock";
  static String getState(String serverAddress) =>
      "$serverAddress/api/bus/consensus/state";
  static String getTotalPayout(int payout, String serverAddress) =>
      "$serverAddress/api/bus/consensus/siafundfee/$payout";
}
