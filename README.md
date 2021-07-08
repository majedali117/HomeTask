# Salesforce Home Task for Majed Ali

There are two parts of the task as follows
- Create an Aura component to show case list on Contact Page.
- Create REST API for get contact related records.

## Aura Component for Lightning experience

- This Code can be located under  `force-app/main/default/aura/CaseList/`

## REST API to get contact related cases

This Code can be located under `force-app/main/default/classes/`
Here we have two apex classes for both tasks.
- CaseController is used in aura component to load and update case list.
- ContactAPI class is used to expose REST endpoints for other systems to get contact related records.

## How to Run REST API

- Get any contact id from Salesforce to test.
- Get Session id in VS Code terminal with `sfdx force:org:display`
- Run Following code to get json response.
`curl -H "Authorization: Bearer <Session Token>" "<Salesforce Org Link>/services/apexrest/Contact/<contactid>"`
