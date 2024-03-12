Global class Update_Schedule_Batchclass_D38HW implements Database.Batchable<sObject>, Schedulable {
    Global Database.QueryLocator start(Database.BatchableContext bc){
        string query='SELECT Id, Stage FROM Opportunity Where Stage=Value Proposition';
        return Database.getQueryLocator(query);
    }
    Global void Execute(Database.BatchableContext bc, List<sObject> rec){
        List<Opportunity> oppList=(List<Opportunity>)rec;
        if(oppList.size()>0){
            for(Opportunity opp:oppList){
                opp.StageName='Prospecting';
            }
            Database.update(oppList,false);
        }
    }
    Global void Finish(Database.BatchableContext bc){}
    Global void Execute(schedulableContext sc){
        Update_Schedule_Batchclass_D38HW sb=new Update_Schedule_Batchclass_D38HW();
        Database.executeBatch(sb);
    }
}