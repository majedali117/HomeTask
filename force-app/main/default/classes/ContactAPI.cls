@RestResource(urlMapping='/Contact/*')
global with sharing class ContactAPI 
{  
    // http get method of the Contact REST API to retrieve a specific record
    @HttpGet
    global static List<Case> doGet() 
    {
        try 
        {
            String contactId = null;
            RestRequest req = RestContext.request;

            if (req != null)
            {
                contactId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
            }
            
            if(contactId != null)
            {
                List<Case> Caslist = [select id, ContactId, Status, ProductId, Subject, Description, Home_Country__c, Product_Name__c, Product_Cost__c  from Case where ContactId =: contactId ];
                return Caslist;
            }
            return null;
            
        }
        catch(DmlException e) 
        {
            return null;
        }
    }
}
