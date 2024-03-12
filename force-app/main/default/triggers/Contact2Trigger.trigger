trigger Contact2Trigger on Contact (before insert, before update) {
//if((trigger.isinsert || trigger.isupdate) && trigger.before){
    for(Contact con:trigger.new){
        if(con.AccountId==null){
            con.AddError('Please make the contact should be associated with Account');
        }
    }
}