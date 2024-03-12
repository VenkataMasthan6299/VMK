public class EmailMessageHelper1 {
    public static void CreateLeads(){
        List<Lead> leadList=new List<Lead>();
        for(integer c=1; c<4; c++){
            Lead ld=new Lead();
            ld.FirstName='Jaya-'+c;
            ld.LastName='Krishna-'+c;
            ld.Email='kolangarivenkat6@gmail.com';
            ld.Company='HCL';
            ld.Rating='Hot';
            ld.Industry='Technology';
            ld.AnnualRevenue=9000000;
            leadList.add(ld);
        }
        if(!leadList.isEmpty()){
            Database.insert(leadList,false);
            SendNotification(leadList);
        } 
    }
    public static void SendNotification(List<Lead> ldList){
        if(!ldList.isEmpty()){
            List<Messaging.SingleEmailMessage> emailList=new List<Messaging.SingleEmailMessage>();
            for(Lead ldRecord:ldList){
                Messaging.SingleEmailMessage email=new Messaging.SingleEmailMessage();
                String[] toAddress=new String[]{ldRecord.Email};
                    email.setToAddresses(toAddress);
                email.setReplyTo('Support@Maruthi123.com');
                email.setSenderDisplayName('Support Team');
                String emailSubject='Thank you for Interest'+ldRecord.FirstName;
                email.setSubject(emailSubject);
                String emailContent='Dear '+ldRecord.FirstName+ +ldRecord.LastName+',<br/><br/>'+
                    'We are Working on your data. My team will contact you soon!<br/><br/>'+
                    'Your Information :<br/><br/>'+
                    'Lead Person Name :'+ldRecord.FirstName+ +ldRecord.LastName+
                    '<br/>Lead AnnualRevenue :'+ldRecord.AnnualRevenue+
                    '<br/>Lead Email :'+ldRecord.Email+
                    '<br/><br/>Please go through the attached vehicle information'+
                    '<br/><br/>This is System Generated Email.'+
                    'Thank you,<br/>'+
                    'Maruthi,<br/>'+
                    'CEO.';
                email.setHTMLBody(emailContent);
                Messaging.EmailFileAttachment attach=new Messaging.EmailFileAttachment();
                attach.setFileName(ldRecord.FirstName+'_'+ldRecord.LastName+'.pdf');
                attach.setContenttype('Application/pdf');
                attach.body=Blob.topdf(emailContent);
                List<Messaging.EmailFileAttachment> attachList=new List<Messaging.EmailFileAttachment>();
                attachList.add(attach);
                email.setFileAttachments(attachList);
                emailList.add(email);
            }
            if(!emailList.isEmpty()){
                Messaging.SendEmailResult[] result=Messaging.SendEmail(emailList);
            }
        }
    }
}