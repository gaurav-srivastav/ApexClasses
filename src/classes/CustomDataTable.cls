public class CustomDataTable {

    public Date ToDate { get; set; }

    public Date FromDate { get; set; }
    
    list<Payment__c> dataT {get;set;}
    
    public  CustomDataTable (){
        dataT =new list<Payment__c>();
        
    }
    

    public PageReference displayRecord() {
     if(FromDate!= NULL && ToDate!= NULL){
        dataT= [SELECT Id,Account__c,Amount__c, Payment_Status__c, Transaction_Status__c, CreatedDate, Approved_Date__c FROM Payment__c where CreatedDate >= : FromDate and CreatedDate <=:  ToDate ORDER BY CreatedDate LIMIT 50];
        }else{
        system.debug('Date is Blank');
        }       
        return null;
    }

}