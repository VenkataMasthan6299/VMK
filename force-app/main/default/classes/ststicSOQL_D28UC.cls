/*
 * @Description : This class used for Hiring Manager Records
 * @Author : SWAPNA IT
 * @Created by : 10-08-2023
 * @Last Modified date 
 */

public class ststicSOQL_D28UC {
    public static void staticMap(){
    Map<id,Case> caseMap=new Map<id,case>();
    List<Case> caseList=[Select id, status FROM Case];
    for(Case cs:caseList){
            caseMap.put(cs.id, cs);
            system.debug('in lookup caseMap : '+caseMap);
}
system.debug('caseMap : '+caseMap);
}
}