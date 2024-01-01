public with sharing class Batch_CreateRecords implements Database.Batchable <SObject>{
    public database.Querylocator start(Database.BatchableContext info){ 
        return Database.getQueryLocator([Select id,Name from Account]); 
    }  

    public void execute(Database.BatchableContext info, List<SObject> scope){
        List<Account> acclist  = New List<Account>();
        For(integer i=0; i<= 1000; i++){
            Account a = New Account();
            a.Name = 'AccountByBatch' + i;
            acclist.add(a);
        }

        INSERT acclist;
    }

    public void finish(Database.BatchableContext info){
        System.debug('Finish');
    }
}