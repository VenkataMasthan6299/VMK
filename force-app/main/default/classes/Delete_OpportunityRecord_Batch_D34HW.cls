Global class Delete_OpportunityRecord_Batch_D34HW implements Database.Batchable<sObject> {
    Global Database.QueryLocator start(Database.BatchableContext bContext){
        string query='SELECT Id, Name, StageName, Type, LeadSource FROM Opportunity';
        return Database.getQueryLocator(query);
    }
    Global void Execute(Database.BatchableContext bContext, List<sObject> recList){
        if(!recList.isEmpty()){
            List<Opportunity> oppList=new List<Opportunity>();
            for(sObject sobj:recList){
                Opportunity oppRecord=(Opportunity)sobj;
                oppRecord.StageName='NeedAnalysis';
                oppRecord.Name='Arjun';
                oppRecord.Type='NewCustomer';
                oppRecord.LeadSource='Web';
                oppList.add(oppRecord);
            }
            if(!oppList.isEmpty()){
                Database.delete(oppList, false);
            }
        }
    }
    Global void Finish(Database.BatchableContext bContext){
       AsyncApexJob jobDetails=[SELECT Id, JobType, Status, JobItemsProcessed, TotalJobItems, ApexClassId, NumberOfErrors
                                FROM AsyncApexJob where id=:bContext.getJobId()];
        system.debug('jobDetails :'+jobDetails);
    }
}