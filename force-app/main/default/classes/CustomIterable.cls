public class CustomIterable implements Iterable<Account>{
    public Iterator<Account> Iterator(){
        List<Account> accounts=[SELECT Id, Name, NumberOfEmployees FROM Account Limit 10];
        return new CustomIterator(accounts);
    }
}