trigger CandidateTrigger on Candidate__c (before insert, before update) {
    if((trigger.isinsert || trigger.isupdate) && trigger.isbefore){
        for(Candidate__c cnd:trigger.new){
            integer recordcount=[SELECT count() from Candidate__c WHERE name=:cnd.name];
            if(recordcount>0){
                cnd.AddError('Duplicate Candidates can not be accepted');
            }
        }
    }
}