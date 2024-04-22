global class SpotifyRegistrationHandler implements Auth.RegistrationHandler{//NOPMD
    
    global User createUser(Id portalId, Auth.UserData data){
        User userDet = [SELECT Id,Name,Email,Username FROM User WHERE Email = :data.email LIMIT 1];//NOPMD
        system.debug('User '+userDet);
        return userDet;
    }
    global void updateUser(Id userId, Id portalId, Auth.UserData data){
    system.debug('Data Value ' + data);
        User userDet = [SELECT Id,Name,Email,Username,Spotify_Login__c FROM User WHERE Email = :data.email LIMIT 1];//NOPMD
            userDet.Spotify_Login__c = TRUE;
        update userDet;
    }
}