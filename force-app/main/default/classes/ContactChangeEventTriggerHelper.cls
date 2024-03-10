public with sharing class ContactChangeEventTriggerHelper {
  
    public static void afterInsert(List<ContactChangeEvent> ContactChangeEventList){

        for(ContactChangeEvent event : ContactChangeEventList){
            System.debug('event =' + event);
            EventBus.ChangeEventHeader header = event.ChangeEventHeader;
            System.debug('eventHeader =' + header);

            if(header.changetype == 'CREATE'){
                //Create Task
            }

            else if(header.changetype == 'UPDATE'){
                for(String field: header.changedfields){
                    if(field == 'Email'){
                        // Create Task
                    }
                }
            }
        }
    }
}