@IsTest
public with sharing class ContactChangeEventTriggerHelperTest {
    @IsTest
    static void validateChangeEventNotifications(){
        Test.enableChangeDataCapture();

        Contact con = new Contact(FirstName = 'Gaurav', LastName= 'Singh', Email = 'g.gaurav@salesforce.com');
        insert con;
        Test.getEventBus().deliver();
    }
}