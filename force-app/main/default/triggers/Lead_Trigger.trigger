trigger Lead_Trigger on Lead (After Update) {
    if(trigger.isAfter && trigger.isUpdate){
        LeadHandlerClass.AfterUpdate(trigger.new);
    }
}