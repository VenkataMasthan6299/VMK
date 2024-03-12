public class SOQLAccount {
    public static void getAllAccountRecord(){
        List<Account> acc=[SELECT Id, Name, Phone, Fax, Industry, AnnualRevenue, Rating FROM Account ALL ROWS];
        System.debug('Collection size is :'+acc.size());
    }
}