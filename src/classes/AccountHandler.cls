public with sharing class AccountHandler {
    public static void CreateNewOpportunity(List<Account> accts) {
        for (Account acc : accts) { //change the account object name
            Opportunity opp = new Opportunity();
            opp.Name = acc.Name + ' Opportunity';
            opp.AccountId = acc.Id;
            opp.StageName = 'Prospecting';
            opp.CloseDate = System.Today().addMonths(1);
            insert opp;
        }
    }
}