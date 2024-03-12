public class Contact_Records_D31HW {
    public static void contactRecords(){
        List<Contact> conList=new List<Contact>();
        for(integer i=1; i<=50; i++){
            Contact con=new Contact();
            con.FirstName='Salesforce';
            con.LastName='Apex-'+i;
            con.Email='sales'+i+'@gmail.com';
            con.Industry__c='Salesforce';
            con.LeadSource='Web';
            con.Phone='63647688';
            conList.add(con);
        }       
    if(!conList.isEmpty())
    {
        insert conList;
    }
}
}