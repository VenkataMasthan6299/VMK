public class LeadHandler_M1 {
    public static void AfterUpdate(List<Lead> leads){
        LeadStatus lstatus=[SELECT Id, MasterLabel, IsConverted FROM LeadStatus WHERE IsConverted=true];
        List<Database.LeadConvert> leadsToC=new List<Database.LeadConvert>();
        for(Lead ld:leads){
            if(ld.Status=='Closed-Converted' && ld.IsConverted==false){
                Database.LeadConvert lConvert=new Database.LeadConvert();
                lConvert.SetLeadID(ld.Id);
                lConvert.SetSendNotificationEmail(true);
                lConvert.SetDoNotCreateOpportunity(false);
                lConvert.SetConvertedStatus(lstatus.MasterLabel);
                leadsToC.Add(lConvert);
            }
        }
        if(!leadsToC.isEmpty()){
            Database.LeadConvertResult[] res=Database.ConvertLead(leadsToC);
        }
    }
}