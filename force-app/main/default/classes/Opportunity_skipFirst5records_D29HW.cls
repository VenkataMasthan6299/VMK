public class Opportunity_skipFirst5records_D29HW {
       public static void getOpportunity(){
        List<Opportunity> oppList=[SELECT Id, Name, Type FROM Opportunity OFFSET 5];
        system.debug('Opportunity Skip First 5 Records :'+oppList);
    }
}