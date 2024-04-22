global class AutocreatedRegHandler1710638135974 implements Auth.RegistrationHandler {
  global User createUser(Id portalId, Auth.UserData data) {
    Account userAccount = [
      SELECT id, name
      FROM Account
      WHERE name LIKE '%test'
    ];
    String delimiter = '@';
    Contact con = new Contact();
    con.accountId = userAccount.Id;
    con.email = data.email;
    con.lastName = data.email.substringBefore(delimiter);
    insert con;

    User u = new User();
    Profile p = [
      SELECT Id
      FROM profile
      WHERE name = 'Customer Community Plus User'
    ];
    //String delimiter = '@';
    u.ContactId = con.Id;
    u.username = data.email.substringBefore(delimiter) + '@salesforce.com';
    u.email = data.email;
    u.lastName = data.email.substringBefore(delimiter);
    String alias =
      data.email.substringBefore(delimiter) + 'spotifycommunityuser';
    if (alias.length() > 8) {
      alias = alias.substring(0, 8);
    }
    u.alias = alias;
    u.emailEncodingKey = 'UTF-8';
    u.TimeZoneSidKey = 'America/New_York';
    u.LocaleSidKey = 'en_US';
    u.LanguageLocaleKey = 'en_US';
    u.profileId = p.Id;
    return u;
  }

  global void updateUser(Id userId, Id portalId, Auth.UserData data) {
    
}
}