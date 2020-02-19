public class PaymentColumnSort {

    public String DirectionOfSort = 'ASC';

    public String ExpressionOfSort ='name';
    public String PaymentList { get; set; }
    public List<Payment__c> paymentHistory {get;set;}
    
    public PaymentColumnSort(){
        paymentHistory = new List<Payment__c>();
    
    }
    
    public String ExpressionSort {
            get {
                return ExpressionOfSort;
            }
            set {
                If(value == ExpressionOfSort) {
                    DirectionOfSort = (DirectionOfSort == 'ASC')? 'DESC' : 'ASC';
                }
                else {
                    DirectionOfSort = 'ASC';
                    ExpressionOfSort = value;
                }
            }

        }
        
        
        
    public String getDirectionOfSort() {
       If(ExpressionOfSort == Null || ExpressionOfSort == '') {
                return 'DESC';
            }
            else {
                return DirectionOfSort;
            }
          }
          
    public void setDirectionOfSort(String value) {
            DirectionOfSort = value;
        }

     public List<Payment__c>getPayments() {
            return paymentHistory;
        }

    public PageReference viewData() {
        String FullSortExpression = ExpressionOfSort + ' ' + DirectionOfSort;
            system.debug('ExpressionOfSort:::::'+ExpressionOfSort);
            system.debug(DirectionOfSort);

            //String Queryitem = new String();
           String Queryitem = 'SELECT Id,Account__c,Name,Amount__c, Payment_Status__c, Transaction_Status__c, CreatedDate, Approved_Date__c FROM Payment__c WHERE Payment__c.Name != Null ORDER BY ' + FullSortExpression + ' Limit 1000';

            paymentHistory= DataBase.query(Queryitem);
            system.debug(paymentHistory);
            return Null;
    }

}