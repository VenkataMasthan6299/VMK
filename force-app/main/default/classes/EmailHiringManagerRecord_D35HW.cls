public class EmailHiringManagerRecord_D35HW {
      //create 3 Hiring_Manager__c Record
    public static void HiringManager(){
        List<Hiring_Manager__c> hrList=new List<Hiring_Manager__c>();
        for(integer i=1; i<4; i++){
            Hiring_Manager__c hr=new Hiring_Manager__c();
            hr.Name='Sanju-'+i;            
            hr.Designation__c='HR Manager';
            hr.Email_Address__c='kolangarivenkat6@gmail.com';
            hr.Location_Name__c='Hyderabad';
            hrList.add(hr);
        } 
        if(!hrList.isempty()){
            Database.insert(hrList, false);
            sendEmailNotification(hrList);
        }
    }
    //Send Email Notification (ToAddress, Subject, Description, Attachment)
    public static void sendEmailNotification(List<Hiring_Manager__c> hmList){
        if(!hmList.isEmpty()){
            List<Messaging.SingleEmailMessage> EmailList=new List<Messaging.SingleEmailMessage>();
            for(Hiring_Manager__c hrRecord:hmList){
                //Prepare Email Notification
                Messaging.SingleEmailMessage email=new Messaging.SingleEmailMessage();                
                //toAddress List<String> / String[]
                String[] toAddress=new String[]{hrRecord.Email_Address__c};
                email.setToAddresses(toAddress);
                //Replay to Name
                email.setReplyTo('support@salesforce123.com');
                //Display Name
                email.setSenderDisplayName('Support Team');
                //Subject
                String emailsubject='Thank you for Interest '+hrRecord.Name;
                email.setSubject(emailsubject);
                //Content
                string emailContent='Dear '+hrRecord.Name+', <br/><br/>'+
                    'Thank you for your Interest! <br/><br/>'+
                    'We are looking for your data. My team will contact you soon! <br/><br/>'+
                    'Your Information : <br/><br/> '+
                    'Hiring Manager Person Name : '+hrRecord.Name+
                    '<br/> Hiring Manager Email : '+hrRecord.Email_Address__c+
                    '<br/> Location : '+hrRecord.Location_Name__c+
                    
                    '<br/><br/> Please go through the Attached Information '+
                    '<br/><br/> This is system generated Email.'+
                    'Thank you , <br/>'+
                    'Salesforce, <br/>'+
                    'CEO.';
                email.setHtmlBody(emailContent);
                //Prepare Attachment
                Messaging.EmailFileAttachment attach=new Messaging.EmailFileAttachment();
                attach.setFileName(hrRecord.Name+'.pdf');
                attach.setContentType('Application/pdf');
                attach.body=Blob.toPdf(emailContent);
                List<Messaging.EmailFileAttachment> attachList=new List<Messaging.EmailFileAttachment>();
                attachList.add(attach);
                email.setFileAttachments(attachList);
                EmailList.add(email);
            }
            if(!EmailList.isempty()){
                Messaging.SendEmailResult[] result=Messaging.SendEmail(EmailList);
            }
        }
    }
}