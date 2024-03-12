public class PositionRecord_D25HW {
    public static void PRecord(string pname, string pstatus, string pdesignation, string ptext)                    
    {
        Position__c pos=new Position__c();
            pos.Name=pname;
            pos.Position_Status__c=pstatus;
            pos.Position_Designation__c=pdesignation;
            pos.Text_One__c=ptext;
            insert pos;
    }

}