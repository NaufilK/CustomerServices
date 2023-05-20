sap.ui.define([
	"sap/ui/core/mvc/Controller"
], function(
	Controller
) {
	"use strict";

	return Controller.extend("customerReview.customerServiceUI.sections.CustomerBasicDetails.IdentificationNumbersController", {
       //Validation of the date field Valid From
		handleStartDateChange: function (evt) {
			this.ExpStrtDate = evt.getSource();
			this.getView().byId("validFrom").setValue(this.ExpStrtDate.getValue());
			if (this.ExpEndDate) {
				if (this.ExpStrtDate.getValue() !== "" && this.ExpEndDate.getValue() !== "") {
					if (this.ExpStrtDate.getValue() > this.ExpEndDate.getValue()) {
						this.ExpStrtDate.setValueState("Error").setValueStateText("Start Date must be equal to or lesser than end date");
						this.ExpEndDate.setValueState("Error").setValueStateText("Start Date must be equal to or lesser than end date");
					} else {
						this.ExpStrtDate.setValueState("None").setValueStateText("");
						this.ExpEndDate.setValueState("None").setValueStateText("");
					}
				} else {
					this.ExpStrtDate.setValueState("None").setValueStateText("");
					this.ExpEndDate.setValueState("None").setValueStateText("");
				}
			} else {
				this.ExpStrtDate.setValueState("None").setValueStateText("");
			}
		},

		//Validation of the date field Valid To
		handleEndDateChange: function (evt) {
			this.ExpEndDate = evt.getSource();
			this.getView().byId("validTo").setValue(this.ExpEndDate.getValue());
			if (this.ExpStrtDate.getValue() !== "" && this.ExpEndDate.getValue() !== "") {
				//if (this.ExpStrtDate.getValue() > this.ExpEndDate.getValue()) {

				if (new Date(this.ExpStrtDate.getValue()) > new Date(this.ExpEndDate.getValue())) {
					this.ExpStrtDate.setValueState("Error").setValueStateText("Start Date must be equal to or lesser than end date");
					this.ExpEndDate.setValueState("Error").setValueStateText("Start Date must be equal to or lesser than end date");
				} else {
					this.ExpStrtDate.setValueState("None").setValueStateText("");
					this.ExpEndDate.setValueState("None").setValueStateText("");
				}
			} else {
				this.ExpStrtDate.setValueState("None").setValueStateText("");
				this.ExpEndDate.setValueState("None").setValueStateText("");
			}
		},
		onConfirm:function (evt) {
            // var oFormData = new FormData();
            this.getView().getModel("appView").setProperty("/dmsFile", new FormData());
            // var oFileUploader = evt.getSource();
            var id=evt.getSource().getId().split("Collapsed--")[1];
            // var oFile = oFileUploader.getFocusDomRef().files[0];
			var oFile = evt.getParameter("files")[0];
            var fileName = evt.getParameters().files[0].name;
            var dmsData = this.getView().getModel("dmsModel").getData();
            this.getView().getModel("appView").getProperty("/dmsFile").append("file", oFile);
            dmsData.push({
                file:this.getView().getModel("appView").getProperty("/dmsFile"),
                fileName: id+"_"+fileName
            });
              this.getView().getModel("dmsModel").updateBindings(true);
            this.firstTime=false;
        },
		handleSetMaxLength:function (evt) {
            var val = evt.getSource().getValue().length;
            var maxLen = evt.getSource().getMaxLength();
            if(val >= maxLen){
                evt.getSource().setType("Text");
            }else{
                evt.getSource().setType("Number");
            }
        },
		handleValidateVat: function (evt) {
			var gstinVal = evt.getSource().getValue();
			if (gstinVal !== "") {
				var reggst = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
				if (!reggst.test(gstinVal) && gstinVal != '') {
					sap.m.MessageBox.error('The Entered Vat Is Invalid.');
					evt.getSource().setValueState("Error").setValueStateText(
						"The Entered Vat Is Invalid.");
				} else
					evt.getSource().setValueState("None").setValueStateText("");
			} else evt.getSource().setValueState("None").setValueStateText("");
		}
	});
});