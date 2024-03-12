Global class Update_Delivery_Installation_D38HW implements Database.Batchable<sObject>, Schedulable{
     Global Database.QueryLocator start(Database.BatchableContext bc){
        string query='SELECT Id, DeliveryInstallationStatus__c FROM Opportunity Where DeliveryInstallationStatus__c=In progress';
        return Database.getQueryLocator(query);
    }
    Global void Execute(Database.BatchableContext bc, List<sObject> rec){
        List<Opportunity> oppList=(List<Opportunity>)rec;
        if(oppList.size()>0){
            for(Opportunity opp:oppList){
                opp.DeliveryInstallationStatus__c='In progress';
            }
            Database.update(oppList,false);
        }
    }
    Global void Finish(Database.BatchableContext bc){}
    Global void Execute(schedulableContext sc){
        string cronExp='0 0 1 28 * ?'; //1AM 28th of Month
        system.schedule('Schedulable 1AM Job', cronExp, new Update_Delivery_Installation_D38HW());
    }
}