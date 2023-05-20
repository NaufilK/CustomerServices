sap.ui.define([
    "sap/ui/core/mvc/Controller",
],
    /**
     * @param {typeof sap.ui.core.mvc.Controller} Controller
     */
    function (Controller) {
        "use strict";

        return Controller.extend("customerReview.customerServiceUI.sections.SalesArea.SalesOrderController", {
            /**
             * @override
             */
            onInit: function() {
                // Controller.prototype.onInit.apply(this, arguments);
                if (!this.Currency) {
                    this.Currency = new sap.ui.xmlfragment("customerReview.customerServiceUI.fragments.Currency", this);
                    this.getView().addDependent(this.Currency);
                }
            
            },
            handleValueHelpForCurrency: function (evt) {
                this.currencyField = evt.getSource();
                this.Currency.getBinding("items").filter([]);
                this.Currency.open();
            },
            handleValueHelpCurrencyClose: function (params) {
                this.Currency._dialog.close();
            },
            handleValueHelpCurrencyConfirm: function (evt) {
                var title = evt.getParameter("selectedItems")[0].getProperty("title");
            
                this.currencyField.setValue(title);
            },
            handleValueHelpCurrencySearch: function (evt) {
                var sValue = evt.getParameter("value");
                if (sValue.length > 0) {
                        var oFilter1 = new sap.ui.model.Filter("Waers", 'EQ', sValue);
                        this.Currency.getBinding("items").filter([oFilter1]);
                
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