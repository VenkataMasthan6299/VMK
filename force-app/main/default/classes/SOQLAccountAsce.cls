public class SOQLAccountAsce {
    public static void getAllAccountRecord(){
        List<Account> acc=[SELECT Id, Name, Phone, Fax, Industry, AnnualRevenue, Rating FROM Account ORDER BY Name];
        System.debug('Collection size is :'+acc.size());
    }
}