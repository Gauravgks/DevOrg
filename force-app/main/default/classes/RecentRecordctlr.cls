public with sharing class RecentRecordctlr {
  
    @AuraEnabled(cacheable = true)
    public static List<Account> getRecentRecords(){
        try {
            String queryString = 'SELECT Id, Name, LastViewedDate FROM Account WHERE LastViewedDate != NULL ORDER BY LastViewedDate DESC LIMIT 10';
            return Database.query(queryString);//NOPMD
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}