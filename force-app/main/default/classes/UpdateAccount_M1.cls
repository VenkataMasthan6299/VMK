Global class UpdateAccount_M1 implements Database.Batchable<sObject> {
    Global Database.QueryLocator start(Database.BatchableContext bc){
        String query='SELECT Id, Name, Industry, Rating, Active__c FROM Account';
        return Database.getQueryLocator(query);
    }
    Global void Execute(Database.BatchableContext bc, List<sObject> reclist) {
        if(!reclist.isEmpty()){
            List<Account> accList=new List<Account>();
            for(sObject sobj:reclist){
                Account acc=(Account) sobj;
                acc.Industry='Banking';
                acc.Rating='Hot';
                acc.Active__c='Yes';
                accList.add(acc);
            }
            if(!accList.isEmpty()){
                Database.Update(accList);
            }
        }
    }
    Global void Finish(Database.BatchableContext bc) {
       AsyncApexJob jobDetail= [SELECT Id, JobType, CreatedDate, Status, JobItemsProcessed, TotalJobItems,
                                NumberOfErrors, CreatedById, ApexClassId FROM AsyncApexJob WHERE id=:bc.getJobId()];
        System.debug('Job Details---'+jobDetail);
    }
}