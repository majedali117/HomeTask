public with sharing class ProductController {

    // Product object property
    public product2 product {get; set;}

    // Constructor of Product Controller
	public ProductController() {
        try{
        string prodId =  ApexPages.currentPage().getParameters().get('id');
          if(prodId  != null)           
          product = [select id, ProductCode, Family, Name, Product_Type__c, Product_Cost__c from product2 where id =: prodId ];
         else product = new product2();

        } catch(DmlException e) {
            System.debug('The following exception has occurred: ' + e.getMessage());
        }
        
	}
	
    // Method to insert/update Product record
	public PageReference save() {
        try {
		upsert product;
        PageReference pref = new ApexPages.StandardController(product).view();
		return pref;
    } catch(DmlException e) {
        System.debug('The following exception has occurred: ' + e.getMessage());
        return null;
    }
	}
}
