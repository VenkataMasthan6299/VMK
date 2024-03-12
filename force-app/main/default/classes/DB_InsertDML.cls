public class DB_InsertDML {
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
                Database.SaveResult[] result=Database.Insert(conList,false);
                for(Database.SaveResult res:result){
                    if(res.isSuccess()){
                        System.debug('Record has been inserted Successfully. Record Id is...:'+res.GetID());
                    }
                    else{
                        for(Database.Error err:res.GetErrors()){
                            System.debug('Error Message....:'+err.GetMessage());
                            System.debug('Get Status Code....:'+err.GetStatusCode());
                            System.debug('Effected Fields....:'+err.GetFields());
                        }
                    }
                }
            }
        }
}