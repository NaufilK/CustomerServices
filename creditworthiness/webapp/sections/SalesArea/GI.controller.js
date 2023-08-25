sap.ui.define([
	"sap/ui/core/mvc/Controller"
], function(
	Controller
) {
	"use strict";

	return Controller.extend("customerReview.creditworthiness.sections.SalesArea.GI", {
        /**
         * @override
         */
        onInit: function() {
            Controller.prototype.onInit.apply(this, arguments);
            
        
        },
        handleAddSales: function (evt) {
            this.salesData.open();
        },
	});
});