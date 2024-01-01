@RestResource(UrlMapping= '/executebatch/*')
global with sharing class Rest_CreateRecordAndCallBatch {
    
    @HttpGet
    global static List<Account> getAccount(){
        RestRequest req = RestContext.request;
        System.debug(req.params);
        //String.escapeSingleQuotes();
        List<Account> acc = [Select id, Name from Account];

        return acc;
    }

    @HttpPost
    global static String makeAccount(Account accData){
        Id batchJobId = Database.executeBatch(new Batch_CreateRecords(), 2000);


        return 'Batch Started';
    }
}