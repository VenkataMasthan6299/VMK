public class CandidateHandler {
    Public static void SendEmailToCandidates(List<Candidate__c> cList){
        if(!cList.isEmpty()){
            List<Messaging.SingleEmailMessage> SEM=new List<Messaging.SingleEmailMessage>();
            for(Candidate__c cnd:cList){
                Messaging.SingleEmailMessage email=new Messaging.SingleEmailMessage();
                String[] EmailID=new String[]{cnd.Email__c,'kolangarivenkat6@gmail.com'};
                    email.setToAddresses(EmailID);
                email.setReplyTo('Candidate Record Notification Alert');
                email.setSenderDisplayName('Support Team');
                String EmailSubject='Congratulations'+cnd.Name+'..!!Your Application has been Submitted for this Position';
                email.setSubject(EmailSubject);
                String EmailContent='Dear'+cnd.Name+',<br/><br/>'+
                    'Thanks for Showing interest in our Organisation positions.<br/><br/>'+
                    'We are Pleased to inform you, that your application has been successfully submitted.'+cnd.Position__c+
                    '<br/><br/>Here are Your Details...<br/><br/>'+
                    '<br/>Location...'+cnd.Location__c+
                    '<br/>Email...'+cnd.Email__c+
                    '<br/>CurrentCTC...'+cnd.Current_CTC__c+
                    '<br/>Phone Number...'+cnd.Phone_Number__c+
                    '<br/>Position...'+cnd.Position__c+
                    '<br/>Qualification...'+cnd.Qualification__c+
                    '<br/><br/>Please contact below Address if any Queries or Changes<br/><br/>'+
                    'Thanks,<br/>'+
                    'RMG Team,<br/>'+
                    'Dell Inc,<br/>'+
                    'Hyderabad.';
                email.setHTMLBody(EmailContent);
                SEM.add(email);
            }
            if(!SEM.isEmpty()){
                Messaging.SendEmail(SEM);
            }
        }
    }
}