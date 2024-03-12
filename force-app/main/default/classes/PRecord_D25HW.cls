public class PRecord_D25HW {
    public static void PositionRecord()
    {
        Position__c  pos=new Position__c ();
        pos.Name='Antony';
        pos.Position_Status__c='InProgress';
        pos.Position_Designation__c='HR Manager';
        pos.Text_One__c='Position Record';
        insert pos;
    }

}