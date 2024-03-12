public class RelatedContactList {
    public List<AccountWrapper> accWrapperList{get; set;}
    public List<Contact> selectedAccountList{get; set;}
    public RelatedContactList(){
        accWrapperList=new List<AccountWrapper>();
        List<Account> accList=[SELECT Id, Name, Industry, Phone,(SELECT Name, Phone, Email, Account.Name FROM Contacts) FROM Account LIMIT 10];
        for(Account a:accList){
            accWrapperList.add(new AccountWrapper(a));          
        }
    }
    public void getSelectedAccounts(){
       selectedAccountList=new List<Contact>();
       selectedAccountList.clear();
        system.debug('accWrapperList--->'+accWrapperList);
        for(AccountWrapper obj:accWrapperList){
        system.debug('obj.isSelected---->'+obj.isSelected); 
            if(obj.isSelected==true){
                for(Contact c:obj.acc.Contacts){
                 selectedAccountList.add(c);   
                }               
            } 
        }
    }
    
    //Wrapper Class
    public class AccountWrapper{
        public Account acc {get; set;}
        public Boolean isSelected {get; set;}
        
        public AccountWrapper(Account a){
            acc=a;
            isSelected=false;
        }
    }   
}