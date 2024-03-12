public class HavingSOQL {
 public static void getAccountIndustrywithCount(){
        AggregateResult[] aggResult=[SELECT Industry, count(Id)recordscount FROM Account GROUP BY Industry Having count(Id)>=3];
        System.debug('Collection size....:'+aggResult.size());
        for(AggregateResult res:aggResult){
            System.debug('Industry Name...:'+res.Get('Industry')+'....Count:'+res.Get('recordsCount'));
        }
    }
}