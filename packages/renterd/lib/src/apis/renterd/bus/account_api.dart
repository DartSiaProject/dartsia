String getAccountsApi(String serverAddress) =>
    "$serverAddress/api/bus/accounts";
String getAnAccountByIdApi(String accounId, String serverAddress) =>
    "$serverAddress/api/bus/accounts/$accounId";
String lockAnAccountApi(String accounId, String serverAddress) =>
    "$serverAddress/api/bus/accounts/$accounId/lock";
String unLockAnAccountApi(String accounId, String serverAddress) =>
    "$serverAddress/api/bus/accounts/$accounId/unlock";
String addDepositApi(String accounId, String serverAddress) =>
    "$serverAddress/api/bus/accounts/$accounId/add";
String updateBalanceApi(String accounId, String serverAddress) =>
    "$serverAddress/api/bus/accounts/$accounId/update";
String syncBalanceApi(String accounId, String serverAddress) =>
    "$serverAddress/api/bus/accounts/$accounId/requiressync";
String resetDriftApi(String accounId, String serverAddress) =>
    "$serverAddress/api/bus/accounts/$accounId/resetdrift";
