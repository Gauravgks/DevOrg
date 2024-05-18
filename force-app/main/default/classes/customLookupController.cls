public with sharing class customLookupController { //NOPMD
  @AuraEnabled(cacheable=true)
  public static List<SObject> searchRecords(String searchKey) {
    List<SObject> sObjectList = new List<SObject>();
    if (String.isNotEmpty(searchKey)) {
      String key = '%' + searchKey + '%';
      // Query to fetch Object name for the current user: It will query all the objects for which User have access too
      //Cannot use DescribeSObjectResult because I can't get records dynamically like operator on picklist
      String queryString = 'Select DeveloperName from EntityDefinition Where DeveloperName Like :key Order By DeveloperName Asc';
      sObjectList = Database.query(queryString, AccessLevel.USER_MODE); //NOPMD
    }
    return sObjectList;
  }

  @AuraEnabled(cacheable=true)
  public static List<customLookupWrapper> sendRecordDetails( //NOPMD
    String objectName,
    String size,
    String user,
    List<String> queryParameters
  ) {
    List<SObject> sObjectList = new List<SObject>();
    String soqlQueryList = String.join(queryParameters, ', ');
    //TODO: lazy loading/querylocator iterator => check if the query size is above 200 as UserRecordAccess obj have 200 limit
    // Query for all the records of the selected object : It will query for all the records for which User have access too
    String queryString =
      'Select ' +
      soqlQueryList +
      ' from ' +
      objectName +
      ' Order By CreatedDate Desc Limit ' +
      size;
    System.debug('queryString' + queryString);
    sObjectList = Database.query(queryString, AccessLevel.USER_MODE); //NOPMD
    /* Database.QueryLocatorIterator it = q.iterator();
    while (it.hasNext()) {
      sObjectList.add(it.next());
    }*/

    List<String> idForRecordAccessCheck = new List<String>();
    Map<Id, SObject> sobjectMap = new Map<Id, SObject>();
    for (SObject sobj : sObjectList) {
      String recordid = (String) sobj.get('id');
      idForRecordAccessCheck.add(recordid);

      sobjectMap.put(recordid, sobj);
    }

    List<UserRecordAccess> hasEditAccess = [
      SELECT RecordId, HasEditAccess
      FROM UserRecordAccess
      WHERE UserId = :user AND RecordId IN :idForRecordAccessCheck
    ];
    system.debug('hasEditAccess' + hasEditAccess);

    List<customLookupWrapper> combineValue = new List<customLookupWrapper>();
    for (UserRecordAccess hadEdit : hasEditAccess) {
      if (sobjectMap.containsKey(String.valueOf(hadEdit.get('RecordId')))) {
        customLookupWrapper wrapper = new customLookupWrapper();
        wrapper.obj = sobjectMap.get(String.valueOf(hadEdit.get('RecordId')));
        wrapper.hadEditAccess = hadEdit.HasEditAccess;
        combineValue.add(wrapper);
      }
    }
    System.debug('Wrapper Value' + combineValue);
    return combineValue;
  }

  @AuraEnabled(cacheable=true)
  public static List<String> getObjLabels(String objectName, String user) {
    List<String> sObjectDetailsList = new List<String>();
    //Get the schema describe for the object
    Schema.DescribeSObjectResult objDescribe = Schema.getGlobalDescribe()
      .get(objectName)
      .getDescribe();

    // Iterate over all fields and add them to the list
    for (Schema.SObjectField field : objDescribe.fields.getMap().values()) {
      Schema.DescribeFieldResult fieldDescribe = field.getDescribe();
      if (field.getDescribe().isAccessible()) {
        sObjectDetailsList.add((String.valueOf(fieldDescribe.getName())));
      }
    }

    return sObjectDetailsList;
  }

  public class customLookupWrapper { //NOPMD
    @AuraEnabled
    public SObject obj;
    @AuraEnabled
    public Boolean hadEditAccess;
  }
}
