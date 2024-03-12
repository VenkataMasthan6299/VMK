public class HiringManager_Designation_D29HW {
   public static void getHiringManager(string hmDesignation){
   for(Hiring_Manager__c hm:[SELECT Id, Name, Designation__c FROM Hiring_Manager__c WHERE Designation__c=:hmDesignation]){
            system.debug('Hiring Manager Record :'+hm.Id);
        }
        List<string> designations=new List<string>{'HR Manager','HR Executive'};
         getDesignation(designations);   
  }
 public static void getDesignation(List<string> designations){
 for(Hiring_Manager__c hm: [SELECT Id, Name, Designation__c FROM Hiring_Manager__c WHERE Designation__c IN: designations]){
            system.debug('Designation Record :'+hm);
        }
    }
}