sap.ui.define(["sap/ui/core/library", 'sap/uxap/BlockBase'], function (coreLibrary, BlockBase) {
	"use strict";

	var ViewType = coreLibrary.mvc.ViewType;

	var HourConf = BlockBase.extend("customerChangeUI.sections.SalesArea.PartnerFunctions", {
		metadata: {
			views: {
				Collapsed: {
					viewName: "customerChangeUI.sections.SalesArea.PartnerFunctions",
					type: ViewType.XML
				},
				Expanded: {
					viewName: "customerChangeUI.sections.SalesArea.PartnerFunctions",
					type: ViewType.XML
				}
			}
		}
	});
	return HourConf;
});
