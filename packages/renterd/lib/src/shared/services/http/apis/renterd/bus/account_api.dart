class AccountApi {
  static String getAccounts(String serverAddress) =>
      "$serverAddress/api/bus/accounts";
  static String getAnAccountById(String accounId, String serverAddress) =>
      "$serverAddress/api/bus/accounts/$accounId";
  static String lockAnAccount(String accounId, String serverAddress) =>
      "$serverAddress/api/bus/accounts/$accounId/lock";
  static String unLockAnAccount(String accounId, String serverAddress) =>
      "$serverAddress/api/bus/accounts/$accounId/unlock";
  static String addDeposit(String accounId, String serverAddress) =>
      "$serverAddress/api/bus/accounts/$accounId/add";
  static String updateBalance(String accounId, String serverAddress) =>
      "$serverAddress/api/bus/accounts/$accounId/update";
  static String syncBalance(String accounId, String serverAddress) =>
      "$serverAddress/api/bus/accounts/$accounId/requiressync";
  static String resetDrift(String accounId, String serverAddress) =>
      "$serverAddress/api/bus/accounts/$accounId/resetdrift";
}
