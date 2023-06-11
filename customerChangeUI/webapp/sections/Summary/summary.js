sap.ui.define(["sap/ui/core/library", 'sap/uxap/BlockBase'], function (coreLibrary, BlockBase) {
	"use strict";

	var ViewType = coreLibrary.mvc.ViewType;

	var HourConf = BlockBase.extend("customerChangeUI.sections.Summary.summary", {
		metadata: {
			views: {
				Collapsed: {
					viewName: "customerChangeUI.sections.Summary.summary",
					type: ViewType.XML
				},
				Expanded: {
					viewName: "customerChangeUI.sections.Summary.summary",
					type: ViewType.XML
				}
			}
		}
	});
	return HourConf;
});
