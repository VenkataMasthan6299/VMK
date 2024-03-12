/*
 * @Description : This class used for Opportunity Records
 * @Author : SWAPNA IT
 * @Created by : 10-08-2023
 * @Last Modified date 
 */

public class Opportunity_Record_D29HW {
      public static void getAllOpportunity(){
      List<Opportunity> oppList=[SELECT Id, Name, CloseDate, StageName  FROM Opportunity]; 
        if(!oppList.isEmpty()){
          for(Opportunity opp:oppList){
            system.debug('Name : '+opp.Name);
            system.debug('Close Date : '+opp.CloseDate);
            system.debug('Stage Name : '+opp.StageName);            
            system.debug('***************************'); 
          }        
       }  
     }
    
    public static void getAllOpportunityRec(){        
         for(Opportunity opp:[SELECT Id, Name, CloseDate, StageName FROM Opportunity]){
            system.debug('Name : '+opp.Name);
            system.debug('Close Date : '+opp.CloseDate);
            system.debug('Stage Name : '+opp.StageName);            
            system.debug('***************************'); 
        }
    }
}