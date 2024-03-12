Global class Update_LeadSource_SB_D38HW implements Database.Batchable<sObject>, Schedulable{
      Global Database.QueryLocator start(Database.BatchableContext bc){
        string query='SELECT Id, LeadSource FROM Lead Where LeadSource=Null';
        return Database.getQueryLocator(query);
    }
    Global void Execute(Database.BatchableContext bc, List<sObject> rec){
        List<Lead> ldList=(List<Lead>)rec;
        if(ldList.size()>0){
            for(Lead ld:ldList){
                ld.LeadSource='Dream Force';
            }
            Database.update(ldList,false);
        }
    }
    Global void Finish(Database.BatchableContext bc){}
    Global void Execute(schedulableContext sc){
        Update_LeadSource_SB_D38HW lsb=new Update_LeadSource_SB_D38HW();
        Database.executeBatch(lsb);
    }
}