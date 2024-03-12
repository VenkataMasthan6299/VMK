trigger LeadTrigger_M on Lead (After update) {
    if(trigger.isAfter && trigger.isUpdate){
        LeadStatus lstatus=[SELECT Id, MasterLabel, IsConverted FROM LeadStatus WHERE IsConverted=true];
        List<Database.LeadConvert> leadConvert=new List<Database.LeadConvert>();
        for(Lead ld:trigger.new){
            if(ld.Status=='Closed-Converted' && ld.IsConverted==false){
                Database.LeadConvert lconvert=new Database.LeadConvert();
                lconvert.SetLeadId(ld.Id);
                lconvert.SetSendNotificationEmail(true);
                lconvert.SetDoNotCreateOpportunity(false);
                lconvert.SetConvertedStatus(lstatus.MasterLabel);
                leadConvert.Add(lconvert);
            }
        }
        if(!leadConvert.isEmpty()){
            Database.LeadConvertResult[] res=Database.ConvertLead(leadConvert);
        }
    }
}