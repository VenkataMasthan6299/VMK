public class SOQLACC_Limit_Offset {
    public static void getAllAccountRecord(){
        List<Account> accList=[SELECT Id, Name, Phone, Fax, Industry, AnnualRevenue, Rating FROM Account
                           ORDER BY Name LIMIT 10 OFFSET 10];
        if(!accList.isEmpty()){
            for(Account acc:accList){
                System.debug('Account Record is : '+acc);
            }
        }
    }
}