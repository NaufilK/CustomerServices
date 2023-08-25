sap.ui.define([
	"sap/ui/core/mvc/Controller"
], function(
	Controller
) {
	"use strict";

	return Controller.extend("customerReview.customerServiceUI.sections.CreditLimit.CreditLimit", {
        handleCreditLimitTypeSelect:function (evt) {
            console.log("h2");
        }
	});
});