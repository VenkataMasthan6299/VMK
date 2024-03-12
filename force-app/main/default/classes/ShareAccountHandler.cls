/*
 * description: Handler class is used for account sharing based Share_To__c Fields and Annual Revenue Fields
 */

public class ShareAccountHandler {
    public static void AfterInsert(List<Account> accList){
        List<Accountshare> accshareList=new List<Accountshare>();
        for(Account acc:accList){
            if(acc.Share_To__c!=null){
                Accountshare accshare=new Accountshare();
                accshare.AccountId=acc.Id;
                accshare.UserOrGroupId=acc.Share_To__c;
                accshare.RowCause='Manual';
                accshare.OpportunityAccessLevel='READ';
                accshare.CaseAccessLevel='READ';
                if(acc.AnnualRevenue>=5000000){
                  accshare.AccountAccessLevel='EDIT';  
                }
                else{
                   accshare.AccountAccessLevel='READ'; 
                }
                accshareList.add(accshare);
            }
        }
        if(!accshareList.isEmpty()){
            Database.insert(accshareList,false);
        }
    }
}