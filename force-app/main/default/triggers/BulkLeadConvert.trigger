trigger BulkLeadConvert on Lead (After Update) {
    if(Trigger.isAfter && Trigger.isUpdate){
        LeadStatus lstatus=[SELECT Id, MasterLabel, IsConverted FROM LeadStatus Where IsConverted=true];
        system.debug('lstatus-->'+lstatus);
        List<Database.LeadConvert> convertList=new List<Database.LeadConvert>();
        for(Lead lrecord:Trigger.new){
            system.debug('lrecord.Status-->'+lrecord.Status);
            if(lrecord.Status==lStatus.MasterLabel && lrecord.IsConverted==false){
                system.debug('lrecord.IsConverted-->'+lrecord.IsConverted);
                Database.LeadConvert lconvert=new Database.LeadConvert();
                lconvert.setLeadId(lrecord.Id);
                lconvert.setSendNotificationEmail(true);
                lconvert.setDoNotCreateOpportunity(false); 
                lconvert.setConvertedStatus(lstatus.MasterLabel);
                convertList.add(lconvert);
            }            
        }
        system.debug('convertList-->'+convertList);
        try{
            if(!convertList.isEmpty()){
                Database.LeadConvertResult[] result=Database.convertLead(convertList,false);
                system.debug('result-->'+result);
        }         
        }
        catch(exception e){
            system.debug('result-->'+e.getMessage());
        }
    }
}