@isTest
private class Spotify_HttpCalloutsTest {

    @isTest
    static void testGetUserDetail() {
        // Set up a mock HTTP response
        String mockResponse = '{"id": "test123", "name": "Test User"}';
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator(mockResponse));

        // Call the method under test
        String userDetails = Spotify_HttpCallouts.getUserDetail();

        // Verify the result
        System.assertEquals(mockResponse, userDetails, 'Expected response should match the mock response');
    }

    // Inner class to generate mock HTTP response
    private class MockHttpResponseGenerator implements HttpCalloutMock {
        private String mockResponse;

        MockHttpResponseGenerator(String mockResponse) {
            this.mockResponse = mockResponse;
        }

        public HTTPResponse respond(HTTPRequest req) {
            HttpResponse res = new HttpResponse();
            res.setHeader('Content-Type', 'application/json');
            res.setBody(mockResponse);
            res.setStatusCode(200);
            return res;
        }
    }
}