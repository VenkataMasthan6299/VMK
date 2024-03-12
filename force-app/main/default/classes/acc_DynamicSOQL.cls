public class acc_DynamicSOQL {
    public static void getRecordCount(){
        //Static SOQL Query
        integer recordcount=[SELECT count() FROM Account];
        System.debug('Account Record Count is...:'+recordcount);
        //Dynamic SOQL Query
        String accountquery='SELECT count() FROM Account';
        integer accountrecordcount=database.countquery(accountquery);
        //Adding Component to test Repository
        System.debug('Account Record Count is...:'+accountrecordcount);
        //Adding Component to test Repository to the Develop
        //To create new branch from local repository
    }
}