sap.ui.define([
    "sap/ui/core/mvc/Controller",
],
    /**
     * @param {typeof sap.ui.core.mvc.Controller} Controller
     */
    function (Controller) {
        "use strict";

        return Controller.extend("customerReview.customerServiceUI.sections.CustomerBasicDetails.SiteDetailsController", {
            /**
             * @override
             */
            onInit: function() {
                // Controller.prototype.onInit.apply(this, arguments);
                if (!this.legalName) {
                    this.legalName = new sap.ui.xmlfragment("customerReview.customerServiceUI.fragments.LegalName", this);
                    this.getView().addDependent(this.legalName);
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
            },
            handleValueHelpForLegalName: function (evt) {
                this.legalNameField = evt.getSource();
                this.legalName.getBinding("items").filter([]);
                this.legalName.open();
            },
            handleValueHelpLegalNameClose: function (params) {
                this.legalName._dialog.close();
            },
            handleValueHelpLegalNameConfirm: function (evt) {
                var title = evt.getParameter("selectedItems")[0].getProperty("title");
                
                this.legalNameField.setValue(title);
            },
            handleValueHelpLegalNameSearch: function (evt) {
                var sValue = evt.getParameter("value");
                if (sValue.length > 0) {
                        var oFilter1 = new sap.ui.model.Filter("Name1", 'EQ', sValue);
                        this.legalName.getBinding("items").filter([oFilter1]);
                } 
            },
	});

});