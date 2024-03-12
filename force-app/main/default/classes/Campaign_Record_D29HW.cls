/*
 * @Description : This class used for Campaign Records
 * @Author : SWAPNA IT
 * @Created by : 10-08-2023
 * @Last Modified date 
 */

public class Campaign_Record_D29HW {
       public static void getAllCampaign(){
      List<Campaign> campList=[SELECT Id, Name, Type, Status FROM Campaign]; 
        if(!campList.isEmpty()){
          for(Campaign camp:campList){
            system.debug('Name : '+camp.Name);
            system.debug('Type : '+camp.Type);
            system.debug('Status : '+camp.Status);          
            system.debug('***************************'); 
          }        
       }  
     }
    
    public static void getAllCampaignRec(){        
         for(Campaign camp:[SELECT Id, Name, Type, Status FROM Campaign]){
            system.debug('Name : '+camp.Name);
            system.debug('Type : '+camp.Type);
            system.debug('Status : '+camp.Status);       
            system.debug('***************************'); 
        }
    }
}