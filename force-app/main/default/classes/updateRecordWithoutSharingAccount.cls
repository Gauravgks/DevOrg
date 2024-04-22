public without sharing class updateRecordWithoutSharingAccount {
  public updateRecordWithoutSharingAccount() {
    List<Account> accValue = [SELECT id, Name FROM Account LIMIT 5];
    List<Account> accValue1 = new List<Account>();
    for (Account acc : accValue) {
      acc.Name = 'Updated Without Sharing';
        accValue1.add(acc);
    }
    insert accValue1;
  }
  updateRecordWithoutSharing class1 = new updateRecordWithoutSharing();
}