sap.ui.define([
	"sap/ui/core/mvc/Controller"
], function(
	Controller
) {
	"use strict";

	return Controller.extend("customerChangeUI.sections.CreditLimit.CreditLimitController", {
        handleCreditLimitTypeSelect:function (evt) {
            console.log("h2");
        }
	});
});