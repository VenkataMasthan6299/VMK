trigger Account1Trigger on Account (before insert) {
    if(trigger.isinsert && trigger.isbefore){
        for(Account acc:trigger.new){
            if(acc.rating=='Hot'){                
            }
        }
    }
}