public class CaseRecord_Priority_D29HW {
         public static void getCase(string csPriority){
        for(Case cs: [SELECT Id, Priority FROM Case WHERE Priority=:csPriority]){
            system.debug('Case Record :'+cs.Id);
        }
        List<string> Priority=new List<string>{'High','Low'};
         getPriority(Priority);   
    }
    public static void getPriority(List<string> Priority){
        for(Case cs: [SELECT Id, Priority FROM Case WHERE Priority IN: Priority]){
            system.debug('Priority Record :'+cs);
        }
    }
}