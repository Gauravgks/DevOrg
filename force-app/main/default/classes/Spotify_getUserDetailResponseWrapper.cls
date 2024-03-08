public class Spotify_getUserDetailResponseWrapper {

    public String country;
    public String display_name;
    public String email;
    public String href;
    public String id;
    public String product;
    public String type;
    public String uri;
  

  public static Spotify_getUserDetailResponseWrapper parse(String json) {
    return (Spotify_getUserDetailResponseWrapper) System.JSON.deserialize(
      json,
      Spotify_getUserDetailResponseWrapper.class
    );
  }
}
