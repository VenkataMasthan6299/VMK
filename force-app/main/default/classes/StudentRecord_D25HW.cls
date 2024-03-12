public class StudentRecord_D25HW {
    public static void stdrecord(string sname, string sid, integer sphonenumber, string sbranch)
    {
        student__c std=new student__c();
           std.Name=sname;
           std.student_Id__c=sid;
           std.phone_number__c='sPhonenumber';
           std.Branch__c=sbranch; 
           insert std;
    }
}