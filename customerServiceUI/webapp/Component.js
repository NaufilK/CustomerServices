sap.ui.define(
  [
    "sap/ui/core/UIComponent",
    "sap/ui/Device",
    "customerReview/customerServiceUI/model/models",
    "sap/ui/model/json/JSONModel",
    "sap/m/MessageBox"
  ],
  function (UIComponent, Device, models, JSONModel, MessageBox) {
    "use strict";

    var oComponent;

    return UIComponent.extend(
      "customerReview.customerServiceUI.Component",
      {
        metadata: {
          manifest: "json",
        },

        /**
         * The component is initialized by UI5 automatically during the startup of the app and calls the init method once.
         * @public
         * @override
         */
        init: function () {
          oComponent = this;
          // call the base component's init function
          UIComponent.prototype.init.apply(this, arguments);

          // set the device model
          this.setModel(models.createDeviceModel(), "device");

          this.setModel(models.createAppModel(), "Customers");
          this.setModel(models.createMasterDataModel(), "MasterData");

          this.setTaskModels();

          this.getInboxAPI().addAction(
            {
              action: "approve",
              label: "Approve",
              type: "accept", // (Optional property) Define for positive appearance
            },
            function () {
              this.completeTask("approve");
            },
            this
          );

          this.getInboxAPI().addAction(
            {
              action: "reject",
              label: "Reject",
              type: "reject", // (Optional property) Define for negative appearance
            },
            function () {
              this.completeTask("reject");
            },
            this
          );
        },

        setTaskModels: function () {
          // set the task model
          var startupParameters = this.getComponentData().startupParameters;
          var taskModel = startupParameters.taskModel;
          var taskData = taskModel.getData();
          taskData.CreatedOn = taskData.CreatedOn.toDateString();
          taskData.CompletionDeadLine = taskData.CompletionDeadLine.toDateString();
          if (taskData.Priority === "HIGH") {
            taskData.PriorityState = "Warning";
          } else if (taskData.Priority === "VERY HIGH") {
            taskData.PriorityState = "Error";
          } else {
            taskData.PriorityState = "Success";
          }

          this.setModel(taskModel, "task")
          



          // read process context & bind it to the view's model 
          var that = this;
          $.ajax({
            type: "GET",
            url: this._getTaskInstancesBaseURL() + "/context",
            contentType: "application/json",
            dataType: "json",
            success: function (result, xhr, data) {
              var oContextModel = new JSONModel({});
              oContextModel.setData(result);
              that.setModel(oContextModel, "context");
              that.setCustomerData(result);
            }
          });
        },

        setCustomerData: function (oContext) {
          oComponent.setModel(new sap.ui.model.json.JSONModel([]), "commentsModel");
          oComponent.setModel(new sap.ui.model.json.JSONModel([]), "salesModel");
          oComponent.setModel(new sap.ui.model.json.JSONModel([]), "creditSegmentModel");
          oComponent.setModel(new sap.ui.model.json.JSONModel([]), "dmsModel");
          oComponent.setModel(new sap.ui.model.json.JSONModel([]), "attachmentsModel");

          oComponent.getModel("salesModel").oData = [];
          
          oComponent.zcustomer_num = oContext.customerId;

          oComponent.zsales_orgnization = oContext.salesOrganizationId;
          var oModel = oComponent.getModel();
          oComponent.sPath = "/ZDD_CUSTOMER(zcustomer_num=guid'" + oComponent.zcustomer_num + "',zsales_orgnization='" + oComponent.zsales_orgnization + "')"

          oModel.read(oComponent.sPath, {
            urlParameters: {
              "$expand": "to_salesarea,to_comments,to_credit"
            },
            success: function (oData, oResponse) {
              console.log(oData);
              var oCustomerDetailModel = oComponent.getModel("Customers");
              delete oData.__metadata;
              delete oData.to_zdd_comments;


              var salesItem = oComponent.getModel("salesModel").getData();
              var listItem = oComponent.getModel("commentsModel").getData();
              var creditSegmentItem = oComponent.getModel("creditSegmentModel").getData();

              for (var i = 0; i < oData.to_comments.results.length; i++) {
                listItem.push({
                  "zcomment": oData.to_comments.results[i].zcomment,
                  "zcustomer_num": oData.to_comments.results[i].zcustomer_num,
                  "Flag": "U",
                  "createdat": oData.to_comments.results[i].createdat,
                  "createdby": oData.to_comments.results[i].createdby,

                });
              }
              oComponent.getModel("commentsModel").updateBindings(true);

              for (var i = 0; i < oData.to_salesarea.results.length; i++) {
                salesItem.push({
                  "zsales_area_id": oData.to_salesarea.results[i].zsales_area_id,
                  "zcustomer_num": oData.to_salesarea.results[i].zcustomer_num,
                  "Flag": "U",
                  "zdistribution_channel": oData.to_salesarea.results[i].zdistribution_channel,
                  "zdistribution_channel_text": oData.to_salesarea.results[i].zdistribution_channel_text,
                  "zdivision": oData.to_salesarea.results[i].zdivision,
                  "zdivision_text": oData.to_salesarea.results[i].zdivision_text,
                  "zsales_orgnization": oData.to_salesarea.results[i].zsales_orgnization,
                  "zsales_orgnization_text": oData.to_salesarea.results[i].zsales_orgnization_text

                });
              }
              oComponent.getModel("salesModel").updateBindings(true);

              for (var i = 0; i < oData.to_credit.results.length; i++) {
                creditSegmentItem.push({
                  "zcredit_id": oData.to_credit.results[i].zcredit_id,
                  "zcustomer_num": oData.to_credit.results[i].zcustomer_num,
                  "Flag": "U",
                  "zinfo_type": oData.to_credit.results[i].zinfo_type,
                  "zname_of_type": oData.to_credit.results[i].zname_of_type,
                  "zrelevant": oData.to_credit.results[i].zrelevant,
                  "zindividual_step": oData.to_credit.results[i].zindividual_step,
                  "zcredit_amount": oData.to_credit.results[i].zcredit_amount,
                  "zcredit_curr": oData.to_credit.results[i].zcredit_curr,
                  "zdate_from": oData.to_credit.results[i].zdate_from,
                  "zdate_to": oData.to_credit.results[i].zdate_to,
                  "zentered_on": oData.to_credit.results[i].zentered_on,
                  "zdeleted_on": oData.to_credit.results[i].zdeleted_on,
                  "zresubmission_date": oData.to_credit.results[i].zresubmission_date,
                  "ztext_field": oData.to_credit.results[i].ztext_field,

                });
              }
              oComponent.getModel("creditSegmentModel").updateBindings(true);

              oCustomerDetailModel.setData(oData);
              oCustomerDetailModel.refresh();
            }.bind(this),
            error: function (oError) {
              MessageBox.error(oError);
            }
          });
          this.getDmsData();
          this.handleRuleEngineConfiguration();
        },
        getDmsData: function (evt) {
          var serviceURL = oComponent.getModel("DMS").sServiceUrl;
                var oModel = new sap.ui.model.odata.ODataModel(serviceURL, true);
                var path = "/GetAllOriginals?LinkedSAPObjectKey='" + this.zcustomer_num
                    + "'&BusinessObjectTypeName='" + "KNA1" + "";

                console.log(path);
                path = path.replaceAll("KNA1", "KNA1%27");
                
                oModel.read(path, {
                    success: function (oData, oResponse) {
                        var attachmentsItem = oComponent.getModel("attachmentsModel").getData();

                        for (var i = 0; i < oData.results.length; i++) {
                            attachmentsItem.push({
                                "FieldName": oData.results[i].FileName.split("_")[0],
                                "FileName": oData.results[i].FileName.split("_")[1],
                                "DocumentInfoRecordDocType": oData.results[i].DocumentInfoRecordDocType,
                                "DocumentInfoRecordDocNumber": oData.results[i].DocumentInfoRecordDocNumber,
                                "ArchiveDocumentID": oData.results[i].ArchiveDocumentID,
                                "LinkedSAPObjectKey": oData.results[i].LinkedSAPObjectKey,
                                "BusinessObjectTypeName": oData.results[i].BusinessObjectTypeName,
                                "MimeType": oData.results[i].MimeType,
                                "LogicalDocument" : oData.results[i].LogicalDocument,
                                "DocumentInfoRecordDocVersion": oData.results[i].DocumentInfoRecordDocVersion,
                                "DocumentInfoRecordDocPart" :oData.results[i].DocumentInfoRecordDocPart,
                                "Flag": "U",
                            });
                        }
                        oComponent.getModel("attachmentsModel").updateBindings(true);

                        var flatObj = {};
                        oData.results.forEach(function (obj) {
                            var sField = "";
                            sField += obj.FileName.split("_")[0];
                            flatObj[sField] = obj.FileName.split("_")[1];
                        })
                        console.log(flatObj);
                        oComponent.setModel(new sap.ui.model.json.JSONModel({}), "getDmsModel");
                        oComponent.getModel("getDmsModel").oData = flatObj;
                        oComponent.getModel("getDmsModel").updateBindings(true);
                        console.log(oData);
                    }.bind(this), error: function (err) {

                    }
                });
        },

        handleRuleEngineConfiguration: function (oEvent) {
          this.ruleId = "";
            var oModel = oComponent.getModel("RuleEngine");
            oModel.read("/Zdd_rule_engine", {
              urlParameters: {
                "$top": 10000
              },
              success: function (oData, oResponse) {
                for (var i = 0; i < oData.results.length; i++) {
                  if (oData.results[i].process === this.process && oData.results[i].customer_type === sCustomerType.toUpperCase() && oData.results[i].zbusiness_partner_id === sBPGrouping.toUpperCase()) {
                    this.ruleId = oData.results[i].rule_id;
                    console.log(this.ruleId);

                  }
                }

                if (this.ruleId == "" || this.ruleId == undefined) {
                  MessageBox.confirm("Rule engine Configuration does not exist for the selected keys?", {
                    actions: [MessageBox.Action.OK, MessageBox.Action.CANCEL],
                    emphasizedAction: MessageBox.Action.OK,
                    onClose: function (sAction) {
                      if (sAction === "CANCEL") {
                        oFilterBar.getFilterItems()[1].getControl().setSelectedItem(null);
                      }
                      else {
                        this.onCreate(this.process, sCustomerType, sBPGrouping);
                      }
                    }.bind(this)
                  });
                } else {
                  this.onRead(this.ruleId);
                }
              }.bind(this),
              error: function (oError) { }
            });
          
        },
        onRead: function (ruleid) {
          var oModel = oComponent.getModel("RuleEngine");
          // oComponent.setBusy(true);
          oModel.read("/ZDD_RULE_UPDATE_FIELDS", {
            filters: [new sap.ui.model.Filter("rule_id", "EQ", ruleid)],
            urlParameters: {
              "$top": 10000
            },

            success: function (oData, oResponse) {
              console.log(oData.results);
              var flatObj = {};
              oData.results.forEach(function (obj) {
                var sField = "";
                var rField = "";
                sField += obj.fieldname.split(" ").join("");
                rField += obj.fieldname.split(" ").join("");

                // if(obj.visibility){
                sField += "Visible";
                if (obj.visibility === "Y") {
                  flatObj[sField] = true;
                } else {
                  flatObj[sField] = false;
                }
                // }
                if (obj.mandatory) {
                  rField += "Mandatory";
                  if (obj.mandatory === "Y") {
                    flatObj[rField] = true;
                  } else {
                    flatObj[rField] = false;
                  }
                }
              })
              console.log(flatObj);
              oComponent.setModel(new sap.ui.model.json.JSONModel({}), "fieldMappingModels");
              oComponent.getModel("fieldMappingModels").oData = flatObj;
              oComponent.getModel("fieldMappingModels").updateBindings(true);
              console.log(oComponent.getModel("fieldMappingModels").oData);
              oComponent.getModel().refresh(true);

            }.bind(this),
            error: function (oError) {
              oComponent.setBusy(false);
            }.bind(this)
          });
        },
        updateFeilds: function (evt) {
          var oModel = oComponent.getModel("RuleEngine");
          // oComponent.setBusy(true);
          oModel.read("/ZDD_RULE_UPDATE", {
            // filters: [new sap.ui.model.Filter("rule_id", "EQ", ruleid)],
            // urlParameters: {
            //     "$top": 10000
            // },

            success: function (oData, oResponse) {
              // console.log("success");
              // console.log(oData.results);
            }.bind(this),
            error: function (err) {

            }.bind(this)
          });
        },
        onDescriptionSelect: function (oEvent) {
          var oCustomerDetailModel = oComponent.getModel("Customers");
          oCustomerDetailModel.setProperty("/zdescription", oEvent.getParameters().selectedIndex);
        },


        _getTaskInstancesBaseURL: function () {
          return (
            this._getWorkflowRuntimeBaseURL() +
            "/task-instances/" +
            this.getTaskInstanceID()
          );
        },

        _getWorkflowRuntimeBaseURL: function () {
          var appId = this.getManifestEntry("/sap.app/id");
          var appPath = appId.replaceAll(".", "/");
          var appModulePath = jQuery.sap.getModulePath(appPath);

          return appModulePath + "/bpmworkflowruntime/v1";
        },

        getTaskInstanceID: function () {
          return this.getModel("task").getData().InstanceID;
        },

        getInboxAPI: function () {
          var startupParameters = this.getComponentData().startupParameters;
          return startupParameters.inboxAPI;
        },

        completeTask: function (decision) {
          //this.getModel("context").setProperty("/approved", approvalStatus);
          this._patchTaskInstance(decision);
          this._refreshTaskList();
        },

        _patchTaskInstance: function (decision) {
          var data = {
            status: "COMPLETED",
            decision: decision,
            context: this.getModel("context").getData(),
          };

          jQuery.ajax({
            url: this._getTaskInstancesBaseURL(),
            method: "PATCH",
            contentType: "application/json",
            async: false,
            data: JSON.stringify(data)
            // headers: {
            //   "X-CSRF-Token": this._fetchToken(),
            // },
          });
        },

        _fetchToken: function () {
          var fetchedToken;

          jQuery.ajax({
            url: this._getWorkflowRuntimeBaseURL() + "/xsrf-token",
            method: "GET",
            async: false,
            headers: {
              "X-CSRF-Token": "Fetch",
            },
            success(result, xhr, data) {
              fetchedToken = data.getResponseHeader("X-CSRF-Token");
            },
          });
          return fetchedToken;
        },

        _refreshTaskList: function () {
          // this.getInboxAPI().updateTask("NA", this.getTaskInstanceID());

          this.getComponentData().startupParameters.inboxInternal.updateTaskList();
        },
      }
    );
  }
);
