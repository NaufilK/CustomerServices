sap.ui.define(["sap/ui/core/library", 'sap/uxap/BlockBase'], function (coreLibrary, BlockBase) {
	"use strict";

	var ViewType = coreLibrary.mvc.ViewType;

	var HourConf = BlockBase.extend("customerReview.customerServiceUI.sections.CustomerBasicDetails.BusinessDetails", {
		metadata: {
			views: {
				Collapsed: {
					viewName: "customerReview.customerServiceUI.sections.CustomerBasicDetails.BusinessDetails",
					type: ViewType.XML
				},
				Expanded: {
					viewName: "customerReview.customerServiceUI.sections.CustomerBasicDetails.BusinessDetails",
					type: ViewType.XML
				}
			}
		}
	});
	return HourConf;
});
