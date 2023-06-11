sap.ui.define(["sap/ui/core/library", 'sap/uxap/BlockBase'], function (coreLibrary, BlockBase) {
	"use strict";

	var ViewType = coreLibrary.mvc.ViewType;

	var HourConf = BlockBase.extend("customerChangeUI.sections.ERPCustomers.Correspondence", {
		metadata: {
			views: {
				Collapsed: {
					viewName: "customerChangeUI.sections.ERPCustomers.Correspondence",
					type: ViewType.XML
				},
				Expanded: {
					viewName: "customerChangeUI.sections.ERPCustomers.Correspondence",
					type: ViewType.XML
				}
			}
		}
	});
	return HourConf;
});
