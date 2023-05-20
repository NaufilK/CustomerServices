sap.ui.define([
    "sap/ui/core/mvc/Controller",
],
    /**
     * @param {typeof sap.ui.core.mvc.Controller} Controller
     */
    function (Controller) {
        "use strict";

        return Controller.extend("customerReview.customerServiceUI.sections.CustomerBasicDetails.ProfileDetailsController", {
            /**
             * @override
             */
            onInit: function() {
                // Controller.prototype.onInit.apply(this, arguments);
                if (!this.Country) {
                    this.Country = new sap.ui.xmlfragment("customerReview.customerServiceUI.fragments.Country", this);
                    this.getView().addDependent(this.Country);
                }
            
            },
            handleValueHelpForCountry: function (evt) {
                this.countryField = evt.getSource();
                this.Country.getBinding("items").filter([]);
                this.Country.open();
            },
            handleValueHelpCountrClose: function (params) {
                this.Country._dialog.close();
            },
            handleValueHelpCountryConfirm: function (evt) {
                var title = evt.getParameter("selectedItems")[0].getProperty("title");
                var desc = evt.getParameter("selectedItems")[0].getProperty("description");
                this.countryField.setValue(title + " - " + desc);
            },
            handleValueHelpCountrySearch: function (evt) {
                var sValue = evt.getParameter("value");
                if (sValue.length > 0) {
                    if (sValue.length == 2) {
                        var oFilter1 = new sap.ui.model.Filter("Land1", 'EQ', sValue);
                        this.Country.getBinding("items").filter([oFilter1]);
                    } else {
                        var oFilter2 = new sap.ui.model.Filter("Landx", 'EQ', sValue);
                        this.Country.getBinding("items").filter([oFilter2]);
                    }
                    // this.Country.getBinding("items").filter([oFilter2]);
                } else {
                    this.Country.getBinding("items").filter([]);
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