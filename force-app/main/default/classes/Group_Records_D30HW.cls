/*
 * @Description : This class is used to handle multiple SOQL Queries
 * @Author : SWAPNA IT
 * @Created date : 15/08/2023
 * @Modified by
 */

public class Group_Records_D30HW {
    public static void getAllGroups(){
       List<Group> gpList=[SELECT Id, Name, Type FROM Group WHERE Type LIKE 'Role%'];
        for(Group gp:gpList){
            system.debug('Group Records :'+gp);
        }
    }
    public static void getAllGrouprec(string startingchar){
       List<Group> gpList=[SELECT Id, Name, Type FROM Group WHERE Type LIKE: startingchar + '%'];
        for(Group gp:gpList){
            system.debug('Group Records :'+gp);
        }
    }
}