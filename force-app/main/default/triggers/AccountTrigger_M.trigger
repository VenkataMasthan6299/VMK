trigger AccountTrigger_M on Account (before insert, before update) {
    if(trigger.isBefore && (trigger.isinsert || trigger.isupdate)){
	   for(Account acc:trigger.new){
	       if(acc.industry=='Banking')
		  acc.AnnualRevenue=500000;
	       else if(acc.industry=='Finance')
		  acc.AnnualRevenue=400000;
	       else if(acc.industry=='Insurance')
		  acc.AnnualRevenue=350000;
	       else if(acc.industry=='HealthCare')
		  acc.AnnualRevenue=2500000;
	       else 
		  acc.AnnualRevenue=50000;
	  }
   }
}