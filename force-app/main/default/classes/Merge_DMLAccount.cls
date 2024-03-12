public class Merge_DMLAccount {
    public static void mergeAccounts(){
        Account acc1=[SELECT Id, Name, Industry, AnnualRevenue, Rating FROM Account  WHERE Name like 'Swapna%' LIMIT 1];
        Account acc2=[SELECT Id, Name, Industry, AnnualRevenue, Rating FROM Account  WHERE Name like 'Swapna%' LIMIT 1];
        System.debug('Account SWwapna1 Record...:'+acc1);
        System.debug('Account Swapna2 Record...:'+acc2);
        if(acc1!=null && acc2!=null){
            Merge acc1 acc2;
        }
    }
}