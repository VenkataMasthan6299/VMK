public class AggregateSOQL {
    public static void getAccountIndustrywithCount(){
        AggregateResult[] aggResult=[SELECT Industry, count(Id)recordscount FROM Account GROUP BY Industry];
        System.debug('Collection size....:'+aggResult.size());
        for(AggregateResult res:aggResult){
            System.debug('Industry Name...:'+res.Get('Industry')+'....Count:'+res.Get('recordsCount'));
        }
    }
}