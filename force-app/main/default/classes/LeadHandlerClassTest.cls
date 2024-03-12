@isTest
public class LeadHandlerClassTest {
    static testmethod void LeadTest(){
        List<Lead> Leads=new List<Lead>();
        for(integer c=1;c<=10;c++){
            Lead id=new Lead(FirstName='Anil', LastName='Kumar-'+c, Title='Manager', Company='HCL', State='Telangana', Phone='87566756', Fax='3467777777', Email='Anil@gmail.com', Industry='Banking', Status='Open-Not Contacted');
            Leads.add(id);
        }
        insert Leads;
        for(Lead ld:Leads){
            ld.Status='Closed-Converted';
        }
        Update Leads;
    }
}