public class PositionRecord_Location_D29HW {
    public static void getPositions(string posLocation){
        for(Position__c pos: [SELECT Id, Name, Location__c FROM Position__c WHERE Location__c=:posLocation]){
            system.debug('Position Record :'+pos.Id);
        }
        List<string> locations=new List<string>{'Hyderabad','Banglore','Chennai'};
         getLocations(locations);   
    }
    public static void getLocations(List<string> locations){
        for(Position__c pos: [SELECT Id, Name, Location__c FROM Position__c WHERE Location__c IN: locations]){
            system.debug('Location Record :'+pos);
        }
    }
}