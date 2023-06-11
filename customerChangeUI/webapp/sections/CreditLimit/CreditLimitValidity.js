sap.ui.define(["sap/ui/core/library", 'sap/uxap/BlockBase'], function (coreLibrary, BlockBase) {
	"use strict";

	var ViewType = coreLibrary.mvc.ViewType;

	var HourConf = BlockBase.extend("customerChangeUI.sections.CreditLimit.CreditLimitValidity", {
		metadata: {
			views: {
				Collapsed: {
					viewName: "customerChangeUI.sections.CreditLimit.CreditLimitValidity",
					type: ViewType.XML
				},
				Expanded: {
					viewName: "customerChangeUI.sections.CreditLimit.CreditLimitValidity",
					type: ViewType.XML
				}
			}
		}
	});
	return HourConf;
});
