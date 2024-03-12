public class LeadHandler 
{
public static void AfterUpdate(List<Lead> LeadList)
{
    LeadStatus lstatus=[SELECT Id, MasterLabel, IsConverted FROM LeadStatus WHERE IsConverted=true];
    List<Database.LeadConvert> LeadConvert=new List<Database.LeadConvert>();
    for(Lead ld:LeadList)
    {
        if(ld.status=='Closed-Converted' && ld.IsConverted==false)
        {
            Database.LeadConvert lConvert=new Database.LeadConvert();
            lConvert.SetLeadId(ld.Id);
            lConvert.SetSendNotificationEmail(true);
            lConvert.SetDoNotCreateOpportunity(false);
            lConvert.SetConvertedStatus(lstatus.MasterLabel);
            LeadConvert.add(lConvert);
        }
    }
    if(!LeadConvert.isEmpty())
    {
        Database.LeadConvertResult[] results=Database.ConvertLead(LeadConvert);
    }
}
}