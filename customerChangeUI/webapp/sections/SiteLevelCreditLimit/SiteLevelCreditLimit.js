sap.ui.define(["sap/ui/core/library", 'sap/uxap/BlockBase'], function (coreLibrary, BlockBase) {
	"use strict";

	var ViewType = coreLibrary.mvc.ViewType;

	var HourConf = BlockBase.extend("customerChangeUI.sections.SiteLevelCreditLimit.SiteLevelCreditLimit", {
		metadata: {
			views: {
				Collapsed: {
					viewName: "customerChangeUI.sections.SiteLevelCreditLimit.SiteLevelCreditLimit",
					type: ViewType.XML
				},
				Expanded: {
					viewName: "customerChangeUI.sections.SiteLevelCreditLimit.SiteLevelCreditLimit",
					type: ViewType.XML
				}
			}
		}
	});
	return HourConf;
});
