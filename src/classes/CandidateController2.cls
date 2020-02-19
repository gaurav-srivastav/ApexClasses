public with sharing class CandidateController2 {
    
        public list<Candidate__c> Conlist{get;set;}
        public pageReference getCandidate(){
        Conlist=[select id, First_Name__c,Last_Name__c from Candidate__C];
        return null;
        
}
}