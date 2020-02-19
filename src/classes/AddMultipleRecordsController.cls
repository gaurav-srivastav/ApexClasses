public with sharing class AddMultipleRecordsController {
      Candidate__c   con = new Candidate__c();
      
      
        public list<Candidate__c> listRecord {get;set;}
        
        public AddMultipleRecordsController(){
           listRecord  = new list<Candidate__c>();
              listRecord.add(con);
        
        }
        public void addRows(){
        Candidate__c con2 =new Candidate__c();
                  /*if(con2 .id!=null){
                 con2 .id=null;
                 }*/
            listRecord.add(con2); 
        }
        
         public PageReference saveRecords(){
        for(Integer i=1; i<listRecord.size(); i++) {
            insert listRecord;
        }
        return null;
    }
        

}