public class Delete_Contact_Record_D31HW {
    public static void DeleteContactRecords(string stringchar){
        Delete [SELECT Id FROM Contact Where LastName Like:stringchar+'%'];
    }
}