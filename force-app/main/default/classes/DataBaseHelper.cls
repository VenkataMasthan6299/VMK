public class DataBaseHelper {
    public static void SearchContact(String SearchText){
        if(SearchText!=null && SearchText!=''){
            String ContactQuery='SELECT Id, LastName, FirstName, Phone, Fax, Title, Email FROM Contact';
            if(pattern.matches('[a-zA-Z0-9+_-]+@[a-zA-Z-]+[a-zA-Z]{2,4}',SearchText)){
                System.debug('This is Email Format');
                ContactQuery+='where Email=:SearchText';
            }
            else{
                System.debug('This is String Value');
                ContactQuery+='where LastName=:SearchText';
            }
            List<contact> contacts=Database.query(ContactQuery);
            System.debug('Collection Size is:'+contacts.size());
            if(!contacts.isEmpty()){
                for(Contact con:contacts){
                    System.debug('Contact Records :'+contacts);
                }
            }
        }
    }
    public static void GetPositionsByLocation(String cityName){
        if(cityName!=null && cityName!=''){
            String PositionQuery='SELECT Id, Name, Phone_Number__c, Position_Status__c, Text_One__c, Position_Designation__c, Open_Date__c, Location__c FROM Position__c WHERE Location__c=:cityName';
                    List<Position__c> positions=Database.query(PositionQuery);
            if(!positions.isEmpty()){
                for(Position__c pos:positions){
                    System.debug('Position Records :'+positions);
                }
            }
        }
    }
    public static void GetAllPositionByOffset(){
        List<Position__c> posList=[SELECT Id, Name, CreatedDate, Phone_Number__c, Text_One__c, Position_Status__c,Position_Designation__c, Open_Date__c, Location__c FROM Position__c order by createddate desc OFFSET 5];
        if(!posList.isEmpty()){
            for(Position__c pos:posList){
                System.debug('Position Records :'+pos);
            }
        }
    }
    public static void GetAnOpportunityRecord(){
       Opportunity opp=[SELECT Id, Name, LeadSource, CloseDate, StageName, Amount FROM Opportunity Limit 1]; 
        if(opp!=null){
            System.debug('Opportunity Record :'+opp);
        }
    }
}