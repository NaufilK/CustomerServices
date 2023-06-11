sap.ui.define(["sap/ui/core/library", 'sap/uxap/BlockBase'], function (coreLibrary, BlockBase) {
	"use strict";

	var ViewType = coreLibrary.mvc.ViewType;

	var HourConf = BlockBase.extend("customerChangeUI.sections.ProposedCreditType.ProposedCreditType", {
		metadata: {
			views: {
				Collapsed: {
					viewName: "customerChangeUI.sections.ProposedCreditType.ProposedCreditType",
					type: ViewType.XML
				},
				Expanded: {
					viewName: "customerChangeUI.sections.ProposedCreditType.ProposedCreditType",
					type: ViewType.XML
				}
			}
		}
	});
	return HourConf;
});
