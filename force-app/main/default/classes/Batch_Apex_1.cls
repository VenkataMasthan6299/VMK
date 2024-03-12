Global class Batch_Apex_1 implements Database.Batchable<SObject> {
    Global Database.QueryLocator Start(Database.BatchableContext bc){
        string accountQuery = 'SELECT Id, Name, Phone, Fax, Industry, Website FROM Account';
        return Database.getQueryLocator(accountQuery);
    }
    Global void Execute(Database.BatchableContext bc, List<Account> rec){
        if(!rec.isEmpty()){
            List<Account> accupdate = new List<Account>();
            for(SObject obj:accupdate){
                Account accrecord = (Account)obj;
                accrecord.Website='www.google.com';
                accrecord.Phone='345678743';
                accrecord.Fax='999999999999';
                accrecord.Industry='Insurence';
                accupdate.add(accrecord);
            }
            if(!accupdate.isEmpty()){
                update accupdate;
            }
        }
    }
    Global void Finish(Database.BatchableContext bc){
        system.debug('Batch job Id is...:'+bc.getJobID());
        AsyncApexJob jobDetails = [SELECT Id, Status, JobItemsProcessed, TotalJobItems, NumberOfErrors, CreatedBy.Email 
                                   FROM AsyncApexJob WHERE Id =: bc.getJobID()];
        //MessagingUtility.SendBatchJobStatusNotification(jobDetails,'Update Accounts Batch');
    }
}


/**public class MessagingUtility {
    public class void SendBatchJobStatusNotification(AsyncApexJob job, String jobName){
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        String[] toAddress = new String[] {job.CreatedBy.Email, 'ram@gmail.com'};
            email.SetToAddresses(toAddress);
        
        String emailSubject = 'Batch job : '+jobName+'-'+job.Id+'Execution Status Notification.';
        	email.SetSubject(emailSubject);
        
        email.SetReplyTo('ram@gmail.com');
        	email.SetSenderDisplayName('Weekly Batch Job Status Notification Alert.');
        
        String emailContent = 'Dear Customer. <br/><br/>'+
            					'Here is the Status Notification of the Batch Job:'+jobName+
            					'<br/><br/> Batch Job Id is...:'+job.Id+
            					'<br/> Batch Job Name is...:'+job.Name+
            					'<br/> Batch Job Status is...:'+job.Status+
            					'<br/> Total Number of Batches...:'+job.TotalJobItems+
            					'<br/> Number of Batches Processed...:'+job.JobItemsProcessed+
            					'<br/> Number of Failed Batches...:'+job.NumberOfErrors+
            					'<br/><br/> Thanks & Regards <br/> Dell Sales Support.';
        email.SetHTMLBody(emailContent);
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});
    } 
}*/