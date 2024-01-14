public with sharing class AccountUtils {
    public AccountUtils() {

    }

    public static List<Account> accountsByState(String st){
        List<Account> acclist = [Select ID, name FROM
                                    Account WHERE
                                    billingState = :st];

        return acclist;
    }
}