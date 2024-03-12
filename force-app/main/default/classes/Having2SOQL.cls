public class Having2SOQL {
     public static void getAccountIndustrywithCount(){
        AggregateResult[] aggResult=[SELECT Name, count(Id)recordscount FROM Account GROUP BY Name Having count(Id)>1];
        System.debug('Duplicate Account Count....:'+aggResult.size());
        for(AggregateResult res:aggResult){
            System.debug('Account Name...:'+res.Get('Name')+'....Count:'+res.Get('recordsCount'));
        }
    }
}