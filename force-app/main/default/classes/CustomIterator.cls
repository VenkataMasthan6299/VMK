public class CustomIterator implements Iterator<Account>{
	List<Account> accs;
    private integer CustomIndex;
    
    //Constructor
    public CustomIterator(List<Account> acclist){
        accs=acclist;
        CustomIndex=0;
    }
    public boolean hasnext(){
        return CustomIndex<accs.size();
    }
    public Account next(){
        if(hasnext()){
            return accs[CustomIndex++];
        }
        else{
            System.debug('Iterator has no more elements');
            return null;
        }
    }
}