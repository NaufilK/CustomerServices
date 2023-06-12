sap.ui.define(["sap/ui/core/library", 'sap/uxap/BlockBase'], function (coreLibrary, BlockBase) {
	"use strict";

	var ViewType = coreLibrary.mvc.ViewType;

	var HourConf = BlockBase.extend("customerChangeUI.sections.Comments.Attachments", {
		metadata: {
			views: {
				Collapsed: {
					viewName: "customerChangeUI.sections.Comments.Attachments",
					type: ViewType.XML
				},
				Expanded: {
					viewName: "customerChangeUI.sections.Comments.Attachments",
					type: ViewType.XML
				}
			}
		}
	});
	return HourConf;
});
