public class Undelete_Opp_Records_D31HW {
      public static void UndeleteOpportunityRecords(string stringchar){
        Undelete [SELECT Id FROM Opportunity Where Name Like:stringchar+'%' and IsDeleted =true ALL ROWS];
    }
}