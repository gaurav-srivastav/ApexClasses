public with sharing class candidatecontroller12 {
public Candidate__C candidate=new Candidate__C();

public list<candidate__C> canlist{get;set;}

    public candidatecontroller12(ApexPages.StandardController controller) {

candidate=(candidate__c)controller.getRecord();

canlist=new list<candidate__C>();

    }

    public PageReference addRecord(){

    Candidate__C newRecord = new Candidate__C ();

    newRecord.first_name__C = candidate.first_name__C ;

    newRecord.Last_Name__c= candidate.Last_Name__c;

    canlist.add(newRecord);

  

    return null;

    }

    

    public pagereference save(){

    insert canlist;

    return null;

    }

}