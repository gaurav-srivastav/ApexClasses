public class DisCal {
	
    public static void PriceCal(Movie__c[] MApp){
        double basePrice = 200.0;
        for(Movie__c C: MApp){
        if(C.Number_of_Ticket__c > 5){
            C.Movie_Price__c = (C.Number_of_Ticket__c*(basePrice-(0.01*(basePrice))));
            
        }else{
            C.Movie_Price__c = (C.Number_of_Ticket__c * basePrice);
        }
    }
    }
}