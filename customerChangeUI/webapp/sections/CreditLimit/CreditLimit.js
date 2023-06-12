sap.ui.define(["sap/ui/core/library", 'sap/uxap/BlockBase'], function (coreLibrary, BlockBase) {
	"use strict";

	var ViewType = coreLibrary.mvc.ViewType;

	var HourConf = BlockBase.extend("customerChangeUI.sections.CreditLimit.CreditLimit", {
		metadata: {
			views: {
				Collapsed: {
					viewName: "customerChangeUI.sections.CreditLimit.CreditLimit",
					type: ViewType.XML
				},
				Expanded: {
					viewName: "customerChangeUI.sections.CreditLimit.CreditLimit",
					type: ViewType.XML
				}
			}
		}
	});
	return HourConf;
});
