public class CandidateRecord_Qualification_D29HW {
         public static void getCandidate(string caQualification){
        for(Candidate__c ca: [SELECT Id, Name, Qualification__c FROM Candidate__c WHERE Qualification__c=:caQualification]){
            system.debug('Candidate Record :'+ca.Id);
        }
        List<string> qualification=new List<string>{'B.Tech','M.Tech','MCA'};
         getQualification(qualification);   
    }
    public static void getQualification(List<string> qualification){
        for(Candidate__c ca: [SELECT Id, Name, Qualification__c FROM Candidate__c WHERE Qualification__c IN: qualification]){
            system.debug('Qualification Record :'+ca);
        }
    }
}