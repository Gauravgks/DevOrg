public with sharing class Case_Trigger_Handler extends TriggerHandler {
   
    public static void beforeInsert(List<Case> caseList){
        Case_Utility.updateCaseSubject(caseList);
    }
}