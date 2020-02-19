public class PaymentHis {


    public String selectedAmount { get; set; }
    public String sortDirection {get;set;}
    public String soql {get;set;}
    public Integer InputAmount { get; set; }
    public String selectedTransaction { get; set; }
    public String selectedPayment { get; set; }
    public Date ToDate { get; set; }
    public Date FromDate { get; set; }
    public List<Payment__c> listOfPayment {get;set;}
    public List<Payment__c> PaymentHistoryList {get;set;}
    public Integer size {get;set;}
    public Integer noOfRecords { get; set; }
   
    public PaymentHis(){//Constructor of Class
        PaymentHistoryList = new List<Payment__c>();
      // PaymentHistoryList = rows.getRecords();

    }
    
    //return the current page number
     public Integer pageNumber {
        get {
            return rows.getPageNumber();
        }
        set;
    }

    
  
    public Boolean hasNext {
        get {
            return rows.getHasNext();
        }
        set;
    }


    public Boolean hasPrevious {
        get {
            return rows.getHasPrevious();
        }
        set;
    }


    public void previous() {
        rows.previous();
    }
    
    //indicate next page link
    public void next() {
        rows.next();
    }

//indicate & return first page of records 
    public void first() {
        rows.first();
    }
      
 //indicate & return last page of records      
        public void last() {
        rows.last();
    }




         public ApexPages.StandardSetController rows{
        get{
            if(rows == null){
            size=15;
                PaymentHistoryList = new List<Payment__c> ();
                string queryString = 'SELECT Id,Account__c,Name,Amount__c, Payment_Status__c, Transaction_Status__c, CreatedDate, Approved_Date__c FROM Payment__c';
                PaymentHistoryList = Database.query(queryString + ' order by ' + sortField + ' ' + sortColumn); 
                rows = new ApexPages.StandardSetController(PaymentHistoryList);                               
                rows.setPageSize(size);
                noOfRecords = rows.getResultSize();
            }
            return rows;
        }set;
    }
     
     Public List<Payment__c> getpayments(){
        List<Payment__c> PaymentHistoryList = new List<Payment__c>();
        for(Payment__c b : (List<Payment__c>)rows.getRecords())
            PaymentHistoryList.add(b);
        return PaymentHistoryList;
    }
     
    
    
        /*  public PageReference toggleSort() {
 if(sortDirection == 'asc')
        {
            sortDirection = 'desc';
        }
        else if(sortDirection == 'desc')
        {
            sortDirection = 'asc';
        }
        String query = 'SELECT Id,Account__c,Name,Amount__c, Payment_Status__c, Transaction_Status__c, CreatedDate, Approved_Date__c FROM Payment__c  order by Name' + sortDirection;
        listOfPayment = Database.query(query);
        
        return null;
    }*/
    
    
    //Sorting query using Ascending and Descending 
    public void toggleSort() {
    size=15;
        sortColumn = sortColumn.equals('asc') ? 'desc' : 'asc';
        PaymentHistoryList = new List<Payment__c> ();
         soql= 'SELECT Id,Account__c,Name,Amount__c, Payment_Status__c, Transaction_Status__c, CreatedDate, Approved_Date__c FROM Payment__c'; 
        PaymentHistoryList = Database.query(soql + ' order by ' + sortField + ' ' + sortColumn);     
                                
        rows = new ApexPages.StandardSetController(PaymentHistoryList );
        rows.setPageSize(size);

    }
    
    //default sorting in Asc
       public String sortColumn {    
        get  { if (sortColumn == null) 
        {  sortColumn = 'asc'; } 
        return sortColumn;}
        set;
    }
    
    //default sorting using Name
      public String sortField {      
      get  { if (sortField == null) 
      {sortField = 'Name'; } 
      return sortField;  }
      set;
    } 
    
    public PageReference export() {
    PaymentHistoryList = new List<Payment__c>();
    PageReference pgRef = New Pagereference('/apex'+'/PaymentExport');
        pgRef.setRedirect(false); 
        return pgRef;
       
    }

    
    

 
   
   //displayRecord block using to filter the records acc to inputfields 
    public void displayRecord() {
           PaymentHistoryList = new List<Payment__c>();
           String pSOQL;         
          if((FromDate != null) && ( ToDate!= null)){ 
           System.debug('In the if statement');      
               pSOQL = 'SELECT Id,Account__c,Name,Amount__c, Payment_Status__c, Transaction_Status__c, CreatedDate, Approved_Date__c FROM Payment__c where CreatedDate >= : FromDate and CreatedDate <=:  ToDate ORDER BY CreatedDate ';
               
           }             
           else if(selectedPayment != null && (selectedTransaction == 'None'|| selectedTransaction != null )){
          // System.debug('In the elseif statement1');  
               pSOQL = 'SELECT Id,Account__c,Name,Amount__c, Payment_Status__c, Transaction_Status__c, CreatedDate, Approved_Date__c FROM Payment__c where Payment_Status__c = : selectedPayment OR Transaction_Status__c =:selectedTransaction' ;
           }
           else if(((selectedTransaction != null || selectedTransaction !='None')||(selectedPayment == 'None'|| selectedPayment!= null))&& selectedAmount =='None' ){
          // || (selectedPayment == 'None' && selectedPayment != null)
           System.debug('In the elseif statement2'); 
               pSOQL = 'SELECT Id,Account__c,Name,Amount__c, Payment_Status__c, Transaction_Status__c, CreatedDate, Approved_Date__c FROM Payment__c where Transaction_Status__c = : selectedTransaction';
                
           }
           else if((InputAmount != null && selectedAmount =='Greater') &&(selectedTransaction == 'None'|| selectedTransaction != null ) ){
            System.debug('In the elseif statement3');       
           pSOQL = 'SELECT Id,Account__c,Name,Amount__c, Payment_Status__c, Transaction_Status__c, CreatedDate, Approved_Date__c FROM Payment__c where Amount__c > : InputAmount ';
                                
           }  
               else if((InputAmount != null && selectedAmount =='Less') &&(selectedTransaction == 'None'|| selectedTransaction != null ) ){
            System.debug('In the elseif statement3');       
           pSOQL = 'SELECT Id,Account__c,Name,Amount__c, Payment_Status__c, Transaction_Status__c, CreatedDate, Approved_Date__c FROM Payment__c where Amount__c < : InputAmount ';
                                
           }     
           else if((InputAmount != null && selectedAmount =='Equal') &&(selectedTransaction == 'None'|| selectedTransaction != null ) ){
            System.debug('In the elseif statement3');       
           pSOQL = 'SELECT Id,Account__c,Name,Amount__c, Payment_Status__c, Transaction_Status__c, CreatedDate, Approved_Date__c FROM Payment__c where Amount__c = : InputAmount ';
                                
           }   
         
          
     PaymentHistoryList = Database.query(pSOQL);
   
    }
     public PageReference reset() {
         PageReference newpage = new PageReference(System.currentPageReference().getURL());
          newpage.getParameters().clear();
    newpage.setRedirect(true);
    return newpage;

    }
    }
