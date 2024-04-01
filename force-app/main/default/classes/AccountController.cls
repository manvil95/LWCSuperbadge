public with sharing class AccountController {
    
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts() {
        return [
            SELECT Name, 
                    AnnualRevenue, 
                    Industry
            FROM Account
            WITH USER_MODE
            ORDER BY Name
        ];
    }
}