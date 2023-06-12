sap.ui.define(["sap/ui/core/library", 'sap/uxap/BlockBase'], function (coreLibrary, BlockBase) {
	"use strict";

	var ViewType = coreLibrary.mvc.ViewType;

	var HourConf = BlockBase.extend("customerChangeUI.sections.CreditProfileSegmentData.HDL", {
		metadata: {
			views: {
				Collapsed: {
					viewName: "customerChangeUI.sections.CreditProfileSegmentData.HDL",
					type: ViewType.XML
				},
				Expanded: {
					viewName: "customerChangeUI.sections.CreditProfileSegmentData.HDL",
					type: ViewType.XML
				}
			}
		}
	});
	return HourConf;
});
