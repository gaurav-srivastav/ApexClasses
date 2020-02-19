public with sharing class JAC_Controller {
    
        public list<Job_Application__c> Conlist{get;set;}

    public JAC_Controller(ApexPages.StandardController controller) {
     getCandidate();
        
    }

public pageReference getCandidate(){
Conlist = [select Candidate__r.ID,Position__r.ID,Candidate__r.First_Name__C,Candidate__r.Last_Name__c from Job_Application__c where Position__r.ID =:ApexPages.CurrentPage().getParameters().get('id')];


return null;

}
}