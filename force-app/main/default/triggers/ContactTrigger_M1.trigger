trigger ContactTrigger_M1 on Contact (before insert, before update) {
    if(trigger.isBefore && (trigger.isinsert || trigger.isupdate)){
        for(Contact con:trigger.new){
            if(con.AccountId==null){
                con.AddError('Please Contact should be associated with an Account');
            }
        }
    }
}