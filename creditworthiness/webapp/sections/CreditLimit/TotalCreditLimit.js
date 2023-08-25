sap.ui.define(["sap/ui/core/library", 'sap/uxap/BlockBase'], function (coreLibrary, BlockBase) {
	"use strict";

	var ViewType = coreLibrary.mvc.ViewType;

	var HourConf = BlockBase.extend("customerReview.creditworthiness.sections.CreditLimit.TotalCreditLimit", {
		metadata: {
			views: {
				Collapsed: {
					viewName: "customerReview.creditworthiness.sections.CreditLimit.TotalCreditLimit",
					type: ViewType.XML
				},
				Expanded: {
					viewName: "customerReview.creditworthiness.sections.CreditLimit.TotalCreditLimit",
					type: ViewType.XML
				}
			}
		}
	});
	return HourConf;
});
