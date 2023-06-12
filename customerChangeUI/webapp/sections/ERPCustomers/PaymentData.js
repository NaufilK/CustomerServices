sap.ui.define(["sap/ui/core/library", 'sap/uxap/BlockBase'], function (coreLibrary, BlockBase) {
	"use strict";

	var ViewType = coreLibrary.mvc.ViewType;

	var HourConf = BlockBase.extend("customerChangeUI.sections.ERPCustomers.PaymentData", {
		metadata: {
			views: {
				Collapsed: {
					viewName: "customerChangeUI.sections.ERPCustomers.PaymentData",
					type: ViewType.XML
				},
				Expanded: {
					viewName: "customerChangeUI.sections.ERPCustomers.PaymentData",
					type: ViewType.XML
				}
			}
		}
	});
	return HourConf;
});
