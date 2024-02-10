public with sharing class Case_Utility {
   

    //private static final String handlerName = 'Case_Trigger_Handler';

    public static void updateCaseSubject(List<Case> caseList){

        for (Case cs : caseList) {
            cs.Subject = 'Trigger create subject';
        }
    }

    public static void createCase(){
        //TriggerHandler.bypass(handlerName);

        Case newCase = new Case();
        newCase.Subject = 'Subject after bypassing the Trigger';
        insert newCase;

        //TriggerHandler.clearAllBypasses(handlerName);
    }
}