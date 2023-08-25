sap.ui.define(["sap/ui/core/library", 'sap/uxap/BlockBase'], function (coreLibrary, BlockBase) {
	"use strict";

	var ViewType = coreLibrary.mvc.ViewType;

	var HourConf = BlockBase.extend("customerReview.customerServiceUI.sections.CreditProfileSegmentData.HDL", {
		metadata: {
			views: {
				Collapsed: {
					viewName: "customerReview.customerServiceUI.sections.CreditProfileSegmentData.HDL",
					type: ViewType.XML
				},
				Expanded: {
					viewName: "customerReview.customerServiceUI.sections.CreditProfileSegmentData.HDL",
					type: ViewType.XML
				}
			}
		}
	});
	return HourConf;
});
