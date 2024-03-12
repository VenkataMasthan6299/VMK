trigger ContactTrigger_M on Contact (before insert, before update) {
    if(trigger.isbefore && (trigger.isinsert || trigger.isupdate)){
        for(Contact con:trigger.new){
            if(con.Email==null || con.Email==''){
                con.Email.AddError('Please Enter Email Id value');
            }
            else if(con.Phone==null || con.Phone==''){
                con.Phone.AddError('Please Enter Phone Number');
            }
        }
    }
}