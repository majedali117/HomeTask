@isTest
public class CaseControllerTest 
{
    @isTest
    static void testgetList() 
    {
        String recordId = '0035g000007nfIEAAY';
        List<Case> values = CaseController.getList(recordId);
        // Verify results
        System.assert(values != null); 
        // verify size of case list
        System.assertNotEquals(1, values.size());
        System.assertEquals(0, values.size());
    }
    
    @isTest
    static void testupdateRelatedList() 
    {
        String recordId = '0035g000007nfIEAAY';
        List<Case> values = CaseController.getList(recordId);
        CaseController.updateRelatedList(values);
    }
}
