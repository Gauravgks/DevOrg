public with sharing class getChildRecords {
  @AuraEnabled(cacheable=true)
  public static List<Account> accountsById() {
    return [
      SELECT id,name, Industry, Rating
      FROM Account
    ];
  }
}
