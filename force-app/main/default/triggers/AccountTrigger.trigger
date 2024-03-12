trigger AccountTrigger on Account (before insert, before update, before delete, after update, after insert) {
       /* string UN=userInfo.getFirstName();
        if(UN!='Venkata Masthan'){*/
    
    //Map<string,TriggerAccess__c> taccess=TriggerAccess__c.getAll();
    //if(taccess.get('AccountTrigger').checkBox__c){
    
        if(Trigger.isbefore && (Trigger.isinsert || Trigger.isupdate)){
            for(Account acc:Trigger.new){
                if(acc.Industry==null||acc.Industry=='-'||string.isEmpty(acc.Industry)){
                    acc.AddError('Please Select Industry Value');
                }
                else  if(acc.Fax==null||acc.Fax=='-'||string.isEmpty(acc.Fax)){
                    acc.AddError('Please Select Fax Value');
                }
                else if(acc.Website==null||acc.Website=='-'||string.isEmpty(acc.Website)){
                    acc.AddError('Please Select Website Value');
                }
            }
        }
     
    
    if(Trigger.isafter && Trigger.isupdate){
        List<Account> accList=new List<Account>();
        for(Account acc:Trigger.new){
            if(acc.Location__c!=Trigger.oldMap.get(acc.Id).Location__c){
                Account a=new Account();
                a.Id=acc.Id;
                a.Address__c=Address_Location__mdt.getInstance(acc.Location__c).Office_Address__c;
                accList.add(a);
            }
        }
        if(!accList.isEmpty()){
            update accList;
        }
    }

           if(Trigger.isbefore && Trigger.isdelete){
               for(Account acc:Trigger.old){
                   if(acc.Active__c=='Yes'){
                       acc.AddError('You are not Authorized to delete the Active Account');
                   }
               }
               List<Contact> contactList=[SELECT Id, AccountId FROM Contact Where accountId IN:Trigger.oldMap.keyset()];
               if(!contactList.isEmpty()){
                   for(contact con:contactList){
                       con.AccountId=null;
                   }
                   update contactList;
               }
           }
    
    
    if(Trigger.isafter && Trigger.isinsert){
        ShareAccountHandler.AfterInsert(Trigger.New);
    }
    
       }