//Code to check COnditions in Else block//
 /* else {
            if(selectedPayment != null ||selectedTransaction == 'None' ){
            System.debug('In the elseif statement1');
            pSOQL = 'SELECT Id,Account__c,Amount__c, Payment_Status__c, Transaction_Status__c, CreatedDate, Approved_Date__c FROM Payment__c where Payment_Status__c =: selectedPayment';
            }
           
            else if(selectedTransaction != null || selectedPayment == 'None' ){
                System.debug('In the elseif statement2');
                pSOQL = 'SELECT Id,Account__c,Amount__c, Payment_Status__c, Transaction_Status__c, CreatedDate, Approved_Date__c FROM Payment__c where Transaction_Status__c =: selectedTransaction';
            }
            else if((InputAmount != null || selectedPayment == 'None') && (selectedAmount !=null || selectedAmount =='Greater')){
                System.debug('In the elseif statement3');      
                pSOQL = 'SELECT Id,Account__c,Amount__c, Payment_Status__c, Transaction_Status__c, CreatedDate, Approved_Date__c FROM Payment__c where Amount__c > : InputAmount ';
            }    
        }*/
        
        
        ////code to retrieve data using checks
         /*if((FromDate != null) && ( ToDate!= null)){ 
           System.debug('In the if statement');      
               pSOQL = 'SELECT Id,Account__c,Name,Amount__c, Payment_Status__c, Transaction_Status__c, CreatedDate, Approved_Date__c FROM Payment__c where CreatedDate >= : FromDate and CreatedDate <=:  ToDate ORDER BY CreatedDate ';
               
           }
             
           
           else if(selectedPayment != null && (selectedTransaction == 'None'|| selectedTransaction != null )){
          // System.debug('In the elseif statement1');  
               pSOQL = 'SELECT Id,Account__c,Name,Amount__c, Payment_Status__c, Transaction_Status__c, CreatedDate, Approved_Date__c FROM Payment__c where Payment_Status__c = : selectedPayment OR Transaction_Status__c =:selectedTransaction' ;
           }
           else if(((selectedTransaction != null || selectedTransaction !='None')||(selectedPayment == 'None'|| selectedPayment!= null))&& selectedAmount =='None' ){
          // || (selectedPayment == 'None' && selectedPayment != null)
           System.debug('In the elseif statement2'); 
               pSOQL = 'SELECT Id,Account__c,Name,Amount__c, Payment_Status__c, Transaction_Status__c, CreatedDate, Approved_Date__c FROM Payment__c where Transaction_Status__c = : selectedTransaction';
                
           }
           else if((InputAmount != null && selectedAmount =='Greater') &&(selectedTransaction == 'None'|| selectedTransaction != null ) ){
            System.debug('In the elseif statement3');       
           pSOQL = 'SELECT Id,Account__c,Name,Amount__c, Payment_Status__c, Transaction_Status__c, CreatedDate, Approved_Date__c FROM Payment__c where Amount__c > : InputAmount ';
                                
           }  
               else if((InputAmount != null && selectedAmount =='Less') &&(selectedTransaction == 'None'|| selectedTransaction != null ) ){
            System.debug('In the elseif statement3');       
           pSOQL = 'SELECT Id,Account__c,Name,Amount__c, Payment_Status__c, Transaction_Status__c, CreatedDate, Approved_Date__c FROM Payment__c where Amount__c < : InputAmount ';
                                
           }     
           else if((InputAmount != null && selectedAmount =='Equal') &&(selectedTransaction == 'None'|| selectedTransaction != null ) ){
            System.debug('In the elseif statement3');       
           pSOQL = 'SELECT Id,Account__c,Name,Amount__c, Payment_Status__c, Transaction_Status__c, CreatedDate, Approved_Date__c FROM Payment__c where Amount__c = : InputAmount ';
                                
           }    
           
           //  con = new ApexPages.StandardSetController(PaymentHistoryList );


                                // Set Page Size to 5
                              //  con.setPageSize(15);

             */