public class PGroupSOQL {
    public static void GetAllPublicGroupRecord(){
       Map<id,Group> MG=new Map<id,Group>([SELECT Id, Name, DeveloperName, Type, Email FROM Group]);
        System.debug('Collection Size...'+MG.size());
        if(!MG.isEmpty()){
            for(Group pg:MG.values()){
                System.debug('Public Group Record...'+pg);
            }
        }
    }
}