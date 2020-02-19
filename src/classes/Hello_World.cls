public class Hello_World {
    public static void insertPos(){
        Position__c POS = new Position__C(Position_name__c = 'Software Developer',Minimum_pay__c=200);
		insert POS;
    }

}