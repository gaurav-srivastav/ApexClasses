public class PaymentHistories {

    public String getPayOpt() {
        return null;
    }


        public Date FromDate{get;set;}
        public Date ToDate{get;set;}
        public list<Payment__c> listOfAccounts{get;set;}
        public list<SelectOption> listOfPay {get;set;}
        public list<String> SelectedPay {get;set;}
        public PaymentHistories (){
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
    
    
}