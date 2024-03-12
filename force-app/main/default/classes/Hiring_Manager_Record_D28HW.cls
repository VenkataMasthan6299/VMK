/*
 * @Description : This class used for Hiring Manager Records
 * @Author : SWAPNA IT
 * @Created by : 10-08-2023
 * @Last Modified date 
 */

public class Hiring_Manager_Record_D28HW {
    public static void getAllHiringManager(){
        List<Hiring_Manager__c> hmList=[SELECT Id, Name, Contact_Number__c, Designation__c, Email_Address__c FROM Hiring_Manager__c]; 
        if(!hmList.isEmpty()){
          for(Hiring_Manager__c Hm:hmList){
            system.debug('Name : '+hm.Name);
            system.debug('Contact Number : '+hm.Contact_Number__c);
            system.debug('Designation : '+hm.Designation__c);
            system.debug('Email Address : '+hm.Email_Address__c); 
            system.debug('***************************'); 
          }        
       }  
     }
    
    public static void getAllHiringManagerRec(){        
          for(Hiring_Manager__c hm:[SELECT Id, Name, Contact_Number__c, Designation__c, Email_Address__c FROM Hiring_Manager__c]){
            system.debug('Name : '+hm.Name);
            system.debug('Contact Number : '+hm.Contact_Number__c);
            system.debug('Designation : '+hm.Designation__c);
            system.debug('Email Address : '+hm.Email_Address__c);
            system.debug('***************************'); 
        }
    }
}