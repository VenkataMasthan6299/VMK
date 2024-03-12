trigger LeadConversionStatus_Trigger on Lead (After Update) {
    if(trigger.isAfter && trigger.isUpdate){
        LeadStatus lStatus=[SELECT Id, IsConverted, MasterLabel FROM LeadStatus WHERE IsConverted=true];
        List<Database.LeadConvert> LeadToConvert=new List<Database.LeadConvert>();
        for(Lead ld:trigger.new){
            if(ld.status=='Closed-Converted' && ld.IsConverted==false){
                Database.LeadConvert lConvert=new Database.LeadConvert();
                lConvert.SetLeadId(ld.id);
                lConvert.SetSendNotificationEmail(true);
                lConvert.SetDoNotCreateOpportunity(false);
                lConvert.SetConvertedStatus(lStatus.MasterLabel);
                LeadToConvert.Add(lConvert);
            }
        }
        if(!LeadToConvert.isEmpty()){
            Database.LeadConvertResult[] results=Database.convertLead(LeadToConvert);
        }
    }
}