public class CaseSOQL {
    public static void GetAllCaseRecords(){
        Map<id,Case> mc=new Map<id,Case>([SELECT Id, Status, Type, Priority, Description, IsEscalated, ContactPhone, ContactEmail, ContactFax, 
                                          ContactId, AccountId, IsDeleted FROM Case]);
        System.debug('Collection Size...'+mc.size());
        if(!mc.isEmpty()){
            for(Case cs:mc.values()){
                System.debug('Case Record is...'+cs);
            }
        }
    }
}