public class ACC_OPP_CASE_Records_D31HW {
        public static void accountRecords(){
        List<Account> accList=new List<Account>();
            account acc=new account();
            acc.Name='Venkat'; 
            accList.add(acc); 
            if(!accList.isEmpty())
           {
              insert accList;
           }
            
            List<Opportunity> oppList=new List<Opportunity>();           
            for(integer i=1; i<=20; i++){
               Opportunity opp=new Opportunity();
               opp.Name='Salesforce';
               opp.CloseDate=Date.today().addDays(i);
               opp.Type='Existing Customer-Replacement';
               opp.LeadSource='Web';
               opp.StageName='Prospecting'; 
               oppList.add(opp);               
            }
             if(!oppList.isEmpty())
             {
                insert oppList;
             }
            
            List<Case> caseList=new List<Case>(); 
            for(integer j=1; j<=10; j++){
               Case cs=new Case();
               cs.Type='Structural';
               cs.Origin='Phone';
               cs.Reason='Breakdown';
               cs.Priority='Medium'; 
               cs.Status='New';
               caseList.add(cs);               
            }                                                                                                
            if(!caseList.isEmpty())
            {
               insert caseList;
            }
    }
}