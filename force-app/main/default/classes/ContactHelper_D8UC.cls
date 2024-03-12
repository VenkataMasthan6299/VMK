/*
 * @Description : This class used for helper class for Contact
 * @Author : SWAPNA IT
 * @Created by : 08-08-2023
 * @Last Modified date 
 */
 
public class ContactHelper_D8UC {
    public static void getAllContacts(){
    List<Contact> conList=[SELECT Id, Name, Email, Phone FROM Contact];
        if(!conList.isEmpty()){
          for(Contact con:conList){
            system.debug('Name : '+con.Name);
            system.debug('Email : '+con.Email);
            system.debug('Phone : '+con.phone);
            system.debug(' #################### ');  
          }        
        }
    }
    
    public static void getAllContactsRec(){
        for(Contact con:[SELECT Id, Name, Email, Phone FROM Contact]){
            system.debug('Name : '+con.Name);
            system.debug('Email : '+con.Email);
            system.debug('Phone : '+con.phone);
            system.debug(' #################### ');  
        }
    }
    
    //Custom Object Games
    
        public static void getAllGames(){
    List<Game__c> gameList=[SELECT Id, Name FROM Game__c];
        if(!gameList.isEmpty()){
          for(Game__c game:gameList){
            system.debug('Id : '+game.Id);
            system.debug('Name : '+game.Name);
           
            system.debug(' #################### ');  
          }        
        }
    }
    
    public static void getAllGamesRec(){
        for(Game__c game:[SELECT Id, Name FROM Game__c]){
            system.debug('Id : '+game.Id);
            system.debug('Name : '+game.Name);
            
            system.debug(' #################### ');  
        }
    }    
}