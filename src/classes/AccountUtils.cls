public class AccountUtils{
    public static List<Account> accountsByState(String stt){
        List<Account> accList = [SELECT ID, Name, BillingState FROM Account WHERE BillingState =:stt];
        return accList;
        
    }
}