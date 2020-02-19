public with sharing class MetaData {

    
    List<Country_Codes__mdt> MetaD {get;set;}
    List<SalesDiscount__c> SettingD {get;set;}
    public MetaData (){
    }
    
    public List<Country_Codes__mdt> getDisplayMeta() {
        Map<Id,Country_Codes__mdt> AllData = new Map<Id,Country_Codes__mdt>([Select Id,Phone_Code__c,MasterLabel from Country_Codes__mdt]);
        MetaD = AllData.values();
        return MetaD;
    }
    
    public List<SalesDiscount__c> getGetSettingD(){
        Map<Id,SalesDiscount__c> SetD = new Map<Id,SalesDiscount__c>([Select Id, Discount__c from SalesDiscount__c]);
        SettingD = SetD.values();
        return SettingD ;
    
    }
    
    
}