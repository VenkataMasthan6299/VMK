public class Position_Record_D29HW {
     public static void getPositions(){
        List<Position__c> posList=[SELECT Id, Name, IsDeleted FROM Position__c All Rows];
        system.debug('Position Records :'+posList);
    }
}