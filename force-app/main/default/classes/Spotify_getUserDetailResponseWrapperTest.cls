@IsTest
public class Spotify_getUserDetailResponseWrapperTest {

    @IsTest
    static void testParse() {
        String json =
            '{' +
            '  \"country\": \"string\",' +
            '  \"display_name\": \"string\",' +
            '  \"email\": \"string\",' +
            '  \"explicit_content\": {' +
            '    \"filter_enabled\": false,' +
            '    \"filter_locked\": false' +
            '  },' +
            '  \"external_urls\": {' +
            '    \"spotify\": \"string\"' +
            '  },' +
            '  \"followers\": {' +
            '    \"href\": \"string\",' +
            '    \"total\": 0' +
            '  },' +
            '  \"href\": \"string\",' +
            '  \"id\": \"string\",' +
            '  \"images\": [' +
            '    {' +
            '      \"url\": \"https://i.scdn.co/image/ab67616d00001e02ff9ca10b55ce82ae553c8228\",' +
            '      \"height\": 300,' +
            '      \"width\": 300' +
            '    }' +
            '  ],' +
            '  \"product\": \"string\",' +
            '  \"type\": \"string\",' +
            '  \"uri\": \"string\"' +
            '}';
            
        // Call the parse method of the wrapper class
        Spotify_getUserDetailResponseWrapper responseData = Spotify_getUserDetailResponseWrapper.parse(json);
        
        // Add your assertions here based on the expected values in the JSON string and the actual values in the responseData object.
        System.assertNotEquals(null, responseData); // For example, to ensure that responseData is not null
    }
}