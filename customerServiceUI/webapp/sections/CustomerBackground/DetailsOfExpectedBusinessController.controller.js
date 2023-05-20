sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "sap/m/MessageBox"
],
    /**
     * @param {typeof sap.ui.core.mvc.Controller} Controller
     */
    function (Controller, MessageBox) {
        "use strict";

        return Controller.extend("customerReview.customerServiceUI.sections.CustomerBackground.DetailsOfExpectedBusinessController", {
            /**
             * @override
             */
            onInit: function() {
                // Controller.prototype.onInit.apply(this, arguments);
                
                if (!this.Incoterms) {
                    this.Incoterms = new sap.ui.xmlfragment("customerReview.customerServiceUI.fragments.Incoterms", this);
                    this.getView().addDependent(this.Incoterms);
                    this.Incoterms.setModel(this.getOwnerComponent().getModel());
                }
            
            },
            handleValueHelpForIncoterms:function (evt) {
                this.IncotermsField = evt.getSource();
                this.Incoterms.getBinding("items").filter([]);
                this.Incoterms.open();
            },
            handleValueHelpIncotermsConfirm:function (evt) {
                var title = evt.getParameter("selectedItems")[0].getProperty("title");
                this.IncotermsField.setValue(title);
               
            },
            handleValueHelpIncotermsClose:function (evt) {
                this.Incoterms._dialog.close();
            },
            handleValueHelpIncotermsSearch: function (evt) {
                var sValue = evt.getParameter("value");
                if (sValue.length > 0) {
                        var oFilter1 = new sap.ui.model.Filter("Inco1", 'EQ', sValue);
                        this.Incoterms.getBinding("items").filter([oFilter1]);
                
                } else {
                    this.Incoterms.getBinding("items").filter([]);
                }
            },
            handleSetMaxLength:function (evt) {
                var val = evt.getSource().getValue().length;
                var maxLen = evt.getSource().getMaxLength();
                if(val >= maxLen){
                    evt.getSource().setType("Text");
                }else{
                    evt.getSource().setType("Number");
                }
            }
            
	});

});