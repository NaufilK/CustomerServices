sap.ui.define(["sap/ui/core/library", 'sap/uxap/BlockBase'], function (coreLibrary, BlockBase) {
	"use strict";

	var ViewType = coreLibrary.mvc.ViewType;

	var HourConf = BlockBase.extend("customerChangeUI.sections.CustomerBackground.CustomerBackground", {
		metadata: {
			views: {
				Collapsed: {
					viewName: "customerChangeUI.sections.CustomerBackground.CustomerBackground",
					type: ViewType.XML
				},
				Expanded: {
					viewName: "customerChangeUI.sections.CustomerBackground.CustomerBackground",
					type: ViewType.XML
				}
			}
		}
	});
	return HourConf;
});
