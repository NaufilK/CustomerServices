sap.ui.define(["sap/ui/core/library", 'sap/uxap/BlockBase'], function (coreLibrary, BlockBase) {
	"use strict";

	var ViewType = coreLibrary.mvc.ViewType;

	var HourConf = BlockBase.extend("customerChangeUI.sections.ERPCustomers.PaymentNoticeTo", {
		metadata: {
			views: {
				Collapsed: {
					viewName: "customerChangeUI.sections.ERPCustomers.PaymentNoticeTo",
					type: ViewType.XML
				},
				Expanded: {
					viewName: "customerChangeUI.sections.ERPCustomers.PaymentNoticeTo",
					type: ViewType.XML
				}
			}
		}
	});
	return HourConf;
});
