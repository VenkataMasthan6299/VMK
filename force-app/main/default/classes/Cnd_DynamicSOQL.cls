public class Cnd_DynamicSOQL {
    public static void getCandidateLocation(String cityName){
        if(cityName!=null && cityName!=''){
            String candidateQuery='SELECT Id, Name, Email__c, Location__c, Phone_Number__c FROM Candidate__c WHERE Location__c=:cityName';
                    List<Candidate__c> cnd=Database.query(candidateQuery);
            System.debug('Collection size...:'+cnd.size());
            if(!cnd.isEmpty()){
                for(Candidate__c can:cnd){
                    System.debug('Candidate Record...:'+can);
                }
            }
        }
    }
}