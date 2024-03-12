Global class BatchClass_Update_Candidate_Record_D34HW implements Database.Batchable<sObject>{
    Global Database.QueryLocator start(Database.BatchableContext bContext){
        string query='SELECT Id, Name, Qualification__c FROM Candidate__c';
        return Database.getQueryLocator(query);
    }
    Global void Execute(Database.BatchableContext bContext, List<sObject> recList){
        if(!recList.isEmpty()){
            List<Candidate__c> canList=new List<Candidate__c>();
            for(sObject sobj:recList){
                Candidate__c canRecord=(Candidate__c)sobj;
                canRecord.Qualification__c='B.Tech';
                canRecord.Name='Arjun';
                canList.add(canRecord);
            }
            if(!canList.isEmpty()){
                Database.update(canList, false);
            }
        }
    }
    Global void Finish(Database.BatchableContext bContext){
       AsyncApexJob jobDetails=[SELECT Id, JobType, Status, JobItemsProcessed, TotalJobItems, ApexClassId, NumberOfErrors
                                FROM AsyncApexJob where id=:bContext.getJobId()];
        system.debug('jobDetails ;'+jobDetails);
    }
}