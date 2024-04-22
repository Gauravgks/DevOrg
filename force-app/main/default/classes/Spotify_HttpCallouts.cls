public class Spotify_HttpCallouts {

  @AuraEnabled(cacheable=true)
  public static String getUserDetail() {
    
    Http http = new Http();
    HttpRequest req = new HttpRequest();
    req.setEndpoint('callout:Spotify/v1/me');
    req.setMethod('GET');
    HttpResponse res = http.send(req);

    if (res.getStatusCode() == 200) {
      return res.getBody();
    }
    else{
      return NULL;
    }
  }
  @AuraEnabled(cacheable=true)
  public static String getDeviceDetails(){

    Http http = new Http();
    HttpRequest req = new HttpRequest();
    req.setEndpoint('callout:Spotify/v1/me/player/devices');
    req.setMethod('GET');
    HttpResponse res = http.send(req);

    if (res.getStatusCode() == 200) {
      return res.getBody();
    }
    else{
      return 'No Device';
    }

  }
}