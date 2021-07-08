({
    myAction : function(component, event, helper) 
       {
        component.set('v.columns', [
            {label: 'Subject', fieldName: 'Subject', type: 'text', editable: true },
            {label: 'Status', fieldName: 'Status', type: 'text', editable: true },
            {label: 'Home Country', fieldName: 'Home_Country__c', type: 'text', editable: true },
            {label: 'Product Name', fieldName: 'Product_Name__c', type: 'text', editable: true },
            {label: 'Product Cost', fieldName: 'Product_Cost__c', type: 'text', editable: true }
         ]);

           var CasList = component.get("c.getList");
           CasList.setParams
           ({
               recordId: component.get("v.recordId")
           });
           
           CasList.setCallback(this, function(data) 
                              {
                                  component.set("v.CaseList", data.getReturnValue());
                              });
           $A.enqueueAction(CasList);
    },
    SaveUpdatedCases : function(component,event,helper) 
    {
        var UpdatedList = event.getParam('draftValues');        
        var UpdateCases = component.get("c.updateRelatedList");
        
        UpdateCases.setParams
        ({
            Caslist : UpdatedList
        });
        UpdateCases.setCallback(this, function(response) 
                           {
                                var state = response.getState();
                                if (state === 'SUCCESS')
                                {
                                     $A.enqueueAction(component.get('c.myAction'));
      $A.get('e.force:refreshView').fire();
                                }
                                else{
                                     //error handling
                                }
                           });
        $A.enqueueAction(UpdateCases);
    }
   })
