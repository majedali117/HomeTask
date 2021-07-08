@isTest
public class ContactAPITest {
    @isTest static  void testdoGet() {
        Id recordId = 'contactid';
        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestUri = 'sfdc instance url /services/apexrest/Contact/' + recordId;
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        List<Case>  thisCase = ContactAPI.doGet();
        // Verify results
        System.assert(thisCase != null); 

        // verify size of case list
        System.assertNotEquals(1, thisCase.size());
        System.assertEquals(2, thisCase.size());
    } 
}