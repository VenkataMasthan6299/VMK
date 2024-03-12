trigger HiringManager1_Trigger on Hiring_Manager__c (After insert) {
    if(trigger.isAfter && trigger.isInsert){
        HiringManagerHandler1.AfterInsert(trigger.new);
    }
}