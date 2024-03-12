trigger Contact1Trigger on Contact (before insert, before update) {
    //if((trigger.isinsert || trigger.isupdate) && trigger.isbefore){
        for(Contact con:trigger.new){
            if(con.Email==null || con.email==''){
                con.AddError('Please enter Email');
            }
            else if(con.Fax==null || con.Fax==''){
                con.AddError('Please enter Fax');
        }
    }
}