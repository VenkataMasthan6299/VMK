public class HMRecruiterHandler1 {
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
    public static void AfterUpdate(Map<id,Hiring_Manager__c> hmupdate){
        if(!hmupdate.isEmpty()){
            List<Recruiter__c> recruiters=[SELECT id,name,City_Name__c,Designation__c,Email_address__c,Hiring_Manager__c 
                                           FROM Recruiter__c WHERE Hiring_Manager__c IN:hmupdate.keyset()];
            if(!recruiters.isEmpty()){
                List<Recruiter__c> recupdate=new List<Recruiter__c>();
                for(Recruiter__c rec:recruiters){
                    Hiring_Manager__c hrlist=hmupdate.Get(rec.Hiring_Manager__c);
                    rec.Name=hrlist.Name;
                    rec.City_Name__c=hrlist.Location_Name__c;
                    rec.Email_address__c=hrlist.Email_address__c;
                    rec.Designation__c=hrlist.Designation__c;
                    rec.Hiring_Manager__c=hrlist.Id;
                    recupdate.add(rec);
                }
                if(!recupdate.isEmpty()){
                    update recupdate;
                }
            }
        }
    }
}