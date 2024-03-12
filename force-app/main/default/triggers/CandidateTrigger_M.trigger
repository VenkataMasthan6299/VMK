trigger CandidateTrigger_M on Candidate__c (before insert, before update) {
    if(trigger.isBefore && (trigger.isinsert || trigger.isupdate)){
        for(Candidate__c cnd:trigger.new){
            integer recordsCount =[SELECT count() from Candidate__c where name=:cnd.name];
            if(recordsCount>0){
                cnd.AddError('We have a Candidate record with this name. Duplicate candidates are not accepted');
            }
        }
    }
}