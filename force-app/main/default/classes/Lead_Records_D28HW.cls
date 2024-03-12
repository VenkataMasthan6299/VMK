/*
 * @Description : This class used for Lead Records
 * @Author : SWAPNA IT
 * @Created by : 10-08-2023
 * @Last Modified date 
 */

public class Lead_Records_D28HW {
    public static void getAllLeads(){
        List<Lead> ldList=[SELECT Id, Name, Email, Phone, Rating FROM Lead]; 
        if(!ldList.isEmpty()){
          for(Lead ld:ldList){
            system.debug('Name : '+ld.Name);
            system.debug('Email : '+ld.Email);
            system.debug('Phone : '+ld.phone);
            system.debug('Rating : '+ld.Rating);              
          }        
       }  
     }
    
    public static void getAllLeadsRec(){        
          for(Lead ld:[SELECT Id, Name, Email, Phone, Rating FROM Lead]){
            system.debug('Name : '+ld.Name);
            system.debug('Email : '+ld.Email);
            system.debug('Phone : '+ld.phone);
            system.debug('Rating : '+ld.Rating);
        }
    }
}