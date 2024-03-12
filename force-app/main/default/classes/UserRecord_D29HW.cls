public class UserRecord_D29HW {
    public static void getAllUsers(){
        Map<Id,User> userMap=new Map<Id,User>();
        for(User us:[SELECT Id, Name, Phone FROM User]){
            userMap.put(us.Id,us);
        }
        system.debug('User Record : '+userMap);
    
     Map<Id,User> userMap1=new Map<Id,User>([SELECT Id, Name, Phone FROM User LIMIT 1]);                                   
        system.debug('userMap1 : '+userMap1);
        for(User us:userMap1.values()){                   
        system.debug('User Record : '+us);
    }
}
}