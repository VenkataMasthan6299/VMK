trigger AccountTrigger_M1 on Account (before delete) {
    if(trigger.isBefore && trigger.isdelete){
        for(Account acc:trigger.old){
            if(acc.Active__c=='yes'){
                acc.AddError('You are not Authorized to delete an Active Account');
            }
        }
    }
}