public class acc_DynamicSOQL {
    public static void getRecordCount(){
        //Static SOQL Query
        integer recordcount=[SELECT count() FROM Account];
        System.debug('Account Record Count is...:'+recordcount);
        //Dynamic SOQL Query
        String accountquery='SELECT count() FROM Account';
        integer accountrecordcount=database.countquery(accountquery);
        System.debug('Account Record Count is...:'+accountrecordcount);
    }
}