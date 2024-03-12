trigger HiringManagerTrigger on Hiring_Manager__c (after insert) {
    if(Trigger.isafter && Trigger.isinsert){
        HiringManagerHandler.afterInsert(Trigger.new);
    }
}