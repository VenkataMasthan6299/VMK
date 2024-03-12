public class InsertDML {
    public static void insertDMLStatement(){
        
            List<Contact> conList=new List<Contact>();
            for(integer c=1;c<=10;c++){
                Contact con=new Contact();
                con.FirstName='Naveen -';
                con.LastName='Kumar'+c;
                con.Email='Naveen'+c+'@gmail.com';
                con.Title='Green Tech';
                con.Phone='870986756';
                con.Fax='88795465782987';
                conList.add(con);
        }
            if(!conList.isEmpty()){
                insert conList;
            }
        }
    }