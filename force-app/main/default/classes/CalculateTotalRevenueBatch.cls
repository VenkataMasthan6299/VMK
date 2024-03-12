Global class CalculateTotalRevenueBatch implements Database.Batchable<SObject>, Database.Stateful{
Global decimal totalAnnualRevenue=0.0;
    Global Database.QueryLocator start(Database.BatchableContext bc){
      String Query='SELECT Id, Name, AnnualRevenue FROM Account WHERE AnnualRevenue!=null';
        return Database.getQueryLocator(Query);
    }
    Global void Execute(Database.BatchableContext bc, List<SObject> rec){
        if(!rec.isEmpty()){
            for(SObject obj:rec){
                Account acc=(Account) obj;
                totalAnnualRevenue+=acc.AnnualRevenue;
            }
        }
    }
    Global void Finish(Database.BatchableContext bc){
        AsyncApexJob jobDetails=[SELECT Id, JobType, ApexClassId, Status, JobItemsProcessed, TotalJobItems, NumberOfErrors, CompletedDate
            FROM AsyncApexJob WHERE id=:bc.getjobId()];
        System.debug('Job Details-->'+jobDetails);
    }
}