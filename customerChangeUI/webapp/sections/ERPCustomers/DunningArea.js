sap.ui.define(["sap/ui/core/library", 'sap/uxap/BlockBase'], function (coreLibrary, BlockBase) {
	"use strict";

	var ViewType = coreLibrary.mvc.ViewType;

	var HourConf = BlockBase.extend("customerChangeUI.sections.ERPCustomers.DunningArea", {
		metadata: {
			views: {
				Collapsed: {
					viewName: "customerChangeUI.sections.ERPCustomers.DunningArea",
					type: ViewType.XML
				},
				Expanded: {
					viewName: "customerChangeUI.sections.ERPCustomers.DunningArea",
					type: ViewType.XML
				}
			}
		}
	});
	return HourConf;
});
