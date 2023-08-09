const getAccountsApi = "api/bus/accounts";
String getAnAccountByIdApi(String accounId) => "api/bus/accounts/$accounId";
String lockAnAccountApi(String accounId) => "api/bus/accounts/$accounId/lock";
String unLockAnAccountApi(String accounId) =>
    "api/bus/accounts/$accounId/unlock";
String addDepositApi(String accounId) => "api/bus/accounts/$accounId/add";
String updateBalanceApi(String accounId) => "api/bus/accounts/$accounId/update";
String syncBalanceApi(String accounId) =>
    "api/bus/accounts/$accounId/requiressync";
String resetDriftApi(String accounId) =>
    "api/bus/accounts/$accounId/resetdrift";
