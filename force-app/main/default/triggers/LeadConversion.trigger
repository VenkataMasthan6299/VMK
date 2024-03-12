trigger LeadConversion on Lead (After Update) {
    if(Trigger.isAfter && Trigger.isUpdate){
        LeadHandler.AfterUpdate(Trigger.New);
    }
}