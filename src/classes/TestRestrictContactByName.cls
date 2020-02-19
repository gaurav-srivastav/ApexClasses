@isTest
private class TestRestrictContactByName {
    @isTest static void TestGoodContactInsertion() {
        Contact cntc = new Contact(LastName='Vasilij');      
        insert cntc;
    }
    @isTest static void TestBadContactInsertion() {
        Contact cntc = new Contact(LastName='INVALIDNAME');      
        insert cntc;
    }


}