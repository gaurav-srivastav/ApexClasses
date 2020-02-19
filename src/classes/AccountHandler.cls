public with sharing class AccountHandler {
    public static void CreateNewOpportunity(List<Account> accts) {
        for (Account ac : accts) { //change the accobject name
            Opportunity opp = new Opportunity();
            opp.Name = ac.Name + ' Opportunity';
            opp.AccountId = ac.Id;
            opp.StageName = 'Prospecting';
            opp.CloseDate = System.Today().addMonths(1);
            insert opp;
        }
    }
}