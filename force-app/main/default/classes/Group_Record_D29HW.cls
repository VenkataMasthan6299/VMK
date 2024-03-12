/*
 * @Description : This class used for Group Records
 * @Author : SWAPNA IT
 * @Created by : 10-08-2023
 * @Last Modified date 
 */

public class Group_Record_D29HW {
       public static void getAllGroup(){
      List<Group> groupList=[SELECT Id, Name, Type FROM Group]; 
        if(!groupList.isEmpty()){
          for(Group gp:groupList){
            system.debug('Name : '+gp.Name);
            system.debug('Type : '+gp.Type);         
            system.debug('***************************'); 
          }        
       }  
     }
    
    public static void getAllGroupRec(){        
         for(Group gp:[SELECT Id, Name, Type FROM Group]){
            system.debug('Name : '+gp.Name);
            system.debug('Type : '+gp.Type);       
            system.debug('***************************'); 
        }
    }
}