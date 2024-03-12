trigger Account2Trigger on Account (before insert, before update) {
    //if((trigger.isinsert || trigger.isupdate) && trigger.before){
        for(Account acc:trigger.new){
            if(acc.industry=='Banking'){
                acc.AnnualRevenue=500000;
            }
            else if(acc.industry=='Finance'){
                acc.AnnualRevenue=600000;
            }
            else if(acc.industry=='Insurance'){
                acc.AnnualRevenue=700000;
            }
            else if(acc.industry=='Healthcare'){
                acc.AnnualRevenue=800000;
            }
            else{
               acc.AnnualRevenue=900000; 
            }
        }
    }