@isTest
public class TestDisCalCalculation {
    public static testMethod void validateDiscount(){
        Movie__c MApp1 = new Movie__c(name='Thor');
        System.debug('Befor insert' +MApp1.Movie_Price__c);
        insert MApp1;
        
        Movie__c result=[select id,name,Movie_Price__c,Number_of_Ticket__c from Movie__c Where id=:MApp1.Id];
        System.debug('After Insert' +result.Movie_Price__c);
        System.assertEquals(1000, result.Movie_Price__c);
    }
}