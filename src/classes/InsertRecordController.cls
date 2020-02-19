public with sharing class InsertRecordController {
public Candidate__c N {get;set;}
    public list<Candidate__c> crecord {get;set;}
    
    public InsertRecordController (){
    N = new Candidate__c();
    }
    
    
    public PageReference Save(){
     insert N ;
    crecord = [select id,First_Name__c,Last_Name__c from Candidate__C where id =:N.id];
    return null;
    } 
    public PageReference cancel(){
    return null;
    
    }
    
}