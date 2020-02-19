public class StringQueryFormat {
public String selectedAmount { get; set; }

    public Integer InputAmount { get; set; }
    public String selectedTransaction { get; set; }
    public String selectedPayment { get; set; }
    public Date ToDate { get; set; }
    public Date FromDate { get; set; }
    public List<Payment__c> listOfPayment {get;set;}
    public List<Payment__c> PaymentHistoryList {get;set;}
    
    public StringQueryFormat (){
        listOfPayment = new List<Payment__c>();
    }
    
    public void displayRecord() {
   
           PaymentHistoryList = new List<Payment__c>();
            String pSOQL='Select Id, Account__c, Name, Amount__c, Payment_Status_c, Transaction_Status__c, CreatedDate, Approved_Date__c from Payment__c';
           try{
           
            
               if((FromDate != null) && ( ToDate!= null)){             
               pSOQL += 'Where CreatedDate >= \'' +FromDate+ '\' and ' + 'CreatedDate <= \'' +ToDate + '\'';                 
          }else if(selectedPayment != null&& (selectedTransaction == 'None'|| selectedTransaction != null )){
              System.debug('In the elseif statement1');  
             // pSOQL += 'where Payment_Status__c =\''+selectedPayment+ '\'';
             pSOQL += 'WHERE Payment_Status__c =\''+selectedPayment+'\' OR Transaction_Status__c = \''+ selectedTransaction +'\'';
                
                 
          }
          }catch(DmlException e){
              System.debug('The following exception has occurred: ' + e.getMessage());
          }
          PaymentHistoryList = Database.query(pSOQL);
         
           //'Select Id, Account__c, Name, Amount__c, Payment_Status_c, Transaction_Status__c, CreatedDate, Approved_Date__c from Payment__c'; 
            
               /*if((FromDate != null) && ( ToDate!= null)){             
               pSOQL += 'Where CreatedDate >= \'' +FromDate+ '\' and ' + 'CreatedDate <= \'' +ToDate + '\'';
                 
          }else if(selectedPayment != null && (selectedTransaction == 'None' || selectedTransaction != null )){
              pSOQL += 'WHERE Payment_Status__c =\'' +selectedPayment+ '\'';
      
          }*/
        
    
    
   
    }
     public PageReference reset() {
         PageReference newpage = new PageReference(System.currentPageReference().getURL());
          newpage.getParameters().clear();
    newpage.setRedirect(true);
    return newpage;

    }
    }
   /*  if((FromDate != null) && ( ToDate!= null)){ 
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
                                
           }*/