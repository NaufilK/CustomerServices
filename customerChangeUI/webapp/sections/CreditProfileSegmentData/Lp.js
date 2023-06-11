sap.ui.define(["sap/ui/core/library", 'sap/uxap/BlockBase'], function (coreLibrary, BlockBase) {
	"use strict";

	var ViewType = coreLibrary.mvc.ViewType;

	var HourConf = BlockBase.extend("customerChangeUI.sections.CreditProfileSegmentData.Lp", {
		metadata: {
			views: {
				Collapsed: {
					viewName: "customerChangeUI.sections.CreditProfileSegmentData.Lp",
					type: ViewType.XML
				},
				Expanded: {
					viewName: "customerChangeUI.sections.CreditProfileSegmentData.Lp",
					type: ViewType.XML
				}
			}
		}
	});
	return HourConf;
});
