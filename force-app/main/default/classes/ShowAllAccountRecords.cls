public class ShowAllAccountRecords {
    public List<Account> accList{get; set;}
    public ShowAllAccountRecords(){
         accList=[SELECT Id, Name, Industry, AnnualRevenue, Rating, Type, Active__c FROM Account Order By Name];
    }
}