public class MassEmailTemplate {
    public static void SendEmailNotificationContact(){
        Map<id,Contact> mapContact=new Map<id,Contact>([SELECT Id, LastName, FirstName, AccountId, Email FROM Contact WHERE AccountId=null and Email!=null Limit 10]);
        List<Id> contactIds=new List<Id>();
        if(!mapContact.isEmpty()){
            contactIds.AddAll(mapContact.keySet());
        }
        if(!contactIds.isEmpty()){
            Messaging.MassEmailMessage massEmail=new Messaging.MassEmailMessage();
            EmailTemplate template=[SELECT Id, Name, IsActive FROM EmailTemplate WHERE name='Update Account Detail Notification Templates'];
            if(template.Id!=null && template.IsActive==true){
                massEmail.setTargetObjectIds(contactIds);
                massEmail.setTemplateID(template.Id);
                Messaging.SendEmail(new Messaging.MassEmailMessage[]{massEmail});
            }
        }
    }
}