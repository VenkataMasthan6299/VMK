/*
 * @Description : This class used for Hiring Manager Records
 * @Author : SWAPNA IT
 * @Created by : 10-08-2023
 * @Last Modified date 
 */

public class CaseDynamic_D28HW {
     public static void dynamicMap(){
    Map<id,Case> caseMap=new Map<id,case>();
    List<Case> caseList=[Select id, status FROM Case];
    if(!caseList.isEmpty()) {          
    for(Case cs:caseList){
            caseMap.put(cs.id, cs);
            system.debug('in lookup caseMap : '+cs.status);        
            system.debug('caseMap : '+caseMap); 
}
}
}
}