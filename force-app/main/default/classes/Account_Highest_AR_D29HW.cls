public class Account_Highest_AR_D29HW {
      public static void getAccounts(){
        List<Account> accList=[SELECT Id, Name, Type, AnnualRevenue FROM Account ORDER BY AnnualRevenue desc OFFSET 23];
        system.debug('Account Records :'+accList);
          for(Account acc:accList){
              system.debug('Highest Annual Revenue Accounts :'+acc.AnnualRevenue);
          }
    }
}