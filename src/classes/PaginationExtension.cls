public with sharing class PaginationExtension {
    Public Integer noOfRecords{get; set;}
    Public Integer size{get;set;}
    public ApexPages.StandardSetController setCon {
        get{
            if(setCon == null){
                size = 10;
                string queryString = 'Select Name, Phone from Contact order by Name';
                setCon = new ApexPages.StandardSetController(Database.getQueryLocator(queryString));
                setCon.setPageSize(size);
                noOfRecords = setCon.getResultSize();
            }
            return setCon;
        }set;
    }
    
    Public List<Contact> getContacts(){
        List<Contact> conList = new List<Contact>();
        for(Contact a : (List<Contact>)setCon.getRecords())
            conList.add(a);
        return conList;
    }
    
    public pageReference refresh() {
        setCon = null;
        getContacts();
        setCon.setPageNumber(1);
        return null;
    }
}