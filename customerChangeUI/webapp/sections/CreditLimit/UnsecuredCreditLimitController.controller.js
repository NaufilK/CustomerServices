sap.ui.define([
	"sap/ui/core/mvc/Controller",
    "customerChangeUI/formatter/formatter"
], function(
	Controller,
    formatter
) {
	"use strict";

	return Controller.extend("customerChangeUI.sections.CreditLimit.UnsecuredCreditLimitController", {
        formatter: formatter,
        onInit: function() {
        
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