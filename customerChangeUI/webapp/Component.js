sap.ui.define(
  [
    "sap/ui/core/UIComponent",
    "sap/ui/Device",
    "customerChangeUI/model/models",
    "sap/ui/model/json/JSONModel",
    "sap/m/MessageBox",
  ],
  function (UIComponent, Device, models, JSONModel, MessageBox) {
    "use strict";

    var oComponent;

    return UIComponent.extend("customerChangeUI.Component", {
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
        UIComponent.prototype.init.apply(oComponent, arguments);

        // set the device model
        oComponent.setModel(models.createDeviceModel(), "device");

        oComponent.setModel(models.createAppModel(), "Customers");
        oComponent.setModel(models.createMasterDataModel(), "MasterData");

        oComponent.initializeAppViewModel();

        oComponent.setTaskModels();

        oComponent.getInboxAPI().addAction(
          {
            action: "approve",
            label: "Approve",
            type: "accept", // (Optional property) Define for positive appearance
          },
          function () {
            oComponent.completeTask("approve");
          },
          oComponent
        );

        oComponent.getInboxAPI().addAction(
          {
            action: "reject",
            label: "Reject",
            type: "reject", // (Optional property) Define for negative appearance
          },
          function () {
            oComponent.completeTask("reject");
          },
          oComponent
        );
      },

      setTaskModels: function () {
        // set the task model
        var startupParameters = oComponent.getComponentData().startupParameters;
        var taskModel = startupParameters.taskModel;
        var taskData = taskModel.getData();
        taskData.CreatedOn = taskData.CreatedOn.toDateString();
        taskData.CompletionDeadLine =
          taskData.CompletionDeadLine.toDateString();
        if (taskData.Priority === "HIGH") {
          taskData.PriorityState = "Warning";
        } else if (taskData.Priority === "VERY HIGH") {
          taskData.PriorityState = "Error";
        } else {
          taskData.PriorityState = "Success";
        }

        oComponent.setModel(taskModel, "task");

        // read process context & bind it to the view's model
        $.ajax({
          type: "GET",
          url: oComponent._getTaskInstancesBaseURL() + "/context",
          contentType: "application/json",
          dataType: "json",
          success: function (result, xhr, data) {
            var oContextModel = new JSONModel({});
            oContextModel.setData(result);
            oComponent.setModel(oContextModel, "context");
            oComponent.setCustomerData(result);
          },
        });
      },

      setCustomerData: function (oContext) {
        debugger;
        oComponent.zcustomer_num = oContext.customerId;
        oComponent.mode = "edit";
        oComponent.getModel("appView").setProperty("/mode", oComponent.mode);

        var serviceURL =
          oComponent.getModel("S4D111").sServiceUrl;
        var oModel = new sap.ui.model.odata.ODataModel(serviceURL, true);

        oComponent.setModel(
          new sap.ui.model.json.JSONModel([]),
          "commentsModel"
        );
        // oComponent.setModel(new sap.ui.model.json.JSONModel([]), "salesModel");
        oComponent.setModel(
          new sap.ui.model.json.JSONModel([]),
          "creditSegmentModel"
        );
        oComponent.setModel(
          new sap.ui.model.json.JSONModel([]),
          "dmsModel"
        );
        oComponent.setModel(
          new sap.ui.model.json.JSONModel([]),
          "attachmentsModel"
        );

        oComponent.setModel(
          new sap.ui.model.json.JSONModel([]),
          "salesDataModel"
        );

        oComponent.evtProcessExt = "Change Customer";

        oComponent.evtProcess = "CHANGE";

        oComponent.extendExistingCustomerSet();
        oComponent
          .getModel("appView")
          .setProperty("/reqType", "Change Customer");
        oComponent.handleHistory();
      },

      getDmsData: function (evt) {
        var serviceURL = oComponent.getModel("DMS").sServiceUrl;
        var oModel = new sap.ui.model.odata.ODataModel(serviceURL, true);
        var path = "/GetAllOriginals?LinkedSAPObjectKey='" + oComponent.getModel("Customers").getData().zcustomer_num
          + "'&BusinessObjectTypeName='" + "KNA1" + "";

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
                "LogicalDocument": oData.results[i].LogicalDocument,
                "DocumentInfoRecordDocVersion": oData.results[i].DocumentInfoRecordDocVersion,
                "DocumentInfoRecordDocPart": oData.results[i].DocumentInfoRecordDocPart,
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
          }.bind(oComponent), error: function (err) {

          }
        });
      },


      handleHistory: function (evt) {
        var oModel = oComponent.getModel();
        oModel.read("/ZDD_REQ_HISTORY", {
          filters: [
            new sap.ui.model.Filter("zrequest_no", "EQ", oComponent.requestNo),
          ],
          success: function (oData, oResponse) {
            //   console.log(oData);
            var arr = [];
            for (var i = 0; i < oData.results.length; i++) {
              arr.push({
                "srno": oData.results[i].srno,
                "zrequest_no": oData.results[i].zrequest_no,
                "zpending_with": oData.results[i].zpending_with,
                "ztrail_role": oData.results[i].ztrail_role,
                "ztrail_status": oData.results[i].ztrail_status,
                "ztrail_tot_cl_approved": oData.results[i].ztrail_tot_cl_approved,
                "ztrailmax_credit_days": oData.results[i].ztrailmax_credit_days,
                "ztrail_version": oData.results[i].ztrail_version,
                "ztrail_remarks": oData.results[i].ztrail_remarks
              })
            }
            oComponent.setModel(new sap.ui.model.json.JSONModel([]), "historyModel");
            oComponent.getModel("historyModel").oData = arr;
            oComponent.getModel("historyModel").updateBindings(true);
          }.bind(oComponent),
          error: function (error) { },
        });
      },

      extendExistingCustomerSet: function () {
        var oModel = oComponent.getModel();
        oComponent.sPath = "/ZDD_CUSTOMER(zcustomer_num=guid'" + oComponent.zcustomer_num + "')";
        oComponent.getModel("Customers").updateBindings(true);
        oModel.read(oComponent.sPath, {
          urlParameters: {
            "$expand": "to_salesarea,to_comments,to_credit"
          },
          success: function (oData, oResponse) {

            oComponent.bpg = oData.zbusiness_partner_id_grouping;
            oComponent.getModel("appView").setProperty("/bpg", oComponent.bpg);

            delete oData.__metadata;
            delete oData.to_zdd_comments;
            delete oData.to_zdd_sale;

            console.log(oData);
            var oCustomerDetailModel = oComponent.getModel("Customers");
            delete oData.__metadata;
            delete oData.to_zdd_comments;


            var salesItem = oComponent.getModel("salesDataModel").getData();
            var listItem = oComponent.getModel("commentsModel").getData();
            var creditSegmentItem = oComponent.getModel("creditSegmentModel").getData();

            if (oData.to_comments.results.length > 0) {
              for (var j = 0; j < oData.to_comments.results.length; j++) {
                delete oData.to_comments.results[j].__metadata;
                listItem.push({
                  "zcomment": oData.to_comments.results[j].zcomment,
                  "zcustomer_num": oData.to_comments.results[j].zcustomer_num,
                  "Flag": "U",
                  "createdat": oData.to_comments.results[j].createdat,
                  "createdby": oData.to_comments.results[j].createdby,

                });
              }
              oComponent.getModel("commentsModel").updateBindings(true);
            }
            if (oData.to_salesarea.results.length > 0) {
              for (var k = 0; k < oData.to_salesarea.results.length; k++) {
                delete oData.to_salesarea.results[k].__metadata;
                salesItem.push({
                  "zsales_area_id": oData.to_salesarea.results[k].zsales_area_id,
                  "zcustomer_num": oData.to_salesarea.results[k].zcustomer_num,
                  "Flag": "U",
                  "zdistribution_channel": oData.to_salesarea.results[k].zdistribution_channel,
                  "zdistribution_channel_text": oData.to_salesarea.results[k].zdistribution_channel_text,
                  "zdivision": oData.to_salesarea.results[k].zdivision,
                  "zdivision_text": oData.to_salesarea.results[k].zdivision_text,
                  "zsales_orgnization": oData.to_salesarea.results[k].zsales_orgnization,
                  "zsales_orgnization_text": oData.to_salesarea.results[k].zsales_orgnization_text,
                  "zsettlement_group": oData.to_salesarea.results[k].zsettlement_group,
                  "zaccount_assignment_group": oData.to_salesarea.results[k].zaccount_assignment_group,
                  "zagency_business": oData.to_salesarea.results[k].zagency_business,
                  "zdocument_index_active": oData.to_salesarea.results[k].zdocument_index_active,
                  "zmanual_invoice_maintenance": oData.to_salesarea.results[k].zmanual_invoice_maintenance,
                  "zrebate": oData.to_salesarea.results[k].zrebate,
                  "zpricing": oData.to_salesarea.results[k].zpricing,
                  "zinvoicing_dates": oData.to_salesarea.results[k].zinvoicing_dates,
                  "zinvoicing_list_dates": oData.to_salesarea.results[k].zinvoicing_list_dates,
                  "zcustomer_group1": oData.to_salesarea.results[k].zcustomer_group1,
                  "zcustomer_group2": oData.to_salesarea.results[k].zcustomer_group2,
                  "zcustomer_group3": oData.to_salesarea.results[k].zcustomer_group3,
                  "zcustomer_group4": oData.to_salesarea.results[k].zcustomer_group4,
                  "zcustomer_group5": oData.to_salesarea.results[k].zcustomer_group5,
                  "zcustomer_group": oData.to_salesarea.results[k].zcustomer_group,
                  "zinco_term": oData.to_salesarea.results[k].zinco_term,
                  "zinco_location1": oData.to_salesarea.results[k].zinco_location1,
                  "zpayment_terms": oData.to_salesarea.results[k].zpayment_terms,
                  "zcredit_control_area": oData.to_salesarea.results[k].zcredit_control_area,
                  "zpayment_gurantee_procedure": oData.to_salesarea.results[k].zpayment_gurantee_procedure,
                  "zcomplete_delivery": oData.to_salesarea.results[k].zcomplete_delivery,
                  "zmaximum_number_of_part_delive": oData.to_salesarea.results[k].zmaximum_number_of_part_delive,
                  "zpartial_delivery_per_item": oData.to_salesarea.results[k].zpartial_delivery_per_item,
                  "zunlimited_tolerance": oData.to_salesarea.results[k].zunlimited_tolerance,
                  "zunder_delivery_tolerance": oData.to_salesarea.results[k].zunder_delivery_tolerance,
                  "zover_delivery_tolerance": oData.to_salesarea.results[k].zover_delivery_tolerance,
                  "zbill_to_buyer": oData.to_salesarea.results[k].zbill_to_buyer,
                  "zonly_ship_to": oData.to_salesarea.results[k].zonly_ship_to,
                  "zsales_person": oData.to_salesarea.results[k].zsales_person,
                  "zagent": oData.to_salesarea.results[k].zagent,
                  "zprice_group": oData.to_salesarea.results[k].zprice_group,
                  "zpricelist": oData.to_salesarea.results[k].zpricelist,
                  "zprice_procedured_term": oData.to_salesarea.results[k].zprice_procedured_term,
                  "zcustomer_statistics_group": oData.to_salesarea.results[k].zcustomer_statistics_group,
                  "zsales_district": oData.to_salesarea.results[k].zsales_district,
                  "zsales_office": oData.to_salesarea.results[k].zsales_office,
                  "zsales_group": oData.to_salesarea.results[k].zsales_group,
                  "zabc_class": oData.to_salesarea.results[k].zabc_class,
                  "zcurrency": oData.to_salesarea.results[k].zcurrency,
                  "zaccount_at_customer": oData.to_salesarea.results[k].zaccount_at_customer,
                  "zswitch_off_rounding": oData.to_salesarea.results[k].zswitch_off_rounding,
                  "zorderprobability": oData.to_salesarea.results[k].zorderprobability,
                  "zauthorization_group": oData.to_salesarea.results[k].zauthorization_group,
                  "zitemproposal": oData.to_salesarea.results[k].zitemproposal,
                  "zunit_of_measure_group": oData.to_salesarea.results[k].zunit_of_measure_group,
                  "zexchange_rate_type": oData.to_salesarea.results[k].zexchange_rate_type,
                  "zpp_customer_procedure": oData.to_salesarea.results[k].zpp_customer_procedure,
                  "zshipping_conditions": oData.to_salesarea.results[k].zshipping_conditions,
                  "zdelivery_plant": oData.to_salesarea.results[k].zdelivery_plant,
                  "zdelivery_priority": oData.to_salesarea.results[k].zdelivery_priority,
                  "zorder_combination": oData.to_salesarea.results[k].zorder_combination,
                  "zrelevant_pod": oData.to_salesarea.results[k].zrelevant_pod,
                  "zpod_timeframe": oData.to_salesarea.results[k].zpod_timeframe,
                  "zcountry": oData.to_salesarea.results[k].zcountry,
                  "ztaxcategory": oData.to_salesarea.results[k].ztaxcategory,
                  "ztax_classification": oData.to_salesarea.results[k].ztax_classification,
                  "ztax_category2": oData.to_salesarea.results[k].ztax_category2,
                  "ztax_classification2": oData.to_salesarea.results[k].ztax_classification2,

                  "zrule": oData.to_salesarea.results[k].zrule,
                  "ztax_category2": oData.to_salesarea.results[k].ztax_category2,
                  "zrisk_class": oData.to_salesarea.results[k].zrisk_class,
                  "zcheck_rule": oData.to_salesarea.results[k].zcheck_rule,
                  "zlimit_define": oData.to_salesarea.results[k].zlimit_define,
                  "zlimit": oData.to_salesarea.results[k].zlimit,
                  "zvalidity_to": oData.to_salesarea.results[k].zvalidity_to,
                  "zcredit_segment": oData.to_salesarea.results[k].zcredit_segment,
                  "zrelationship_to_bp": oData.to_salesarea.results[k].zrelationship_to_bp,
                  "zcredit_control_area_desc": oData.to_salesarea.results[k].zcredit_control_area_desc,
                  "zcredit_segment_desc": oData.to_salesarea.results[k].zcredit_segment_desc,
                  "zblockedincm": oData.to_salesarea.results[k].zblockedincm,
                  "zspecialattention": oData.to_salesarea.results[k].zspecialattention,
                  "zutiliation_ptg": oData.to_salesarea.results[k].zutiliation_ptg,
                  "zresubmission_on": oData.to_salesarea.results[k].zresubmission_on,
                  "zinfo_category": oData.to_salesarea.results[k].zinfo_category,
                  "zinfo_type": oData.to_salesarea.results[k].zinfo_type,
                  "zname_of_type": oData.to_salesarea.results[k].zname_of_type,
                  "zrelevant": oData.to_salesarea.results[k].zrelevant,
                  "zindividual_step": oData.to_salesarea.results[k].zindividual_step,
                  "zcredit_amount": oData.to_salesarea.results[k].zcredit_amount,
                  "zdate_from": oData.to_salesarea.results[k].zdate_from,
                  "zdate_to": oData.to_salesarea.results[k].zdate_to,
                  "zcredit_curr": oData.to_salesarea.results[k].zcredit_curr,
                  "zentered_on": oData.to_salesarea.results[k].zentered_on,
                  "zdeleted_on": oData.to_salesarea.results[k].zdeleted_on,
                  "zresubmission_date": oData.to_salesarea.results[k].zresubmission_date,
                  "ztext_field": oData.to_salesarea.results[k].ztext_field,
                  "zcredit_curr": oData.to_salesarea.results[k].zcredit_curr,
                  "zblock_reason": oData.to_salesarea.results[k].zblock_reason


                });
              }
              oComponent.getModel("salesDataModel").updateBindings(true);
              // }

              // oComponent.getModel("salesModel").updateBindings(true);
            }

            if (oData.to_credit.results.length > 0) {

              for (var l = 0; l < oData.to_credit.results.length; l++) {
                delete oData.to_credit.results[l].__metadata;
                creditSegmentItem.push({
                  "zcredit_id": oData.to_credit.results[l].zcredit_id,
                  "zcustomer_num": oData.to_credit.results[l].zcustomer_num,
                  "Flag": "U",
                  "zinfo_type": oData.to_credit.results[l].zinfo_type,
                  "zname_of_type": oData.to_credit.results[l].zname_of_type,
                  "zrelevant": oData.to_credit.results[l].zrelevant === "" ? false : true,
                  "zindividual_step": oData.to_credit.results[l].zindividual_step,
                  "zcredit_amount": oData.to_credit.results[l].zcredit_amount,
                  "zcredit_curr": oData.to_credit.results[l].zcredit_curr,
                  "zdate_from": oData.to_credit.results[l].zdate_from,
                  "zdate_to": oData.to_credit.results[l].zdate_to,
                  "zentered_on": oData.to_credit.results[l].zentered_on,
                  "zdeleted_on": oData.to_credit.results[l].zdeleted_on,
                  "zresubmission_date": oData.to_credit.results[l].zresubmission_date,
                  "ztext_field": oData.to_credit.results[l].ztext_field,

                });
              }
              oComponent.getModel("creditSegmentModel").updateBindings(true);
            }

            oCustomerDetailModel.setData(oData);
            // oComponent.getModel("appView").setProperty("/status", oData.zrequest_status);
            
            oCustomerDetailModel.refresh();
            oComponent.handleRuleEngineConfiguration();
            oComponent.getDmsData();
          }.bind(oComponent),
          error: function (error) { },
        });

      },
      handleRuleEngineConfiguration: function (oEvent) {
        if (oComponent.evtProcess === 'CHANGE') {
          var process = 'CHANGE';
        } else if (oComponent.evtProcess === 'Extend Customer') {
          var process = 'EXTEND';
        } else {
          var process = oComponent.evtProcess;
        }
        oComponent.getModel("appView").setProperty("/process", oComponent.evtProcess);
        var sCustomerType = oComponent.getModel("appView").getProperty("/vertical") === 'Cash' ? 'Cash' : 'Credit';
        if (oComponent.getModel("appView").getProperty("/bpg") === "Sold") {
          var sBPGrouping = "Sold To";
        } else if (oComponent.getModel("appView").getProperty("/bpg") === "Ship") {
          var sBPGrouping = "Ship To";
        } else if (oComponent.getModel("appView").getProperty("/bpg") === "One") {
          var sBPGrouping = "One";
        } else if (oComponent.getModel("appView").getProperty("/bpg") === "Inte") {
          var sBPGrouping = "Inte";
        } else {
          var sBPGrouping = oComponent.getModel("appView").getProperty("/bpg");
        }
        oComponent.ruleId = "";
        if (process !== "" && sCustomerType !== "" && sBPGrouping !== "") {
          var oModel = oComponent.getModel("RuleEngine");
          oModel.read("/Zdd_rule_engine", {
            urlParameters: {
              $top: 10000,
            },
            success: function (oData, oResponse) {
              for (var i = 0; i < oData.results.length; i++) {
                if (
                  oData.results[i].process === process &&
                  oData.results[i].customer_type ===
                  sCustomerType.toUpperCase() &&
                  oData.results[i].zbusiness_partner_id ===
                  sBPGrouping.toUpperCase()
                ) {
                  oComponent.ruleId = oData.results[i].rule_id;
                  console.log(oComponent.ruleId);
                }
              }

              if (oComponent.ruleId == "" || oComponent.ruleId == undefined) {
                MessageBox.confirm(
                  "Rule engine Configuration does not exist for the selected keys?",
                  {
                    actions: [MessageBox.Action.OK, MessageBox.Action.CANCEL],
                    emphasizedAction: MessageBox.Action.OK,
                    onClose: function (sAction) {
                      if (sAction === "CANCEL") {
                        oFilterBar
                          .getFilterItems()[1]
                          .getControl()
                          .setSelectedItem(null);
                      } else {
                        oComponent.onCreate(process, sCustomerType, sBPGrouping);
                      }
                    }.bind(oComponent),
                  }
                );
              } else {
                oComponent.onRead(oComponent.ruleId);
              }
            }.bind(oComponent),
            error: function (oError) { },
          });
        }
      },
      onRead: function (ruleid) {
        var oModel = oComponent.getModel("RuleEngine");
        oComponent.setBusy(true);
        oModel.read("/ZDD_RULE_UPDATE_FIELDS", {
          filters: [new sap.ui.model.Filter("rule_id", "EQ", ruleid)],
          urlParameters: {
            $top: 10000,
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
              // if(obj.mandatory){
              rField += "Mandatory";
              if (obj.mandatory === "Y") {
                flatObj[rField] = true;
              } else {
                flatObj[rField] = false;
              }
              // }
            });
            console.log(flatObj);
            oComponent.setModel(
              new sap.ui.model.json.JSONModel({}),
              "fieldMappingModels"
            );

            oComponent.getModel("fieldMappingModels").oData = flatObj;
            oComponent.getModel("fieldMappingModels").updateBindings(true);
            console.log(oComponent.getModel("fieldMappingModels").oData);

            oComponent.setBusy(false);

          }.bind(oComponent),
          error: function (oError) {
            // oComponent.busyDialog.close();
            oComponent.setBusy(false);
          }.bind(oComponent),
        });
      },



      _getTaskInstancesBaseURL: function () {
        return (
          oComponent._getWorkflowRuntimeBaseURL() +
          "/task-instances/" +
          oComponent.getTaskInstanceID()
        );
      },

      _getWorkflowRuntimeBaseURL: function () {
        var appId = oComponent.getManifestEntry("/sap.app/id");
        var appPath = appId.replaceAll(".", "/");
        var appModulePath = jQuery.sap.getModulePath(appPath);

        return appModulePath + "/bpmworkflowruntime/v1";
      },

      getTaskInstanceID: function () {
        return oComponent.getModel("task").getData().InstanceID;
      },

      getInboxAPI: function () {
        var startupParameters = oComponent.getComponentData().startupParameters;
        return startupParameters.inboxAPI;
      },

      completeTask: function (decision) {
        //oComponent.getModel("context").setProperty("/approved", approvalStatus);
        if (decision === "reject") {
          oComponent.rejectRequest(decision);
        } else {
          oComponent._patchTaskInstance(decision);
          oComponent._refreshTaskList();
        }

      },

      rejectRequest: function (decision) {
        var oModel = oComponent.getModel();
        var sPath = "/ZDD_CUSTOMER(zcustomer_num=guid'" + oComponent.zcustomer_num + "')";
        var oCustomerDetailModel = oComponent.getModel("Customers");
        delete oCustomerDetailModel.getData().to_zdd_sale;
        delete oCustomerDetailModel.getData().to_zdd_comments;
        var oEntry = oCustomerDetailModel.getData();
        oEntry.zrequest_status = "Rejected";
        delete oEntry.to_comments;
        delete oEntry.to_salesarea;
        delete oEntry.to_credit;
        delete oEntry.ztype_of_Entity;

        oModel.update(sPath, oEntry, {
          success: function (oData) {
            oComponent._patchTaskInstance(decision);
            console.log('Rejected!');
            oComponent._refreshTaskList();
          },
          error: function (oError) {
            console.log(oError);
          }
        });
      },

      _patchTaskInstance: function (decision) {
        var data = {
          status: "COMPLETED",
          decision: decision,
          context: oComponent.getModel("context").getData(),
        };

        jQuery.ajax({
          url: oComponent._getTaskInstancesBaseURL(),
          method: "PATCH",
          contentType: "application/json",
          async: false,
          data: JSON.stringify(data),
          // headers: {
          //   "X-CSRF-Token": oComponent._fetchToken(),
          // },
        });
      },

      _fetchToken: function () {
        var fetchedToken;

        jQuery.ajax({
          url: oComponent._getWorkflowRuntimeBaseURL() + "/xsrf-token",
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
        // oComponent.getInboxAPI().updateTask("NA", oComponent.getTaskInstanceID());

        oComponent
          .getComponentData()
          .startupParameters.inboxInternal.updateTaskList();
      },

      initializeAppViewModel: function () {
        var oViewModel = new sap.ui.model.json.JSONModel({
          zcustNum: "",
          zsalesOrg: "",
          ztext: "",
          selectedType: 0,
          newCustId: "",
          custType: "Credit",
          customerType: 0,
          content: "",
          selectedMode: false,
          distributionChannel: "",
          cca: "",
          reqType: "",
          salesOrg: "",
          dmsFile: [{}],
          businessPartnerId: "",
          reqNo: "",
          process: "CHANGE",
          vertical: "Credit",
          bpg: "Sold To",
          mode: "add",
          status: "In Progress",
          generateSale: false,
        });
        oComponent.setModel(oViewModel, "appView");
      },
    });
  }
);
