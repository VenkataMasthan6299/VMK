public class UserSOQL {
    public static void GetAllUserRecords(){
        for(User u:[SELECT Id, FirstName, LastName, Username, CompanyName, profile.Name, Email, Phone, IsActive FROM User]){
            System.debug('User Record is...:'+u);
        }
    }
}