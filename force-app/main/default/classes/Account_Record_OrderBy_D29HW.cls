public class Account_Record_OrderBy_D29HW {
     public static void getAccounts(){
        List<Account> accList=[SELECT Id, Name FROM Account ORDER BY Name asc];
        system.debug('Account Records :'+accList);
    }
}