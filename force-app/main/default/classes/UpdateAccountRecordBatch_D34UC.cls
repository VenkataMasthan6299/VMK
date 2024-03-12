Global class UpdateAccountRecordBatch_D34UC implements Database.Batchable<sObject> {
    Global Database.QueryLocator start(Database.BatchableContext bContext){
        string query='SELECT Id, Name, Rating, Industry, AnnualRevenue, Active__c FROM Account';
        return Database.getQueryLocator(query);
    }
    Global void Execute(Database.BatchableContext bContext, List<sObject> recList){
        if(!recList.isempty()){
            List<Account> accList=new List<Account>();
            for(sObject sobj:recList){
              Account accRecord=(Account)sobj; 
                accRecord.Rating='Warm';
                accRecord.Industry='Finance';
                accRecord.Active__c='No';
                accRecord.Website='http://www.salesforce.com';
                accRecord.Email__c='kolangarivenkat3@gmail.com';
                accList.add(accRecord);
            }
            if(!accList.isempty()){
                Database.update(accList, false);
            }
        }
    }
    Global void Finish(Database.BatchableContext bContext){
        AsyncApexJob jobDetails=[SELECT Id, JobType, ApexClassId, Status, JobItemsProcessed, TotalJobItems, NumberOfErrors, CompletedDate 
                                FROM AsyncApexJob Where id=:bContext.getJobId()];
             system.debug('jobDetails :'+ jobDetails);
        
     /*   List<Messaging.SingleEmailMessage> emailList=new List<Messaging.SingleEmailMessage>();
        Messaging.SingleEmailMessage email=new Messaging.SingleEmailMessage();
        List<string> toAddress=new List<string>{'kolangarivenkat3@gmail.com',jobDetails.CreatedBy.Email};
        email.setToAddresses(toAddress);
        email.setSenderDisplayName('Batch Job');
        email.setSubject('Weekly Batch job Support');
        string emailContent='Dear , <br/><br/>'+
                    'Thank you for your Interest! <br/><br/>'+
                    'We are looking for your data. My team will contact you soon! <br/><br/>'+
                    'Your Information : <br/><br/> '+
                    'Job Record Id : '+jobDetails.Id+
                    '<br/> Total Number of Batches Available : '+jobDetails.TotalJobItems+
                    '<br/> Error Records : '+jobDetails.NumberOfErrors+                    
                    '<br/><br/> Please go through the Attached Information '+
                    '<br/><br/> This is system generated Email.'+
                    'Thank you , <br/>'+
                    'Salesforce, <br/>'+
                    'CEO.';
       email.setHtmlBody(emailContent);
       emailList.add(email);
        if(!emailList.isEmpty()){
          Messaging.SendEmailResult[] result=Messaging.sendEmail(emailList);  
        }*/
    }
}