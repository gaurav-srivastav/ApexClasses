public with sharing class DataTableExampleController {
  public Date ToDate { get; set; }

    public Date FromDate { get; set; }
    public list<Payment__c> listOfAccounts{get;set;}
    
    
    
    public DataTableExampleController (){
            listOfAccounts= new List<Payment__c>();
            
        }

    
    
    public PageReference displayRecord() {
             if(FromDate!= NULL && ToDate!= NULL){
        listOfAccounts= [SELECT Id,Account__c,Amount__c, Payment_Status__c, Transaction_Status__c, CreatedDate, Approved_Date__c FROM Payment__c where CreatedDate >= : FromDate and CreatedDate <=:  ToDate ORDER BY CreatedDate LIMIT 50];
        }else{
        system.debug('Date is Blank');
        }       
        return null;
    }
  
    
public List<Payment__c> contactList {
get {
if (contactList == null) {
contactList = [SELECT Id,Account__c,Name,Amount__c, Payment_Status__c, Transaction_Status__c, CreatedDate, Approved_Date__c FROM Payment__c];
}
return contactList;
}
set;
}



}