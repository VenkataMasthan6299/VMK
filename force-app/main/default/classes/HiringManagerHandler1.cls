public class HiringManagerHandler1 {
    public static void AfterInsert(List<Hiring_Manager__c> hmlist){
        if(!hmlist.isEmpty()){
            List<Recruiter__c> reclist=new List<Recruiter__c>();
            for(Hiring_Manager__c hr:hmlist){
                Recruiter__c rec=new Recruiter__c();
                rec.Name=hr.Name;
                rec.City_Name__c=hr.Location_Name__c;
                rec.Email_address__c=hr.Email_address__c;
                rec.Designation__c=hr.Designation__c;
                rec.Hiring_Manager__c=hr.Id;
                reclist.add(rec);
            }
            if(!reclist.isEmpty()){
                insert reclist;
            }
        }
    }
}