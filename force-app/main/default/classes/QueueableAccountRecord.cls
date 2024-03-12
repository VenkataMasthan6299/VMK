public class QueueableAccountRecord implements Queueable{
    public void Execute(QueueableContext qc){
        Account acc=new Account();
        acc.Name='Queueable';
        acc.Active__c='Yes';
        acc.Industry='Banking';
        acc.Rating='Hot';
        acc.Type='Prospect';
        acc.AnnualRevenue=6000000;
        acc.Phone='98762355';
        acc.Fax='38794827334';
        insert acc;
        if(acc!=null){
            ID contactsjobID=system.enqueuejob(acc);
        }
    }
}