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
          taskData.CompletionDeadLine = taskData.CompletionDeadLine.toDateString();
          if (taskData.Priority === "HIGH") {
            taskData.PriorityState = "Warning";
          } else if (taskData.Priority === "VERY HIGH") {
            taskData.PriorityState = "Error";
          } else {
            taskData.PriorityState = "Success";
          }

          oComponent.setModel(taskModel, "task")

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
            }
          });
        },

        setCustomerData: function (oContext) {
          oComponent.setModel(new JSONModel([]), "commentsModel");
          oComponent.setModel(new JSONModel([]), "salesModel");
          oComponent.setModel(new JSONModel([]), "creditSegmentModel");
          oComponent.setModel(new JSONModel([]), "dmsModel");
          oComponent.setModel(new JSONModel([]), "attachmentsModel");

          oComponent.setModel(new JSONModel([]), "salesDataModel");

          oComponent.getModel("salesModel").oData = [];
          
          oComponent.zcustomer_num = oContext.customerId;

          var oModel = oComponent.getModel();
          oComponent.sPath = "/ZDD_CUSTOMER(zcustomer_num=guid'" + oComponent.zcustomer_num + "')";

          oModel.read(oComponent.sPath, {
            urlParameters: {
                "$expand": "to_salesarea,to_comments,to_credit"
            },
            success: function (oData, oResponse) {
                var oCustomerDetailModel = oComponent.getModel("Customers");
                delete oData.__metadata;
                delete oData.to_zdd_comments;


                var salesItem = oComponent.getModel("salesDataModel").getData();
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
                        "zsales_orgnization_text": oData.to_salesarea.results[i].zsales_orgnization_text,
                        "zsettlement_group": oData.to_salesarea.results[i].zsettlement_group,
                        "zaccount_assignment_group": oData.to_salesarea.results[i].zaccount_assignment_group,
                        "zagency_business": oData.to_salesarea.results[i].zagency_business,
                        "zdocument_index_active": oData.to_salesarea.results[i].zdocument_index_active,
                        "zmanual_invoice_maintenance": oData.to_salesarea.results[i].zmanual_invoice_maintenance,
                        "zrebate": oData.to_salesarea.results[i].zrebate,
                        "zpricing": oData.to_salesarea.results[i].zpricing,
                        "zinvoicing_dates": oData.to_salesarea.results[i].zinvoicing_dates,
                        "zinvoicing_list_dates": oData.to_salesarea.results[i].zinvoicing_list_dates,
                        "zcustomer_group1": oData.to_salesarea.results[i].zcustomer_group1,
                        "zcustomer_group2": oData.to_salesarea.results[i].zcustomer_group2,
                        "zcustomer_group3": oData.to_salesarea.results[i].zcustomer_group3,
                        "zcustomer_group4": oData.to_salesarea.results[i].zcustomer_group4,
                        "zcustomer_group5": oData.to_salesarea.results[i].zcustomer_group5,
                        "zcustomer_group": oData.to_salesarea.results[i].zcustomer_group,
                        "zinco_term": oData.to_salesarea.results[i].zinco_term,
                        "zinco_location1": oData.to_salesarea.results[i].zinco_location1,
                        "zpayment_terms": oData.to_salesarea.results[i].zpayment_terms,
                        "zcredit_control_area": oData.to_salesarea.results[i].zcredit_control_area,
                        "zpayment_gurantee_procedure": oData.to_salesarea.results[i].zpayment_gurantee_procedure,
                        "zcomplete_delivery": oData.to_salesarea.results[i].zcomplete_delivery,
                        "zmaximum_number_of_part_delive": oData.to_salesarea.results[i].zmaximum_number_of_part_delive,
                        "zpartial_delivery_per_item": oData.to_salesarea.results[i].zpartial_delivery_per_item,
                        "zunlimited_tolerance": oData.to_salesarea.results[i].zunlimited_tolerance,
                        "zunder_delivery_tolerance": oData.to_salesarea.results[i].zunder_delivery_tolerance,
                        "zover_delivery_tolerance": oData.to_salesarea.results[i].zover_delivery_tolerance,
                        "zbill_to_buyer": oData.to_salesarea.results[i].zbill_to_buyer,
                        "zonly_ship_to": oData.to_salesarea.results[i].zonly_ship_to,
                        "zsales_person": oData.to_salesarea.results[i].zsales_person,
                        "zagent": oData.to_salesarea.results[i].zagent,
                        "zprice_group": oData.to_salesarea.results[i].zprice_group,
                        "zpricelist": oData.to_salesarea.results[i].zpricelist,
                        "zprice_procedured_term": oData.to_salesarea.results[i].zprice_procedured_term,
                        "zcustomer_statistics_group": oData.to_salesarea.results[i].zcustomer_statistics_group,
                        "zsales_district": oData.to_salesarea.results[i].zsales_district,
                        "zsales_office": oData.to_salesarea.results[i].zsales_office,
                        "zsales_group": oData.to_salesarea.results[i].zsales_group,
                        "zabc_class": oData.to_salesarea.results[i].zabc_class,
                        "zcurrency": oData.to_salesarea.results[i].zcurrency,
                        "zaccount_at_customer": oData.to_salesarea.results[i].zaccount_at_customer,
                        "zswitch_off_rounding": oData.to_salesarea.results[i].zswitch_off_rounding,
                        "zorderprobability": oData.to_salesarea.results[i].zorderprobability,
                        "zauthorization_group": oData.to_salesarea.results[i].zauthorization_group,
                        "zitemproposal": oData.to_salesarea.results[i].zitemproposal,
                        "zunit_of_measure_group": oData.to_salesarea.results[i].zunit_of_measure_group,
                        "zexchange_rate_type": oData.to_salesarea.results[i].zexchange_rate_type,
                        "zpp_customer_procedure": oData.to_salesarea.results[i].zpp_customer_procedure,
                        "zshipping_conditions": oData.to_salesarea.results[i].zshipping_conditions,
                        "zdelivery_plant": oData.to_salesarea.results[i].zdelivery_plant,
                        "zdelivery_priority": oData.to_salesarea.results[i].zdelivery_priority,
                        "zorder_combination": oData.to_salesarea.results[i].zorder_combination,
                        "zrelevant_pod": oData.to_salesarea.results[i].zrelevant_pod,
                        "zpod_timeframe": oData.to_salesarea.results[i].zpod_timeframe,
                        "zcountry": oData.to_salesarea.results[i].zcountry,
                        "ztaxcategory": oData.to_salesarea.results[i].ztaxcategory,
                        "ztax_classification": oData.to_salesarea.results[i].ztax_classification,
                        "ztax_category2": oData.to_salesarea.results[i].ztax_category2,
                        "ztax_classification2": oData.to_salesarea.results[i].ztax_classification2,
                        "zrule": oData.to_salesarea.results[i].zrule,
                        "ztax_category2": oData.to_salesarea.results[i].ztax_category2,
                        "zrisk_class": oData.to_salesarea.results[i].zrisk_class,
                        "zcheck_rule": oData.to_salesarea.results[i].zcheck_rule,
                        "zlimit_define": oData.to_salesarea.results[i].zlimit_define,
                        "zlimit": oData.to_salesarea.results[i].zlimit,
                        "zvalidity_to": oData.to_salesarea.results[i].zvalidity_to,
                        "zcredit_segment": oData.to_salesarea.results[i].zcredit_segment,
                        "zrelationship_to_bp": oData.to_salesarea.results[i].zrelationship_to_bp,
                        "zcredit_control_area_desc": oData.to_salesarea.results[i].zcredit_control_area_desc,
                        "zcredit_segment_desc": oData.to_salesarea.results[i].zcredit_segment_desc,
                        "zblockedincm": oData.to_salesarea.results[i].zblockedincm,
                        "zspecialattention": oData.to_salesarea.results[i].zspecialattention,
                        "zutiliation_ptg": oData.to_salesarea.results[i].zutiliation_ptg,
                        "zresubmission_on": oData.to_salesarea.results[i].zresubmission_on,
                        "zinfo_category": oData.to_salesarea.results[i].zinfo_category,
                        "zinfo_type": oData.to_salesarea.results[i].zinfo_type,
                        "zname_of_type": oData.to_salesarea.results[i].zname_of_type,
                        "zrelevant": oData.to_salesarea.results[i].zrelevant,
                        "zindividual_step": oData.to_salesarea.results[i].zindividual_step,
                        "zcredit_amount": oData.to_salesarea.results[i].zcredit_amount,
                        "zdate_from": oData.to_salesarea.results[i].zdate_from,
                        "zdate_to": oData.to_salesarea.results[i].zdate_to,
                        "zcredit_curr": oData.to_salesarea.results[i].zcredit_curr,
                        "zentered_on": oData.to_salesarea.results[i].zentered_on,
                        "zdeleted_on": oData.to_salesarea.results[i].zdeleted_on,
                        "zresubmission_date": oData.to_salesarea.results[i].zresubmission_date,
                        "ztext_field": oData.to_salesarea.results[i].ztext_field,
                        "zcredit_curr": oData.to_salesarea.results[i].zcredit_curr,
                        "zblock_reason" : oData.to_salesarea.results[i].zblock_reason
                        

                    });
                }
                oComponent.getModel("salesDataModel").updateBindings(true);

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
               oComponent.getModel("appView").setProperty("/vertical", oComponent.getModel("Customers").getData().zdescription);
               oComponent.handleEntityCheckModel(oComponent.getModel("Customers").getData().ztype_of_entity);
                
               oComponent.getDmsData();
            }.bind(oComponent),
            error: function (oError) {
            }
        });
          oComponent.handleRuleEngineConfiguration();
        },

        //getService for type of entity to update fields
        handleEntityCheckModel: function(ztype_of_entity){
          var appView = oComponent.getModel("appView");
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
          };
          oComponent.setModel(new JSONModel([obj]), "typOfEntityModel");
          oComponent.getModel("typOfEntityModel").updateBindings(true);
          var oModel = oComponent.getModel("typOfEntityModel").oData[0];
          var entityTypTitle = ztype_of_entity;
          if(entityTypTitle && entityTypTitle == oModel.COOP){
              appView.setProperty("/TypeOfEntity1", true);
              appView.setProperty("/TypeOfEntity2", false);
              appView.setProperty("/TypeOfEntity3", false);
              appView.setProperty("/TypeOfEntity4", false);
              appView.setProperty("/TypeOfEntity5", false);
              appView.setProperty("/TypeOfEntity6", false);
              appView.setProperty("/TypeOfEntity7", false);
              appView.setProperty("/TypeOfEntity8", false);
              appView.setProperty("/TypeOfEntity9", false);
          }else if(entityTypTitle && entityTypTitle == oModel.Consort){
              appView.setProperty("/TypeOfEntity1", false);
              appView.setProperty("/TypeOfEntity2", true);
              appView.setProperty("/TypeOfEntity3", false);
              appView.setProperty("/TypeOfEntity4", false);
              appView.setProperty("/TypeOfEntity5", false);
              appView.setProperty("/TypeOfEntity6", false);
              appView.setProperty("/TypeOfEntity7", false);
              appView.setProperty("/TypeOfEntity8", false);
              appView.setProperty("/TypeOfEntity9", false);
          }else if(entityTypTitle && entityTypTitle == oModel.Govt){
              appView.setProperty("/TypeOfEntity1", false);
              appView.setProperty("/TypeOfEntity2", false);
              appView.setProperty("/TypeOfEntity3", true);
              appView.setProperty("/TypeOfEntity4", false);
              appView.setProperty("/TypeOfEntity5", false);
              appView.setProperty("/TypeOfEntity6", false);
              appView.setProperty("/TypeOfEntity7", false);
              appView.setProperty("/TypeOfEntity8", false);
              appView.setProperty("/TypeOfEntity9", false);
          }else if(entityTypTitle && entityTypTitle == oModel.Ltd_Liability_partnrshp){
              appView.setProperty("/TypeOfEntity1", false);
              appView.setProperty("/TypeOfEntity2", false);
              appView.setProperty("/TypeOfEntity3", false);
              appView.setProperty("/TypeOfEntity4", true);
              appView.setProperty("/TypeOfEntity5", false);
              appView.setProperty("/TypeOfEntity6", false);
              appView.setProperty("/TypeOfEntity7", false);
              appView.setProperty("/TypeOfEntity8", false);
              appView.setProperty("/TypeOfEntity9", false);
          }else if(entityTypTitle && entityTypTitle == oModel.Other){
              appView.setProperty("/TypeOfEntity1", false);
              appView.setProperty("/TypeOfEntity2", false);
              appView.setProperty("/TypeOfEntity3", false);
              appView.setProperty("/TypeOfEntity4", false);
              appView.setProperty("/TypeOfEntity5", true);
              appView.setProperty("/TypeOfEntity6", false);
              appView.setProperty("/TypeOfEntity7", false);
              appView.setProperty("/TypeOfEntity8", false);
              appView.setProperty("/TypeOfEntity9", false);
          }else if(entityTypTitle && entityTypTitle == oModel.Partnership){
              appView.setProperty("/TypeOfEntity1", false);
              appView.setProperty("/TypeOfEntity2", false);
              appView.setProperty("/TypeOfEntity3", false);
              appView.setProperty("/TypeOfEntity4", false);
              appView.setProperty("/TypeOfEntity5", false);
              appView.setProperty("/TypeOfEntity6", true);
              appView.setProperty("/TypeOfEntity7", false);
              appView.setProperty("/TypeOfEntity8", false);
              appView.setProperty("/TypeOfEntity9", false);
          }else if(entityTypTitle && entityTypTitle == oModel.Prt_ltd_Comp){
              appView.setProperty("/TypeOfEntity1", false);
              appView.setProperty("/TypeOfEntity2", false);
              appView.setProperty("/TypeOfEntity3", false);
              appView.setProperty("/TypeOfEntity4", false);
              appView.setProperty("/TypeOfEntity5", false);
              appView.setProperty("/TypeOfEntity6", false);
              appView.setProperty("/TypeOfEntity7", true);
              appView.setProperty("/TypeOfEntity8", false);
              appView.setProperty("/TypeOfEntity9", false);
          }else if(entityTypTitle && entityTypTitle == oModel.Pub_ltd_Comp){
              appView.setProperty("/TypeOfEntity1", false);
              appView.setProperty("/TypeOfEntity2", false);
              appView.setProperty("/TypeOfEntity3", false);
              appView.setProperty("/TypeOfEntity4", false);
              appView.setProperty("/TypeOfEntity5", false);
              appView.setProperty("/TypeOfEntity6", false);
              appView.setProperty("/TypeOfEntity7", false);
              appView.setProperty("/TypeOfEntity8", true);
              appView.setProperty("/TypeOfEntity9", false);
          }else if(entityTypTitle && entityTypTitle == oModel.Sole_Proprietorship){
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
        getDmsData: function (evt) {
          var serviceURL = oComponent.getModel("DMS").sServiceUrl;
                var oModel = new sap.ui.model.odata.ODataModel(serviceURL, true);
                var path = "/GetAllOriginals?LinkedSAPObjectKey='" + oComponent.zcustomer_num
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
                        oComponent.setModel(new JSONModel({}), "getDmsModel");
                        oComponent.getModel("getDmsModel").oData = flatObj;
                        oComponent.getModel("getDmsModel").updateBindings(true);
                    }.bind(oComponent), error: function (err) {

                    }
                });
        },

        handleRuleEngineConfiguration: function (oEvent) {
          oComponent.ruleId = "";
            var oModel = oComponent.getModel("RuleEngine");
            oModel.read("/Zdd_rule_engine", {
              urlParameters: {
                "$top": 10000
              },
              success: function (oData, oResponse) {
                for (var i = 0; i < oData.results.length; i++) {
                  if (oData.results[i].process === oComponent.process && oData.results[i].customer_type === sCustomerType.toUpperCase() && oData.results[i].zbusiness_partner_id === sBPGrouping.toUpperCase()) {
                    oComponent.ruleId = oData.results[i].rule_id;
                    console.log(oComponent.ruleId);

                  }
                }

                if (oComponent.ruleId == "" || oComponent.ruleId == undefined) {
                  MessageBox.confirm("Rule engine Configuration does not exist for the selected keys?", {
                    actions: [MessageBox.Action.OK, MessageBox.Action.CANCEL],
                    emphasizedAction: MessageBox.Action.OK,
                    onClose: function (sAction) {
                      if (sAction === "CANCEL") {
                        oFilterBar.getFilterItems()[1].getControl().setSelectedItem(null);
                      }
                      else {
                        oComponent.onCreate(oComponent.process, sCustomerType, sBPGrouping);
                      }
                    }.bind(oComponent)
                  });
                } else {
                  oComponent.onRead(oComponent.ruleId);
                }
              }.bind(oComponent),
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
              oComponent.setModel(new JSONModel({}), "fieldMappingModels");
              oComponent.getModel("fieldMappingModels").oData = flatObj;
              oComponent.getModel("fieldMappingModels").updateBindings(true);
              console.log(oComponent.getModel("fieldMappingModels").oData);
              oComponent.getModel().refresh(true);

            }.bind(oComponent),
            error: function (oError) {
              oComponent.setBusy(false);
            }.bind(oComponent)
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
            }.bind(oComponent),
            error: function (err) {

            }.bind(oComponent)
          });
        },
        onDescriptionSelect: function (oEvent) {
          var oCustomerDetailModel = oComponent.getModel("Customers");
          oCustomerDetailModel.setProperty("/zdescription", oEvent.getParameters().selectedIndex);
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
          oComponent._patchTaskInstance(decision);
          oComponent._refreshTaskList();
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
            data: JSON.stringify(data)
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

          oComponent.getComponentData().startupParameters.inboxInternal.updateTaskList();
        },

        initializeAppViewModel: function () {
          var oViewModel = new JSONModel({
            zcustNum:"",
            zsalesOrg:"",
            ztext:"",
            selectedType: 0,
            newCustId:"",
            custType:"Credit",
            customerType: 0,
            mode:"",
            selectedMode:false,
            distributionChannel:"",
            cca:"",
            bpg:"Sold To",
            process:"",
            salesFlag:false,
            blockedCmValue:"",
            content:"",
            token:"",
            firstTym:"",
            vertical:"Credit",
            generateSale:false,
            TypeOfEntity1: "",
            TypeOfEntity2: "",
            TypeOfEntity3: "",
            TypeOfEntity4: "",
            TypeOfEntity5: "",
            TypeOfEntity6: "",
            TypeOfEntity7: "",
            TypeOfEntity8: "",
            TypeOfEntity9: "",
            dmsFile:[{}]
          });
          oComponent.setModel(oViewModel, "appView");
          oComponent.getModel("appView").updateBindings(true);
        }
      }
    );
  }
);
