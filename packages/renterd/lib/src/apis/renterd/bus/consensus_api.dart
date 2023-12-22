String postAcceptBlockApi(String serverAddress) =>
    "$serverAddress/api/bus/consensus/acceptblock";
String getStateApi(String serverAddress) =>
    "$serverAddress/api/bus/consensus/state";
String getTotalPayoutApi(int payout, String serverAddress) =>
    "$serverAddress/api/bus/consensus/siafundfee/$payout";
