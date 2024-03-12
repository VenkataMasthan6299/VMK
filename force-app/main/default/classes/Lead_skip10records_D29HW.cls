public class Lead_skip10records_D29HW {
       public static void getLeads(){
        List<Lead> ldList=[SELECT Id, Name, Company FROM Lead ORDER BY Company OFFSET 10];
        system.debug('Lead Skip First 10 Records :'+ldList);
    }
}