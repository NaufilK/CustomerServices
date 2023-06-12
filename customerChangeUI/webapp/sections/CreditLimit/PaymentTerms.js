sap.ui.define(["sap/ui/core/library", 'sap/uxap/BlockBase'], function (coreLibrary, BlockBase) {
	"use strict";

	var ViewType = coreLibrary.mvc.ViewType;

	var HourConf = BlockBase.extend("customerChangeUI.sections.CreditLimit.PaymentTerms", {
		metadata: {
			views: {
				Collapsed: {
					viewName: "customerChangeUI.sections.CreditLimit.PaymentTerms",
					type: ViewType.XML
				},
				Expanded: {
					viewName: "customerChangeUI.sections.CreditLimit.PaymentTerms",
					type: ViewType.XML
				}
			}
		}
	});
	return HourConf;
});
