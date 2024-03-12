trigger AccountTrigger_M3 on Account (After update) {
    if(trigger.isAfter && trigger.isupdate){
        List<Account> accounts=[SELECT id, name, Phone, Fax, (select id, FirstName, LastName, Phone, Fax from Contacts) 
                                from Account where ID in:trigger.NewMap.KeySet()];
        List<Contact> contactsToUpdate=new List<Contact>();
        if(!accounts.isEmpty()){
            for(Account acc:accounts){
                if(!acc.contacts.isEmpty()){
                    for(Contact con:acc.contacts){
                        con.Phone=acc.Phone;
                        con.Fax=acc.Fax;
                        contactsToUpdate.add(con);
                    }
                }
            }
        }
        if(!contactsToUpdate.isEmpty()){
            update contactsToUpdate;
        }
    }
}