/*
 * @Description : This class is used to handle multiple SOQL Queries
 * @Author : SWAPNA IT
 * @Created date : 15/08/2023
 * @Modified by
 */

public class Account_Records_D30UC {
     public static void getAllAccounts(){
       List<Account> accList=[SELECT Id, Name FROM Account WHERE Name LIKE '%Kumar'];
        for(Account acc:accList){
            system.debug('Account Records :'+acc);
        }
    }
    public static void getAllAccountsRec(string startingchar){
       List<Account> accList=[SELECT Id, Name FROM Account WHERE Name LIKE: startingchar + '%'];
        for(Account acc:accList){
            system.debug('Account Records :'+acc);
        }
    }
}