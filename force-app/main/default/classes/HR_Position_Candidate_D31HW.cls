public class HR_Position_Candidate_D31HW {
      public static void HiringManagerRecords(){
        List<Hiring_Manager__c> hrList=new List<Hiring_Manager__c>();
            Hiring_Manager__c hr=new Hiring_Manager__c();
            hr.Name='Venkat';
            hr.Location_Name__c='Banglore';
            hrList.add(hr);
           if(!hrList.isEmpty())
           {
              insert hrList;
           }
          
          List<Position__c> posList=new List<Position__c>();           
            for(integer i=1; i<=5; i++){
               Position__c pos=new Position__c();
               pos.Name='Sanju';
               pos.Location__c='Hyderabad';
               pos.Position_Status__c='New';
               pos.Position_Designation__c='CEO';
               pos.Phone_Number__c='78567467';
               pos.Text_One__c='I am CEO';
               posList.add(pos);               
            }
             if(!posList.isEmpty())
             {
                insert posList;
             } 
          
            List<Candidate__c> canList=new List<Candidate__c>();           
            for(integer j=1; j<=2; j++){
               Candidate__c can=new Candidate__c();
               can.Name='Sri';
               can.Qualification__c='B.Tech';               
               canList.add(can); 
            }
             if(!canList.isEmpty())
             {
                insert canList;
             } 
   }
}