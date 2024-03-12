Global class IterableBatch implements Database.Batchable<Account>{
    Global Iterable<Account> start(Database.BatchableContext bc){
        return new CustomIterable();
    }
    Global void Execute(Database.BatchableContext bc, List<Account> acclist){
        List<Account> accounts=new List<Account>();
        if(!acclist.isEmpty()){
            for(Account acc:acclist){
                acc.Name='Iterable Batch';
                acc.NumberOfEmployees=56;
                accounts.add(acc);
            }
            if(!accounts.isEmpty()){
                Database.Update(accounts,false);
            }
        }
    }
    Global void Finish(Database.BatchableContext bc){
        
    }
}