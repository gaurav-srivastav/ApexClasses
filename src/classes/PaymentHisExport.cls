public class PaymentHisExport {

    public String getPaymentList() {
        return null;
    }

  public List<Payment__c> PaymentHistoryList {get;set;} 
    public String getSelectedFieldsList() {
        return null;
    }


    public String getConList() {
        return null;
    }


    public PaymentHisExport() {

    }


    public PaymentHisExport(PaymentHis controller) {

    }
    public PageReference export() {
    PaymentHistoryList = new List<Payment__c>();
    PageReference pgRef = New Pagereference('/apex'+'/PaymentExport');
        pgRef.setRedirect(false); 
        return pgRef;
       
    }

}