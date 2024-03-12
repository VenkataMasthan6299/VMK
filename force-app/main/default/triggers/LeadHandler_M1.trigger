trigger LeadHandler_M1 on Lead (After Update) {
    if(trigger.isAfter && trigger.isUpdate){
        LeadHandler_M1.AfterUpdate(trigger.new);
    }
}