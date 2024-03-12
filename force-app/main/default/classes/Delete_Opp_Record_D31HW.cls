public class Delete_Opp_Record_D31HW {
    public static void DeleteOpportunityRecords(string stringchar){
        Delete [SELECT Id FROM Opportunity Where Name Like:stringchar+'%'];
    }
}