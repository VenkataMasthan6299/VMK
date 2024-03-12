public class Parent_To_Child_Standard {
    public static void getParentToChildAccountRecord(String accountName){
        if(accountName!=null && accountName!=''){
            List<Account> accList=[SELECT Id, Name, Phone, Fax, AccountNumber, Industry, AnnualRevenue, Rating, Active__c,
                                   (SELECT Id, FirstName, LastName, Phone, Fax, Email FROM Contacts),
                                   (SELECT Id, Name, StageName, Amount, LeadSource, Probability FROM Opportunities),
                                   (SELECT Id, CaseNumber, Status, Priority, Origin FROM Cases)
                                    FROM Account WHERE Name=:accountName];
            System.debug('Collection Size...:'+accList);
            if(!accList.isEmpty()){
                for(Account acc:accList){
                    System.debug('Account Record :'+acc);
                    System.debug('No.of Contacts...:'+acc.Contacts.size());
                    for(Contact con:acc.Contacts){
                        System.debug('Contact Record...:'+con);
                    }
                    System.debug('No.of Opportunities...:'+acc.Opportunities.size());
                    for(Opportunity opp:acc.Opportunities){
                        System.debug('Opportunity Record...:'+opp);
                    }
                    System.debug('No.of Cases...:'+acc.Cases.size());
                    for(Case cs:acc.Cases){
                        System.debug('Case Record...:'+cs);
                    }
                }
            }
        }
    }
}