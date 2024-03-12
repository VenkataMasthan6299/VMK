public class Account_Record_D29HW {
    public static void getAccounts(){
        List<Account> accList=[SELECT Id, Name, IsDeleted FROM Account All Rows];
        system.debug('Account Records :'+accList);
    }
}