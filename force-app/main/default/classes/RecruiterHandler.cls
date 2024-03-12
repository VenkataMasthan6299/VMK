public class RecruiterHandler {
    public static void AfterUpdate(List<Recruiter__c> recList){
        if(!recList.isEmpty()){
            List<id> hr=new List<id>();
            for(Recruiter__c rec:recList){
                hr.add(rec.Hiring_Manager__c);
            }
            Map<Id,Hiring_Manager__c> Maphr=new Map<Id,Hiring_Manager__c>([SELECT Id,name,Location_Name__c,Email_address__c,
                                                                          Designation__c From Hiring_Manager__c WHERE Id IN:hr]);
            if(!Maphr.isEmpty()){
                List<Hiring_Manager__c> hm=new List<Hiring_Manager__c>();
                for(Recruiter__c rec:recList){
                    Hiring_Manager__c hmList=Maphr.Get(rec.Hiring_Manager__c);
                    hmList.Name=rec.Name;
                    hmList.Location_Name__c=rec.City_Name__c;
                    hmList.Email_address__c=rec.Email_address__c;
                    hmList.Designation__c=rec.Designation__c;
                    hm.add(hmList);
            }
                if(!hm.isEmpty()){
                    Update hm;
                }
        }
    }
}
}