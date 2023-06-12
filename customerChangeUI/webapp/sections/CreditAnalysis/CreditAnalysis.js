sap.ui.define(["sap/ui/core/library", 'sap/uxap/BlockBase'], function (coreLibrary, BlockBase) {
	"use strict";

	var ViewType = coreLibrary.mvc.ViewType;

	var HourConf = BlockBase.extend("customerChangeUI.sections.CreditAnalysis.CreditAnalysis", {
		metadata: {
			views: {
				Collapsed: {
					viewName: "customerChangeUI.sections.CreditAnalysis.CreditAnalysis",
					type: ViewType.XML
				},
				Expanded: {
					viewName: "customerChangeUI.sections.CreditAnalysis.CreditAnalysis",
					type: ViewType.XML
				}
			}
		}
	});
	return HourConf;
});
