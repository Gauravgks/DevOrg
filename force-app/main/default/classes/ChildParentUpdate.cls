public with sharing class ChildParentUpdate {
  // Contact trigger to check Title of each contact and update Account tickerSymbol field with ABC
  public static void updateParent(Map<Id, Contact> value) {
    Set<Id> accIds = new Set<Id>();
    accIds.add(value.values().AccountId);
    List<Contact> contacts = [
      SELECT Id, Title, Account.TickerSymbol
      FROM Contact
      WHERE AccountId IN :accIds
    ]; //NOPMD
    Account acc = [SELECT Id, TickerSymbol FROM Account WHERE Id = :accIds]; //NOPMD

    List<Contact> contactData = new List<Contact>();
    List<Account> finalList = new List<Account>();
    for (Contact contact : contacts) {
      if (
        contact.Title != null &&
        contact.Title != '' &&
        contact.Title == 'Hello'
      ) {
        contactData.add(contact);
      }
    }
    if (contactData.size() == contacts.size()) {
      acc.TickerSymbol = 'ABC';
      finalList.add(acc);
    } else {
      acc.TickerSymbol = '';
      finalList.add(acc);
    }

    if (finalList.size() != 0) {
      update finalList; //NOPMD
    }
  }
}
