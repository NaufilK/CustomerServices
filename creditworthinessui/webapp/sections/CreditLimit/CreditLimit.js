sap.ui.define(["sap/ui/core/library", 'sap/uxap/BlockBase'], function (coreLibrary, BlockBase) {
	"use strict";

	var ViewType = coreLibrary.mvc.ViewType;

	var HourConf = BlockBase.extend("customerReview.customerServiceUI.sections.CreditLimit.CreditLimit", {
		metadata: {
			views: {
				Collapsed: {
					viewName: "customerReview.customerServiceUI.sections.CreditLimit.CreditLimit",
					type: ViewType.XML
				},
				Expanded: {
					viewName: "customerReview.customerServiceUI.sections.CreditLimit.CreditLimit",
					type: ViewType.XML
				}
			}
		}
	});
	return HourConf;
});
