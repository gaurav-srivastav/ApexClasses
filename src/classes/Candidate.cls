public with sharing class Candidate {
@AuraEnabled
    public static  List<Candidate__c> findAll(){
        return[SELECT id,First_Name__c,Phone__c FROM Candidate__c LIMIT 50];
    }

}