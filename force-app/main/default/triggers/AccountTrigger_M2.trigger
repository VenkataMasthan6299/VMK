trigger AccountTrigger_M2 on Account (before delete) {
    if(trigger.isBefore && trigger.isdelete){
        List<Contact> contacts = [SELECT id, FirstName, LastName, accountid from Contact 
                                    where accountid IN:trigger.OldMap.KeySet()];
        if(!contacts.isEmpty()){
            for(Contact con:contacts){
                con.accountid=null;
            }
            update contacts;
        }
    }
}