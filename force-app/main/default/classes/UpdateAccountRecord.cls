Global class UpdateAccountRecord implements Database.Batchable<SObject> {
    Global Database.QueryLocator start(Database.BatchableContext bc){
        String query='SELECT Id, Phone, Fax, Industry, Rating FROM Account';
        return Database.getQueryLocator(query);
    }
    Global void Execute(Database.BatchableContext bc, List<SObject> recList){
        if(!recList.isEmpty()){
            List<Account> acc=new List<Account>();
            for(SObject sobj:recList){
                Account accList=(Account)sobj;
                accList.Phone='76576478';
                accList.Fax='878799';
                accList.Industry='Banking';
                accList.Rating='Hot';
                acc.add(accList);
            }
            if(!acc.isEmpty()){
                Database.update(acc,false);
            }
        }
    }
    Global void Finish(Database.BatchableContext bc){
        AsyncApexJob jobDetails=[SELECT Id, JobType, ApexClassId, Status, JobItemsProcessed, TotalJobItems, NumberOfErrors, CompletedDate
            FROM AsyncApexJob WHERE id=:bc.getjobId()];
        System.debug('Job Details-->'+jobDetails);
    }
}