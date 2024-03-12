public class ETSOQL {
    public static void GetAllETRecords(){
        List<EmailTemplate> ET=[SELECT Id, Name, DeveloperName, IsActive, Subject, CreatedDate, CreatedById, 
                                LastModifiedDate FROM EmailTemplate];
        System.debug('Collection Size...'+ET);
        if(!ET.isEmpty()){
            for(EmailTemplate Emt:ET){
                System.debug('ET Id...'+Emt.Id);
                System.debug('ET Name...'+Emt.Name);
                System.debug('ET DeveloperName...'+Emt.DeveloperName);
                System.debug('ET IsActive...'+Emt.IsActive);
                System.debug('ET Subject...'+Emt.Subject);
                System.debug('ET CreatedDate...'+Emt.CreatedDate);
                System.debug('ET CreatedById...'+Emt.CreatedById);
                System.debug('ET LastModifiedDate...'+Emt.LastModifiedDate);
            }
        }
    }
}