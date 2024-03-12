trigger ContactsDeletion_Trigger on Account (before delete, After update) {
    if(trigger.isupdate && trigger.isafter){
        List<Account> Accounts=[SELECT id,name,phone,fax, (SELECT id,FirstName,LastName,phone,fax FROM Contacts) 
                                FROM Account WHERE ID in:trigger.NewMap.KeySet()];
        List<Contact> ContactsToUpdate=new List<Contact>();
        if(!Accounts.isEmpty()){
            for(Account acc:Accounts){
                if(!acc.Contacts.isEmpty()){
                    for(Contact con:acc.Contacts){
                        con.phone=acc.phone;
                        con.fax=acc.fax;
                        ContactsToUpdate.Add(con);
                    }
                }
            }
        }
        if(!ContactsToUpdate.isEmpty()){
            Update ContactsToUpdate;
        }
    }
}