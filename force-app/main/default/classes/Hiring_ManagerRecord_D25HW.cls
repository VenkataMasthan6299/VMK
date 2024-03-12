public class Hiring_ManagerRecord_D25HW {
    public static void HRRecord(string hname, string hlocation, string haddress, string hdesignation, integer hctc, integer hnumber)
    {
        Hiring_Manager__c hm=new Hiring_Manager__c();
           hm.Name=hname;
           hm.Location_Name__c=hlocation;
           hm.Email_Address__c=haddress;
           hm.Designation__c=hdesignation;
           hm.Current_CTC__c=hctc;
           hm.Contact_Number__c=hnumber;
           insert hm;
    }

}