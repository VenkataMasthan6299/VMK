/*
 * @Description : This class used for Hiring Manager Records
 * @Author : SWAPNA IT
 * @Created by : 10-08-2023
 * @Last Modified date 
 */

public class User_D28HW {
    public static void getAllUsers(){
        List<User> userList=[SELECT Id, Name, IsActive, Address, Phone FROM User]; 
        if(!userList.isEmpty()){
          for(User us:userList){
            system.debug('Name : '+us.Name);
            system.debug('IsActive : '+us.IsActive);
            system.debug('Address : '+us.Address);
            system.debug('Phone Number : '+us.Phone); 
            system.debug('***************************'); 
          }        
       }  
     }
    
    public static void getAllUsersRec(){        
          for(User us:[SELECT Id, Name, IsActive, Address, Phone FROM User]){
            system.debug('Name : '+us.Name);
            system.debug('IsActive : '+us.IsActive);
            system.debug('Address : '+us.Address);
            system.debug('Phone Number : '+us.Phone);
            system.debug('***************************'); 
        }
    }
}