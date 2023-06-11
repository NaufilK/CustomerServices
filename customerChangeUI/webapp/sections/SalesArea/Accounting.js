sap.ui.define(["sap/ui/core/library", 'sap/uxap/BlockBase'], function (coreLibrary, BlockBase) {
	"use strict";

	var ViewType = coreLibrary.mvc.ViewType;

	var HourConf = BlockBase.extend("customerChangeUI.sections.SalesArea.Accounting", {
		metadata: {
			views: {
				Collapsed: {
					viewName: "customerChangeUI.sections.SalesArea.Accounting",
					type: ViewType.XML
				},
				Expanded: {
					viewName: "customerChangeUI.sections.SalesArea.Accounting",
					type: ViewType.XML
				}
			}
		}
	});
	return HourConf;
});
