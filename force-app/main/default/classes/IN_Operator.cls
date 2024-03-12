public class IN_Operator {
    public static void getContactIndustry(String IndustryName){
        if(IndustryName!=null && IndustryName!=''){
            Map<Id,Account> mA=new Map<Id,Account>([SELECT Id, Name, Industry FROM Account WHERE Industry=:IndustryName]);
            System.debug('Account Collection Size....:'+mA.size());
            if(!mA.keyset().isEmpty()){
                List<Contact> conList=[SELECT Id, Name, Email, Phone, Fax, AccountId FROM Contact
                                       WHERE AccountId IN:mA.keyset()];
                if(!conList.isEmpty()){
                    System.debug('Contact Collection size....:'+conList.size());
                    for(Contact con:conList){
                        System.debug('Contact Record....:'+con);
                    }
                }
            }
        }
    }
}