public class LeadHandlerClass {
    public static void AfterUpdate(List<Lead> LeadList){
        LeadStatus lStatus=[SELECT Id, MasterLabel, IsConverted FROM LeadStatus WHERE IsConverted=true Limit 1];
        List<Database.LeadConvert> LeadConvert=new List<Database.LeadConvert>();
        for(Lead ld:LeadList){
            if(ld.Status=='Closed-Converted' && ld.IsConverted==false){
                Database.LeadConvert lConvert=new Database.LeadConvert();
                lConvert.SetLeadId(ld.id);
                lConvert.SetSendNotificationEmail(true);
                lConvert.SetDoNotCreateOpportunity(false);
                lConvert.SetConvertedStatus(lStatus.MasterLabel);
                LeadConvert.add(lConvert);
            }
        }
        if(!LeadConvert.isEmpty()){
            Database.LeadConvertResult[] results=Database.ConvertLead(LeadConvert);
        }
    }
}