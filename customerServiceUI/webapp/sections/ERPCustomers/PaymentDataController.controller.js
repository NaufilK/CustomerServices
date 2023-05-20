sap.ui.define([
	"sap/ui/core/mvc/Controller"
], function(
	Controller
) {
	"use strict";

	return Controller.extend("customerReview.customerServiceUI.sections.ERPCustomers.PaymentDataController", {
        /**
         * @override
         */
        onInit: function() {
            if (!this.paymentTerms) {
                this.paymentTerms = new sap.ui.xmlfragment("customerReview.customerServiceUI.fragments.PaymentTerms", this);
                this.getView().addDependent(this.paymentTerms);
            }
        },
        handleValueHelpForPaymentTerms:function (evt) {
            this.paymentTermsField = evt.getSource();
                this.paymentTerms.getBinding("items").filter([]);
                this.paymentTerms.open();
        },
        handleValueHelpPaymentTermsConfirm:function (evt) {
            var title = evt.getParameter("selectedItems")[0].getProperty("title");
                // var desc = evt.getParameter("selectedItems")[0].getProperty("description");
                this.paymentTermsField.setValue(title);
        },
        handleValueHelpPaymentTermsClose: function (params) {
            this.paymentTermsField._dialog.close();
        },
	});
});