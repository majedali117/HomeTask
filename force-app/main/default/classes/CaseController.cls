public with sharing class CaseController {
    // Case object property
    public Case cas {get;set;}

    // Constructor of Case Controller
    public CaseController() {
      try {
        string caseId =  ApexPages.currentPage().getParameters().get('id');
          if(caseId  != null)           
          cas = [select id, ContactId, Status, ProductId, Subject, Description from Case where id =: caseId ];
         else cas = new Case();
        } catch(DmlException e) {
          System.debug('The following exception has occurred: ' + e.getMessage());
      }
    }

    // Method to insert/update case record
    public PageReference save() {
      try {
		upsert cas;
        PageReference pref = new ApexPages.StandardController(cas).view();
		return pref;
  } catch(DmlException e) {
    System.debug('The following exception has occurred: ' + e.getMessage());
    return null;
}
	}

    // This method is used in aura component to populated list of cases based on contact id
    @AuraEnabled
    public static list<Case> getList(Id recordId)
    {
      try {
        List<Case> Caslist = [select id, ContactId, Status, Subject, Description, Home_Country__c, Product_Cost__c, Product_Name__c from Case where ContactId =: recordId ];
        return Caslist;
      } catch(DmlException e) {
        System.debug('The following exception has occurred: ' + e.getMessage());
        return null;
    }
  }
    // This method will updated cases list from aura component

    @AuraEnabled
    public static void updateRelatedList(List<Case> Caslist)
     {
      try {
          if(Caslist!= null && Caslist.size()>0)
          {
               update Caslist;
          }
        } catch(DmlException e) {
          System.debug('The following exception has occurred: ' + e.getMessage());
         } 
        }
}
