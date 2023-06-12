sap.ui.define(["sap/ui/core/library", 'sap/uxap/BlockBase'], function (coreLibrary, BlockBase) {
	"use strict";

	var ViewType = coreLibrary.mvc.ViewType;

	var HourConf = BlockBase.extend("customerChangeUI.sections.Comments.Comments", {
		metadata: {
			views: {
				Collapsed: {
					viewName: "customerChangeUI.sections.Comments.Comments",
					type: ViewType.XML
				},
				Expanded: {
					viewName: "customerChangeUI.sections.Comments.Comments",
					type: ViewType.XML
				}
			}
		}
	});
	return HourConf;
});
