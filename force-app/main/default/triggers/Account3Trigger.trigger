trigger Account3Trigger on Account (before delete) {
    if(trigger.isdelete && trigger.isbefore){
        for(Account acc:trigger.old){
            if(acc.Active__c==null){
                acc.AddError('You are Not Authorized to Delete an Active Account');
            }
        }
    }
}