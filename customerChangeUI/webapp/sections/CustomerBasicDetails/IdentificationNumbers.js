sap.ui.define(["sap/ui/core/library", 'sap/uxap/BlockBase'], function (coreLibrary, BlockBase) {
	"use strict";

	var ViewType = coreLibrary.mvc.ViewType;

	var HourConf = BlockBase.extend("customerChangeUI.sections.CustomerBasicDetails.IdentificationNumbers", {
		metadata: {
			views: {
				Collapsed: {
					viewName: "customerChangeUI.sections.CustomerBasicDetails.IdentificationNumbers",
					type: ViewType.XML
				},
				Expanded: {
					viewName: "customerChangeUI.sections.CustomerBasicDetails.IdentificationNumbers",
					type: ViewType.XML
				}
			}
		}
	});
	return HourConf;
});
