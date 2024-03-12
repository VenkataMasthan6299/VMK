public class Update_DMLAccount {
    public static void UpdateAccount(){
        List<Account> accList=new List<Account>();
        for(Account acc:[SELECT Id, Name, Industry, AnnualRevenue, Rating FROM Account WHERE Industry='Banking']){
            acc.Rating='Hot';
            acc.AnnualRevenue=2000000;
            accList.add(acc);
        }
        if(!accList.isEmpty()){
            Update accList;
        }
    }
}