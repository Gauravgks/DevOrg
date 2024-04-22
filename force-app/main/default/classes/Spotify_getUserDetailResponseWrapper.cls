public class Spotify_getUserDetailResponseWrapper {
    
  @AuraEnabled
    public String country;
    @AuraEnabled
    public String display_name;
    @AuraEnabled
    public String email;
    @AuraEnabled
    public String href;
    @AuraEnabled
    public String id;
    @AuraEnabled
    public String product;
    @AuraEnabled
    public String type;
    @AuraEnabled
    public String uri;
    @AuraEnabled
    public List<Images> images;

    
    public class Images {
      
    @AuraEnabled  
		public String url;
		@AuraEnabled
    public Integer height;
		@AuraEnabled
    public Integer width;
	}
  
  @AuraEnabled
  public static Spotify_getUserDetailResponseWrapper parse(String json) {
    return (Spotify_getUserDetailResponseWrapper) System.JSON.deserialize(
      json,
      Spotify_getUserDetailResponseWrapper.class
    );
  }
}