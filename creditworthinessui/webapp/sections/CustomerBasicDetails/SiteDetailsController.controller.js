sap.ui.define([
    "sap/ui/core/mvc/Controller",
],
    /**
     * @param {typeof sap.ui.core.mvc.Controller} Controller
     */
    function (Controller) {
        "use strict";

        return Controller.extend("customerReview.creditworthinessui.sections.CustomerBasicDetails.SiteDetailsController", {
            /**
             * @override
             */
            onInit: function() {
                // Controller.prototype.onInit.apply(this, arguments);
                if (!this.legalName) {
                    this.legalName = new sap.ui.xmlfragment("customerReview.creditworthinessui.fragments.LegalName", this);
                    this.getView().addDependent(this.legalName);
                }
                if (!this.Authorization) {
                    this.Authorization = new sap.ui.xmlfragment("customerReview.creditworthinessui.fragments.AuthorizationGrp", this);
                    this.getView().addDependent(this.Authorization);
                }
                if (!this.entityType) {
                    this.entityType = new sap.ui.xmlfragment("customerReview.creditworthinessui.fragments.TypeOfEntity", this);
                    this.getView().addDependent(this.entityType);
                    this.entityType.setModel(this.getOwnerComponent().getModel());
                }
                
            
            },
            onAfterRendering: function () {
                // Controller.prototype.onAfterRendering.apply(this, arguments);
                var that = this;

                if (!this.customerInternalRating) {
                    this.customerInternalRating = new sap.ui.xmlfragment(
                      "customerReview.creditworthinessui.fragments.CustInterRating",
                      this
                    );
                    this.getView().addDependent(this.customerInternalRating);
                    this.customerInternalRating.setModel(this.getOwnerComponent().getModel());
                  }

                var entityVal = this.getView().byId("entityId").getValue();
                if (entityVal.length > 0) {
                    that.getView().getModel("appView").setProperty("/TypeOfEntity", entityVal);
                }

            },

            // Customer internal rating
        handleValueHelpForCustomerInternalRating: function (evt) {
            this.customerInternalRatingField = evt.getSource();
            
            this.customerInternalRating.open();
          },
          handleValueHelpCustInterRatingClose: function () {
            this.customerInternalRating._dialog.close();
          },
          handleValueHelpCustInterRatingConfirm: function (evt) {
            this.customerInternalRatingVal = evt
              .getParameter("selectedItems")[0]
              .getProperty("title");
            var desc = evt
              .getParameter("selectedItems")[0]
              .getProperty("description");
            this.customerInternalRatingField.setValue(this.customerInternalRatingVal);
          },
          handleValueHelpCustInterRatingSearch: function (evt) {
            var sValue = evt.getParameter("value");
            if (sValue.length > 0) {
              var oFilter1 = new sap.ui.model.Filter("class", "Contains", sValue);
              this.customerInternalRating.getBinding("items").filter([oFilter1]);
            } else {
              this.customerInternalRating.getBinding("items").filter([]);
            }
          },

            //Value Help for Type Of Entity
            handleValueHelpForEntityType: function (evt) {
                this.entityTypeField = evt.getSource();
                this.entityType.getBinding("items").filter([]);
                this.entityType.open();
            },
            handleValueHelpTypOfEntitySearch: function (evt) {
                var sValue = evt.getParameter("value");
                if (sValue.length > 0) {
                    var oFilter1 = new sap.ui.model.Filter("ztype_of_entity", 'EQ', sValue);
                    this.entityType.getBinding("items").filter([oFilter1]);
                } else {
                    this.entityType.getBinding("items").filter([]);
                }
            },
            handleValueHelpTypOfEntityConfirm: function (evt) {
                var that = this;
                var entityTypTitle = evt.getParameter("selectedItems")[0].getProperty("title");
                that.entityTypeField.setValue(entityTypTitle);
                that.getView().getModel("appView").setProperty("/TypeOfEntity", entityTypTitle);
                that.handleEntityCheckModel(evt);

            },
            //getService for type of entity to update fields
            handleEntityCheckModel: function (evt) {
                var that = this;
                var appView = that.getView().getModel("appView");
                var obj = {
                    "COOP": "Co-Operative (COOP)",
                    "Consort": "CONSORTIUM",
                    "Govt": "Government",
                    "Ltd_Liability_partnrshp": "Limited Liability Partnership",
                    "Other": "Other",
                    "Partnership": "Partnership",
                    "Prt_ltd_Comp": "Private Limited Company",
                    "Pub_ltd_Comp": "Public Limited Company",
                    "Sole_Proprietorship": "Sole Proprietorship"
                }
                that.getView().setModel(new sap.ui.model.json.JSONModel([obj]), "typOfEntityModel");
                that.getView().getModel("typOfEntityModel").updateBindings(true);
                var oModel = that.getView().getModel("typOfEntityModel").oData[0];
                var entityTypTitle = appView.oData.TypeOfEntity;
                if (entityTypTitle && entityTypTitle == oModel.COOP) {
                    appView.setProperty("/TypeOfEntity1", true);
                    appView.setProperty("/TypeOfEntity2", false);
                    appView.setProperty("/TypeOfEntity3", false);
                    appView.setProperty("/TypeOfEntity4", false);
                    appView.setProperty("/TypeOfEntity5", false);
                    appView.setProperty("/TypeOfEntity6", false);
                    appView.setProperty("/TypeOfEntity7", false);
                    appView.setProperty("/TypeOfEntity8", false);
                    appView.setProperty("/TypeOfEntity9", false);
                } else if (entityTypTitle && entityTypTitle == oModel.Consort) {
                    appView.setProperty("/TypeOfEntity1", false);
                    appView.setProperty("/TypeOfEntity2", true);
                    appView.setProperty("/TypeOfEntity3", false);
                    appView.setProperty("/TypeOfEntity4", false);
                    appView.setProperty("/TypeOfEntity5", false);
                    appView.setProperty("/TypeOfEntity6", false);
                    appView.setProperty("/TypeOfEntity7", false);
                    appView.setProperty("/TypeOfEntity8", false);
                    appView.setProperty("/TypeOfEntity9", false);
                } else if (entityTypTitle && entityTypTitle == oModel.Govt) {
                    appView.setProperty("/TypeOfEntity1", false);
                    appView.setProperty("/TypeOfEntity2", false);
                    appView.setProperty("/TypeOfEntity3", true);
                    appView.setProperty("/TypeOfEntity4", false);
                    appView.setProperty("/TypeOfEntity5", false);
                    appView.setProperty("/TypeOfEntity6", false);
                    appView.setProperty("/TypeOfEntity7", false);
                    appView.setProperty("/TypeOfEntity8", false);
                    appView.setProperty("/TypeOfEntity9", false);
                } else if (entityTypTitle && entityTypTitle == oModel.Ltd_Liability_partnrshp) {
                    appView.setProperty("/TypeOfEntity1", false);
                    appView.setProperty("/TypeOfEntity2", false);
                    appView.setProperty("/TypeOfEntity3", false);
                    appView.setProperty("/TypeOfEntity4", true);
                    appView.setProperty("/TypeOfEntity5", false);
                    appView.setProperty("/TypeOfEntity6", false);
                    appView.setProperty("/TypeOfEntity7", false);
                    appView.setProperty("/TypeOfEntity8", false);
                    appView.setProperty("/TypeOfEntity9", false);
                } else if (entityTypTitle && entityTypTitle == oModel.Other) {
                    appView.setProperty("/TypeOfEntity1", false);
                    appView.setProperty("/TypeOfEntity2", false);
                    appView.setProperty("/TypeOfEntity3", false);
                    appView.setProperty("/TypeOfEntity4", false);
                    appView.setProperty("/TypeOfEntity5", true);
                    appView.setProperty("/TypeOfEntity6", false);
                    appView.setProperty("/TypeOfEntity7", false);
                    appView.setProperty("/TypeOfEntity8", false);
                    appView.setProperty("/TypeOfEntity9", false);
                } else if (entityTypTitle && entityTypTitle == oModel.Partnership) {
                    appView.setProperty("/TypeOfEntity1", false);
                    appView.setProperty("/TypeOfEntity2", false);
                    appView.setProperty("/TypeOfEntity3", false);
                    appView.setProperty("/TypeOfEntity4", false);
                    appView.setProperty("/TypeOfEntity5", false);
                    appView.setProperty("/TypeOfEntity6", true);
                    appView.setProperty("/TypeOfEntity7", false);
                    appView.setProperty("/TypeOfEntity8", false);
                    appView.setProperty("/TypeOfEntity9", false);
                } else if (entityTypTitle && entityTypTitle == oModel.Prt_ltd_Comp) {
                    appView.setProperty("/TypeOfEntity1", false);
                    appView.setProperty("/TypeOfEntity2", false);
                    appView.setProperty("/TypeOfEntity3", false);
                    appView.setProperty("/TypeOfEntity4", false);
                    appView.setProperty("/TypeOfEntity5", false);
                    appView.setProperty("/TypeOfEntity6", false);
                    appView.setProperty("/TypeOfEntity7", true);
                    appView.setProperty("/TypeOfEntity8", false);
                    appView.setProperty("/TypeOfEntity9", false);
                } else if (entityTypTitle && entityTypTitle == oModel.Pub_ltd_Comp) {
                    appView.setProperty("/TypeOfEntity1", false);
                    appView.setProperty("/TypeOfEntity2", false);
                    appView.setProperty("/TypeOfEntity3", false);
                    appView.setProperty("/TypeOfEntity4", false);
                    appView.setProperty("/TypeOfEntity5", false);
                    appView.setProperty("/TypeOfEntity6", false);
                    appView.setProperty("/TypeOfEntity7", false);
                    appView.setProperty("/TypeOfEntity8", true);
                    appView.setProperty("/TypeOfEntity9", false);
                } else if (entityTypTitle && entityTypTitle == oModel.Sole_Proprietorship) {
                    appView.setProperty("/TypeOfEntity1", false);
                    appView.setProperty("/TypeOfEntity2", false);
                    appView.setProperty("/TypeOfEntity3", false);
                    appView.setProperty("/TypeOfEntity4", false);
                    appView.setProperty("/TypeOfEntity5", false);
                    appView.setProperty("/TypeOfEntity6", false);
                    appView.setProperty("/TypeOfEntity7", false);
                    appView.setProperty("/TypeOfEntity8", false);
                    appView.setProperty("/TypeOfEntity9", true);
                }
            },
            handleValueHelpTypOfEntityClose: function () {
                this.entityType.close();
            },
            onEntityConfirm: function (evt) {
                var val = this.getView().byId("entityId").getValue();
                this.getView().getModel("appView").setProperty("/TypeOfEntity", val);
            },
            handleDuplicateCheckForName: function (evt) {
                var that = this;
                var source = evt.getSource();
                                   
                    var oModel = this.getView().getModel();
           
                    var filters = [];
                    // filters.push(new sap.ui.model.Filter("zcustomer_legal_name", "EQ", evt.getSource()));
                    var sRequestURL = "/ZDD_CUSTOMER";
                    var customerName = evt.getSource().getValue();
                    filters.push(new sap.ui.model.Filter("zcustomer_legal_name", "EQ", customerName));
                    filters.push(new sap.ui.model.Filter("zbusiness_unit_name", "EQ", this.getView().getModel("Customers").getProperty("/zbusiness_unit_name")));

      // Add $select parameter to the request URL
                    // sRequestURL += "?$select=" + sSelectParams;
                    oModel.read(sRequestURL, {
                        filters:filters,
                        urlParameters: {
                            "$select": "zbusiness_unit_name,zcustomer_legal_name,zstatus"
                        },
                        success: function (data, response) {
                            if (data.results.length > 0) {
                                console.log(data);
                                source.setValueState("Error").setValueStateText("Same customer name exists. Please enter a diiferent customer name");
                                sap.m.MessageBox.error("Same customer name exists. Please enter a different customer name ");
                            } else {
                                source.setValueState("None").setValueStateText(" ");
                            }
                            // that.busyDialog.close();
                        },
                        error: function (err) {
                            // that.busyDialog.close();
                        }
                    });
                
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
            handleValueHelpForLegalName: function (evt) {
                this.legalNameField = evt.getSource();
                this.legalName.getBinding("items").filter([]);
                this.legalName.open();
            },
            handleValueHelpLegalNameClose: function (params) {
                this.legalName._dialog.close();
            },
            handleValueHelpLegalNameConfirm: function (evt) {
                var title = evt.getParameter("selectedItems")[0].getProperty("title");
                this.legalNameField.setValue(title);
            },
            handleValueHelpLegalNameSearch: function (evt) {
                var sValue = evt.getParameter("value");
                if (sValue.length > 0) {
                        var oFilter1 = new sap.ui.model.Filter("Name1", 'Contains', sValue);
                        this.legalName.getBinding("items").filter([oFilter1]);
                } 
            },

            //Value Help for Authorization
            handleValueHelpForAuthorization: function (evt) {
                this.authorField = evt.getSource();
                this.Authorization.getBinding("items").filter([]);
                this.Authorization.open();
            },
            handleValueHelpAuthrSearch: function (evt) {
               var sValue = evt.getParameter("value");
                var filters = [];
                if (sValue.length > 0) {
                    var filter1 = new sap.ui.model.Filter({
                        path: "Authori",
                        operator: "Contains",
                        value1: sValue
                    });
                    var filter2 = new sap.ui.model.Filter({
                        path: "Description",
                        operator: "Contains",
                        value1: sValue
                    });
                    var sFilters = [filter1, filter2];
                    filters.push(new sap.ui.model.Filter(sFilters, false));
                    this.Authorization.getBinding("items").filter(filters, false);
                } else {
                    this.Authorization.getBinding("items").filter([]);
                }
            },
            handleValueHelpAuthurClose: function (params) {
                this.Authorization.close();
            },
            handleValueHelpAuthurConfirm: function (evt) {
                var title = evt.getParameter("selectedItems")[0].getProperty("title");
                var desc = evt.getParameter("selectedItems")[0].getProperty("description");
                this.authorField.setValue(title + " - " + desc);
                this.Authorization.getBinding("items").filter([]);
                this.Authorization.close();
            }
	});

});