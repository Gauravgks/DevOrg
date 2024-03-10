trigger OrderDetailEventTrigger on Order_Detail__e (after insert) {
    List<Task> tasks = new List<Task>();
    for(Order_Detail__e event: Trigger.new){
        if(event.Order_Number__c != Null){
            Task task = new Task();
            task.Priority = 'Medium';
            task.Subject = 'Task created by Platform Event subscription with Order Number ' + event.Order_Number__c;
            task.OwnerId = event.CreatedById;
            tasks.add(task);
        }
    }
    insert tasks;

}