sap.ui.define(["sap/ui/core/library", 'sap/uxap/BlockBase'], function (coreLibrary, BlockBase) {
	"use strict";

	var ViewType = coreLibrary.mvc.ViewType;

	var HourConf = BlockBase.extend("customerChangeUI.sections.CreditLimit.TotalCreditLimit", {
		metadata: {
			views: {
				Collapsed: {
					viewName: "customerChangeUI.sections.CreditLimit.TotalCreditLimit",
					type: ViewType.XML
				},
				Expanded: {
					viewName: "customerChangeUI.sections.CreditLimit.TotalCreditLimit",
					type: ViewType.XML
				}
			}
		}
	});
	return HourConf;
});
