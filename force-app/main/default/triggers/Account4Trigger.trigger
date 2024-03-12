trigger Account4Trigger on Account (before delete) {
    if(trigger.isdelete && trigger.isbefore){
        List<Contact> Contacts=[SELECT Id, AccountId, LastName, FirstName FROM Contact WHERE AccountId IN:trigger.OldMap.KeySet()];
        if(!Contacts.isEmpty()){
            for(Contact con:Contacts){
                con.Accountid=null;
            } 
            update Contacts;
        }
    }
}