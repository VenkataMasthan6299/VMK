@isTest
public class BulkLeadConvertTest {
        static testmethod void TestAutoLeadConversion(){
            //Create a Lead Record
            Lead ldrecord=new Lead();
            ldrecord.FirstName='Test';    
            ldrecord.LastName='Test Record';
            ldrecord.Company='Testing';
            ldrecord.Phone='45656788889';
            ldrecord.Fax='9087654';
            ldrecord.Rating='Hot';
            ldrecord.Industry='Banking';
            ldrecord.AnnualRevenue=800000000;
            ldrecord.Status='Open-Not Contacted';
            insert ldrecord;
            
            ldrecord.Status='Closed-Converted';
            update ldrecord;
    }
}