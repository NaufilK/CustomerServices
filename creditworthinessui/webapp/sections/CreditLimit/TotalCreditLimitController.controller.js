sap.ui.define([
	"sap/ui/core/mvc/Controller",
    "customerReview/customerServiceUI/formatter/formatter"
], function(
	Controller,
    formatter
) {
	"use strict";

	return Controller.extend("customerReview.customerServiceUI.sections.CreditLimit.TotalCreditLimitController", {
        formatter: formatter,
        onInit: function() {
            // Controller.prototype.onInit.apply(this, arguments);
            
        
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