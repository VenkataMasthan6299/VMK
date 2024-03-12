Global class EmailDelete_OppRecord_D35HW implements Database.Batchable<sObject> {
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
                Database.undelete(oppList, true);
            }
        }
    }
    Global void Finish(Database.BatchableContext bContext){
       AsyncApexJob jobDetails=[SELECT Id, JobType, Status, JobItemsProcessed, TotalJobItems, ApexClassId, NumberOfErrors,
                               CreatedBy.Email FROM AsyncApexJob where id=:bContext.getJobId()];
        system.debug('jobDetails :'+jobDetails);
        
        List<Messaging.SingleEmailMessage> emailList=new List<Messaging.SingleEmailMessage>();
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
        }
    }
}