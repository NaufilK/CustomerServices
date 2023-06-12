sap.ui.define(["sap/ui/core/library", 'sap/uxap/BlockBase'], function (coreLibrary, BlockBase) {
	"use strict";

	var ViewType = coreLibrary.mvc.ViewType;

	var HourConf = BlockBase.extend("customerChangeUI.sections.CustomerBasicDetails.InitiationDetails", {
		metadata: {
			views: {
				Collapsed: {
					viewName: "customerChangeUI.sections.CustomerBasicDetails.InitiationDetails",
					type: ViewType.XML
				},
				Expanded: {
					viewName: "customerChangeUI.sections.CustomerBasicDetails.InitiationDetails",
					type: ViewType.XML
				}
			}
		}
	});
	return HourConf;
});
