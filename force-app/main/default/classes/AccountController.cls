public with sharing class AccountController {
	// Account object property
	public Account account{get; set;}
  
	// Constructor of Account Controller
	public AccountController(){
		account = new Account();
	}
	
	// Method to insert/update account records
	public void save(){
		try {
		upsert account;
	} catch(DmlException e) {
		System.debug('The following exception has occurred: ' + e.getMessage());
	}
	}
}