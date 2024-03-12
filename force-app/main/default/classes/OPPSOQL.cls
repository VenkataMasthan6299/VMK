public class OPPSOQL {
    public static void GetAllOppRecords(){
        Map<Id,Opportunity> oppMap=new Map<Id,Opportunity>([SELECT Id, Name, LeadSource, Type, StageName, AccountId, 
                                                            ContactId, Description, IsDeleted FROM Opportunity]);
        System.debug('Collection Size...'+oppMap.size());
        if(!oppMap.isEmpty()){
            for(Opportunity opp:oppMap.values()){
                System.debug('Opportunity Record...'+opp);
            }
        }
    }
}