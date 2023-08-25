sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "sap/m/MessageBox",
], function (
    Controller,
    MessageBox
) {
    "use strict";

    return Controller.extend("customerReview.creditworthinessui.sections.CustomerBasicDetails.InitiationDetailsController", {
        /**
         * @override
         */
        onInit: function () {
            // this.handleVerticalModel();
        },
        onAfterRendering: function (oEvent) {
            // var that = this;
            if (!this.businessUnit) {
                this.businessUnit = new sap.ui.xmlfragment("customerReview.creditworthinessui.fragments.BusinessUnit", this);
                this.getView().addDependent(this.businessUnit);
            }
            if (!this.vertical) {
                this.vertical = new sap.ui.xmlfragment("customerReview.creditworthinessui.fragments.Vertical", this);
                this.getView().addDependent(this.vertical);
                this.handleVerticalModel();
            }
        },
        handleVerticalModel: function (evt) {
            var oModel = this.getOwnerComponent().getModel();
            var that = this;

            var readPromise = new Promise(function (resolve, reject) {
                oModel.read("/ZDD_BU_VER_VH", {
                    success: function (oData, oResponse) {
                        resolve(oData.results);
                    },
                    error: function (oError) {
                        console.log(oError);
                        that.handleVerticalModel();
                    }
                });
            });

            readPromise.then(function (results) {
                var aCombinedData = [];
                var aUniqueCustomers = [];
                results.forEach(function (obj) {
                    if (!aUniqueCustomers.includes(obj.vertical)) {
                        aUniqueCustomers.push(obj.vertical);
                        aCombinedData.push(obj);
                    }
                });
                this.vertical.setModel(new sap.ui.model.json.JSONModel(aCombinedData), "VerticalModel");
                // Proceed with the next line of code here
            }.bind(this)).catch(function (error) {
                MessageBox.error(error);
            });
        },
        handleRuleEngineConfiguration: function (oEvent) {
            this.busyDialog = new sap.m.BusyDialog();
            this.busyDialog.open();
            // this.process = "CHANGE";
            if (this.process == "Create Customer") {
                this.process = "CREATE";
            } else if (this.process = "Change Customer") {
                this.process = "CHANGE";
            } else {
                this.process = "EXTEND";
            }
            // setTimeout(function () {
            //     busyDialog.close();
            // }, 5000);
            this.getView().getModel("appView").setProperty("/process", this.process);
            var sCustomerType = this.getView().getModel("appView").getProperty("/vertical") === 'Cash' ? 'CASH' : 'CREDIT';
            // var sCustomerType = this.getView().byId("orderData1").getAggregation("_views")[0].getContent()[0].getContent()[5].getSelectedButton().getText();
            // var sCustomerType = this.getView().byId("orderdata").getParent().getSubSections()[0].getBlocks()[0].getAggregation("_views")[0].getContent()[0].getContent()[5].getSelectedButton().getText();
            // var sBPGrouping = this.getView().byId("orderdata").getParent().getSubSections()[1].getBlocks()[0].getAggregation("_views")[0].getContent()[0].getContent()[1].getSelectedItem().getText();
            var sBPGrouping = this.getView().getModel("appView").getProperty("/bpg");
            this.ruleId = "";
            var aFilters = [];
            aFilters.push(new sap.ui.model.Filter("Process", "EQ", this.process));
            aFilters.push(new sap.ui.model.Filter("CustomerType", "EQ", sCustomerType));
            aFilters.push(new sap.ui.model.Filter("ZbusinessPartnerId", "EQ", sBPGrouping));
            if (this.process !== "" && sCustomerType !== "" && sBPGrouping !== "") {
                var oModel = this.getView().getModel("RuleEngine");

                // try {
                //     new Promise((resolve, reject) => {
                oModel.read("/ZDD_GET_RULE_Details", {
                    filters: aFilters,
                    urlParameters: {
                        "$top": 10000
                    },
                    success: function (oData, oResponse) {

                        var flatObj = {};
                        oData.results.forEach(function (obj, index) {
                            var sField = "";
                            var rField = "";

                            sField += obj.Fieldname.split(" ").join("");
                            rField += obj.Fieldname.split(" ").join("");

                            if (obj.Visibility) {
                                sField += "Visible";
                                if (!Object.keys(flatObj).includes(sField)) {
                                    if (obj.Visibility === "Y") {
                                        flatObj[sField] = true;
                                    } else {
                                        flatObj[sField] = false;
                                    }
                                } else {
                                    sField += obj.Customersub1.split(" ").join("");
                                    console.log(sField);
                                    // sField += obj.replace(":", "").split(" ").join("");
                                    if (obj.Visibility === "Y") {
                                        flatObj[sField] = true;
                                    } else {
                                        flatObj[sField] = false;
                                    }
                                }
                            }
                            if (obj.Mandatory) {
                                rField += "Mandatory";

                                if (!Object.keys(flatObj).includes(rField)) {
                                    if (obj.Mandatory === "Y") {
                                        flatObj[rField] = true;
                                    } else {
                                        flatObj[rField] = false;
                                    }
                                } else {
                                    rField += obj.Customersub1.split(" ").join("");
                                    if (obj.Mandatory === "Y") {
                                        flatObj[rField] = true;
                                    } else {
                                        flatObj[rField] = false;
                                    }
                                }

                            }
                        }.bind(this)),
                            console.log(flatObj);
                        this.getOwnerComponent().setModel(new sap.ui.model.json.JSONModel({}), "fieldMappingModels");
                        this.getView().getModel("fieldMappingModels").oData = flatObj;
                        this.getView().getModel("fieldMappingModels").updateBindings(true);
                        console.log(this.getView().getModel("fieldMappingModels").oData);
                        this.getOwnerComponent().getModel().refresh(true);
                        this.busyDialog.close();
                        // resolve()
                    }.bind(this),
                    error: function (oError) { }
                });
                // this.onClear();
                //     })
                // } catch (err) {

                // }
            }
            this.busyDialog.close();
        },
        // onRead: function (ruleid) {
        //     var oModel = this.getView().getModel("RuleEngine");
        //     // this.getView().setBusy(true);
        //     oModel.read("/ZDD_RULE_UPDATE_FIELDS", {
        //         filters: [new sap.ui.model.Filter("rule_id", "Contains", ruleid)],
        //         urlParameters: {
        //             "$top": 10000
        //         },

        //         success: function (oData, oResponse) {
        //             console.log(oData.results);
        //             var flatObj = {};
        //             oData.results.forEach(function (obj) {
        //                 var sField = "";
        //                 var rField = "";
        //                 sField += obj.fieldname.split(" ").join("");
        //                 rField += obj.fieldname.split(" ").join("");

        //                 if (obj.visibility) {
        //                     sField += "Visible";
        //                     if (obj.visibility === "Y") {
        //                         flatObj[sField] = true;
        //                     } else {
        //                         flatObj[sField] = false;
        //                     }
        //                 }
        //                 if (obj.mandatory) {
        //                     rField += "Mandatory";
        //                     if (obj.mandatory === "Y") {
        //                         flatObj[rField] = true;
        //                     } else {
        //                         flatObj[rField] = false;
        //                     }
        //                 }
        //             })
        //             console.log(flatObj);
        //             this.getView().setModel(new sap.ui.model.json.JSONModel({}), "fieldMappingModels");
        //             this.getView().getModel("fieldMappingModels").oData = flatObj;
        //             this.getView().getModel("fieldMappingModels").updateBindings(true);
        //             console.log(this.getView().getModel("fieldMappingModels").oData);

        //         }.bind(this),
        //         error: function (oError) {
        //             this.getView().setBusy(false);
        //         }.bind(this)
        //     });
        // },
        onDescriptionSelect: function (evt) {
            console.log("a");
            this.getView().getModel("appView").setProperty("/customerType", evt.getParameters().selectedIndex);
            this.handleRuleEngineConfiguration();

        },
        handleLiveChangeForCusReqRadioButtonYes: function (evt) {
            this.getView().getModel("appView").setProperty("/custType", evt.getSource().getText());
            this.getView().getModel("appView").updateBindings(true);

        },
        handleLiveChangeForCusReqRadioButtonNo: function (evt) {
            this.getView().getModel("appView").setProperty("/custType", evt.getSource().getText());
            this.getView().getModel("appView").updateBindings(true);
        },

        //Value Help for Business Unit
        handleValueHelpForBusinessUnit: function (evt) {
            this.businessUnitField = evt.getSource();
            this.bValue = evt.getSource().getValue();
            this.businessUnit.getBinding("items").filter([]);
            this.businessUnit.open();
        },
        handleValueHelpBusinessunitConfirm: function (evt) {
            this.businessUntVal = evt.getParameter("selectedItems")[0].getProperty("title");
            this.businessUnitField.setValue(this.businessUntVal);
            this.getView().getModel("Customers").setProperty("/zbusiness_unit_name", this.businessUntVal);
            if (this.getOwnerComponent().getModel("salesDataModel").getData().length !== 0) {
                var oModel = this.getOwnerComponent().getModel();
                oModel.read("/ZDD_BU_CC_VH", {
                    success: function (oData, oResponse) {
                        var bpRelData = [];
                        oData.results.forEach(function (obj) {
                            if (obj.Businessunit === this.businessUntVal) {
                                bpRelData.push(obj);
                            }
                        }.bind(this));
                        var bpValue = this.getOwnerComponent().getModel("salesDataModel").getData()
                        for (let m = 0; m < bpValue.length; m++) {
                            bpValue[m].zrelationship_to_bp = bpRelData[0].cc
                        }
                        this.getOwnerComponent().getModel("salesDataModel").updateBindings(true);
                    }.bind(this),

                    error: function (oError) { }

                });

            }

        },
        handleValueHelpBusinessunitClose: function () {
            this.businessUnit._dialog.close();
        },
        handleValueHelpBusinessUnitSearch: function (evt) {
            var sValue = evt.getParameter("value");
            if (sValue.length > 0) {
                var oFilter2 = new sap.ui.model.Filter("businessunit", 'Contains', sValue);
                this.businessUnit.getBinding("items").filter([oFilter2]);
            } else {
                this.businessUnit.getBinding("items").filter([]);
            }
        },

        //Value Help for vertical
        handleValueHelpForVertical: function (evt) {
            if (this.businessUntVal) {
                this.verticalField = evt.getSource();
                this.vertical.getBinding("items").filter([new sap.ui.model.Filter("Businessunit", "EQ", this.businessUntVal)]);
                this.vertical.open();
            } else {
                MessageBox.error("Please select Business Unit Field");
            }
        },
        handleValueHelpVerticalConfirm: function (evt) {
            this.verticalVal = evt.getParameter("selectedItems")[0].getProperty("title");
            this.verticalField.setValue(this.verticalVal);
            this.getView().getModel("appView").setProperty("/vertical", this.verticalVal);
            this.handleRuleEngineConfiguration();
        },
        handleValueHelpVerticalSearch: function (evt) {
            var sValue = evt.getParameter("value");
            var val = this.getView().byId("businessUnitId").getValue();
            var filters = [];
            if (sValue.length > 0) {
              var filter1 = new sap.ui.model.Filter({
                  path: "vertical",
                  operator: "Contains",
                  value1: sValue
              });

              var sFilters = [filter1];
              filters.push(new sap.ui.model.Filter(sFilters, false));
              if (val.length > 0) {
                  filters.push(new sap.ui.model.Filter("Businessunit", "EQ", val));
              }
              this.vertical.getBinding("items").filter(filters, true);
          } else {
              this.vertical.getBinding("items").filter([new sap.ui.model.Filter("Businessunit", "EQ", val)]);
          }


            // if (sValue.length > 0) {
            //     var oFilter2 = new sap.ui.model.Filter("vertical", 'Contains', sValue);
            //     this.vertical.getBinding("items").filter([oFilter2]);
            // } else {
            //     this.vertical.getBinding("items").filter([new sap.ui.model.Filter("Businessunit", "EQ", this.businessUntVal)]);
            // }
        },
        handleValueHelpVerticalClose: function () {
            this.vertical.close();
        }

    });
});