public class LeadRecords_D29HW {
    public static void getAllLeads(){
        Map<Id,Lead> leadMap=new Map<Id,Lead>();
        for(Lead ld:[SELECT Id, Name, Email, Phone, Rating FROM Lead]){
            leadMap.put(ld.Id,ld);
        }
        system.debug('Lead Record Details : '+leadMap);
    
     Map<Id,Lead> leadMap1=new Map<Id,Lead>([SELECT Id, Name, Email, Phone, Rating FROM Lead LIMIT 10]);                                   
        system.debug('LeadMap1 : '+leadMap1);
        for(Lead ld:LeadMap1.values()){                   
        system.debug('Lead Record : '+ld);
    }
}
}