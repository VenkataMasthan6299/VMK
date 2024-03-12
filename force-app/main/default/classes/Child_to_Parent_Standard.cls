public class Child_to_Parent_Standard {
    public static void getChildToParentCaseRecord(String csNumber){
        if(csNumber!=null && csNumber!=''){
            List<Case> csList=[SELECT Id, CaseNumber, Status, Origin, Priority, Contact.FirstName, Contact.Email,
                               Contact.Account.Name, Contact.Account.Industry, Contact.Account.Owner.Email,
                               Contact.Account.Owner.Profile.Name FROM Case WHERE CaseNumber=:csNumber];
            System.debug('Collection Size..:'+csList.size());
            if(!csList.isEmpty()){
                for(Case cs:csList){
                    System.debug('Case Record...:'+cs);
                    System.debug('Contact Email...:'+cs.Contact.Email);
                    System.debug('Account Name...:'+cs.Contact.Account.Name);
                    System.debug('AOwner Details...:'+cs.Contact.Account.Owner.Email);
                    System.debug('Profile Name...:'+cs.Contact.Account.Owner.Profile.Name);
                }
            }
        }
    }
}