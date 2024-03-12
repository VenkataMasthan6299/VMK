public class Lead_Records_desc_D29HW {
       public static void getLeads(){
        List<Lead> ldList=[SELECT Id, Name, AnnualRevenue FROM Lead ORDER BY AnnualRevenue];
        system.debug('Lead Records :'+ldList);
    }
}