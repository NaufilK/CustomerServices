sap.ui.define(["sap/ui/core/library", 'sap/uxap/BlockBase'], function (coreLibrary, BlockBase) {
	"use strict";

	var ViewType = coreLibrary.mvc.ViewType;

	var HourConf = BlockBase.extend("customerChangeUI.sections.CustomerBasicDetails.SiteDetails", {
		metadata: {
			views: {
				Collapsed: {
					viewName: "customerChangeUI.sections.CustomerBasicDetails.SiteDetails",
					type: ViewType.XML
				},
				Expanded: {
					viewName: "customerChangeUI.sections.CustomerBasicDetails.SiteDetails",
					type: ViewType.XML
				}
			}
		}
	});
	return HourConf;
});
