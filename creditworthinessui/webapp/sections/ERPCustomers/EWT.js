sap.ui.define(["sap/ui/core/library", 'sap/uxap/BlockBase'], function (coreLibrary, BlockBase) {
	"use strict";

	var ViewType = coreLibrary.mvc.ViewType;

	var HourConf = BlockBase.extend("customerReview.customerServiceUI.sections.ERPCustomers.EWT", {
		metadata: {
			views: {
				Collapsed: {
					viewName: "customerReview.customerServiceUI.sections.ERPCustomers.EWT",
					type: ViewType.XML
				},
				Expanded: {
					viewName: "customerReview.customerServiceUI.sections.ERPCustomers.EWT",
					type: ViewType.XML
				}
			}
		}
	});
	return HourConf;
});
