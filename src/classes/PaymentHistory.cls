public with sharing class PaymentHistory {

    public String getPayOtps() {
        return null;
    }




        public Date FromDate{get;set;}
        public Date ToDate{get;set;}
        public list<Payment__c> listOfAccounts{get;set;}
             
        public PaymentHistory (){
            listOfAccounts= new List<Payment__c>();
        }
        
       public List<SelectOption> payOtps()
    {
       List<SelectOption> results=new List<SelectOption>();
       for (Payment__c pay: [select id, Payment_Status__c from Payment__c LIMIT 5])
       {
          results.add(new SelectOption(pay.Payment_Status__c , pay.Payment_Status__c ));
       }
       return results;
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