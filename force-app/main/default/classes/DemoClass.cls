public with sharing class DemoClass {
    public DemoClass() {
        System.debug('Print');
    }
    public static void noSafeNav(){
        String accName = [Select id FROM Account LIMIT 1].Name;
        System.debug('No Safe Check'+ accName);
    }

    public static void safeNav(){
        String accName = [Select id FROM Account LIMIT 1]?.Name;
        System.debug('Safe Check'+ accName);
    }

}