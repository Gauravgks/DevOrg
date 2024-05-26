trigger ContactTrigger on Contact(after insert, after update) { //NOPMD
  if (Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate)) {
    ChildParentUpdate.updateParent(Trigger.newMap);
  }
}
