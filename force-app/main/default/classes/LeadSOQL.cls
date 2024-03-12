public class LeadSOQL {
    public static void GetAllLeadRecords(){
        List<lead> leadlist=[SELECT Id, FirstName, LastName, Company, Phone, Fax, city, LeadSource, Status FROM Lead];
        system.debug('Collection Size is...'+leadlist.size());
        if(!leadlist.isEmpty()){
            for(Lead ld:leadlist){
                System.debug('Lead Id...:'+ld.id);
                System.debug('Lead Name...:'+(ld.FirstName+''+ld.LastName));
                System.debug('Lead Company Name...:'+ld.Company);
                System.debug('Lead Status...:'+ld.Status);
                System.debug('Lead Phone Number...:'+ld.phone);
                System.debug('Lead Fax Number...:'+ld.Fax);
                System.debug('Lead City...:'+ld.city);
                System.debug('Lead Source...:'+ld.LeadSource);
                System.debug('----------------------------');
            }
        }
    }
}