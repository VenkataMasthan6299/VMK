@isTest
public class DataBaseHelper_Test {
    static testmethod void datatest(){
        Hiring_Manager__c hr=new Hiring_Manager__c(Name='Ram', Email_Address__c='ram@gmail.com', Location_Name__c='Hyderabad', Contact_Number__c=275865729);
        insert hr;
        
        Position__c pos=new Position__c();
        pos.Name='Sam';
        pos.Phone_Number__c='9837835';
        pos.Position_Designation__c='CEO';
        pos.Open_Date__c=system.Today();
        pos.Location__c='Hyderabad';
        pos.Text_One__c='Hii Sam';
        pos.Hiring_Manager__c='hr.id';
        insert pos;
        DataBaseHelper.GetPositionsByLocation('Hyderabad');
        DataBaseHelper.GetAllPositionByOffset();
         Contact con=new Contact(LastName='mad', FirstName='max', Phone='87867341', Fax='764327723', Title='Manager', Email='max@gmail.com');
        insert con;
        DataBaseHelper.SearchContact('max');
        DataBaseHelper.SearchContact('max@gmail.com');
        
        Opportunity opp=new Opportunity(Name='jai', CloseDate=system.Today(), StageName='Prospecting', Amount=5000000);
        insert opp;
        DataBaseHelper.GetAnOpportunityRecord();
    }
}