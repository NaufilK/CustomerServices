sap.ui.define(["sap/ui/core/library", 'sap/uxap/BlockBase'], function (coreLibrary, BlockBase) {
	"use strict";

	var ViewType = coreLibrary.mvc.ViewType;

	var HourConf = BlockBase.extend("customerChangeUI.sections.DetailsOfExpectedBusiness.DetailsOfExpectedBusiness", {
		metadata: {
			views: {
				Collapsed: {
					viewName: "customerChangeUI.sections.DetailsOfExpectedBusiness.DetailsOfExpectedBusiness",
					type: ViewType.XML
				},
				Expanded: {
					viewName: "customerChangeUI.sections.DetailsOfExpectedBusiness.DetailsOfExpectedBusiness",
					type: ViewType.XML
				}
			}
		}
	});
	return HourConf;
});
