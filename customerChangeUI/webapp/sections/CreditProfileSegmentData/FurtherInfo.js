sap.ui.define(["sap/ui/core/library", 'sap/uxap/BlockBase'], function (coreLibrary, BlockBase) {
	"use strict";

	var ViewType = coreLibrary.mvc.ViewType;

	var HourConf = BlockBase.extend("customerChangeUI.sections.CreditProfileSegmentData.FurtherInfo", {
		metadata: {
			views: {
				Collapsed: {
					viewName: "customerChangeUI.sections.CreditProfileSegmentData.FurtherInfo",
					type: ViewType.XML
				},
				Expanded: {
					viewName: "customerChangeUI.sections.CreditProfileSegmentData.FurtherInfo",
					type: ViewType.XML
				}
			}
		}
	});
	return HourConf;
});
