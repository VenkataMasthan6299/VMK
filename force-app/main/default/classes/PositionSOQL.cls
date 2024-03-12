public class PositionSOQL {
    public static void GetAllPositionRecords(){
        Map<id,position__c> mpos=new Map<id,position__c>([SELECT Id, Name, Location__c, Text_One__c, Position_Status__c, 
                                                          Position_Designation__c, Phone_Number__c, IsDeleted FROM Position__c]);
        System.debug('Collection size...:'+mpos);
        if(!mpos.isEmpty()){
            for(position__c pos:mpos.values()){
                System.debug('Position Record is...'+pos);
            }
        }
    }
}