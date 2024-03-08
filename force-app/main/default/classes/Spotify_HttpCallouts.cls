public class Spotify_HttpCallouts {
  public void getUserDetail() {
    List<String> userList = new List<String>();

    Http http = new Http();
    HttpRequest req = new HttpRequest();
    req.setEndpoint('callout:Spotify/v1/me');
    req.setMethod('GET');
    HttpResponse res = http.send(req);

    if (res.getStatusCode() == 200) {
      Spotify_getUserDetailResponseWrapper userResponse = Spotify_getUserDetailResponseWrapper.parse(
        res.getBody()
      );

      userList.add(userResponse.country);
      userList.add(userResponse.display_name);
      userList.add(userResponse.email);
      userList.add(userResponse.href);
      userList.add(userResponse.id);
      userList.add(userResponse.product);
      userList.add(userResponse.type);
      userList.add(userResponse.uri);
    }
  }
}
