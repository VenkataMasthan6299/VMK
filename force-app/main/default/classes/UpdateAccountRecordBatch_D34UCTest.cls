@isTest(seeAllData=true)
public class UpdateAccountRecordBatch_D34UCTest {
    static testmethod void testbatch(){
        createAccountRecord();
        UpdateAccountRecordBatch_D34UC bt=new UpdateAccountRecordBatch_D34UC();
        Database.executeBatch(bt);
    }
    //Method for Account Creation
    public static void createAccountRecord(){
        List<Account> accList=new List<Account>();
        for(integer c=1;c<=10;c++){
            Account accRecord=new Account();
            accRecord.Name='Testing Account';
            accRecord.Rating='Hot';
            accRecord.Industry='Banking';
            accRecord.Active__c='Yes';
            accRecord.Website='http://www.salesforce.com';
            accRecord.Email__c='iuhgbn@gmail.com';
            accRecord.Fax='897654334';
            accList.add(accRecord);
        }
        Database.insert(accList,false);
    }
}