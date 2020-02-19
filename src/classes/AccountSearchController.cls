public with sharing class AccountSearchController {
    @AuraEnabled
    public static List<Account> searchAccount(String searchTerm){
        List<Account> accounts = new List<Account>();
        if(String.isNotBlank(searchTerm)){
            List<List<sObject>> searchResults = [
                FIND :searchTerm
                RETURNING Account(
                    Id, Name, Phone, Website,
                    BillingStreet, BillingCity,
                    BillingState, BillingPostalCode
                    ORDER BY Name
                    LIMIT 50 //change by gaurav
                )
            ];
       accounts = searchResults[0];
        }
        return accounts;
    }
}