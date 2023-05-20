sap.ui.define(
  [
    "sap/ui/core/UIComponent",
    "sap/ui/Device",
    "customerBulkUploadUI/model/models",
    "sap/ui/model/json/JSONModel",
    "sap/m/MessageBox"
  ],
  function (UIComponent, Device, models, JSONModel, MessageBox) {
    "use strict";

    var oComponent;

    return UIComponent.extend(
      "customerBulkUploadUI.Component",
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

          // enable routing
          this.getRouter().initialize();

          // set the device model
          this.setModel(models.createDeviceModel(), "device");
          this.setModel(new JSONModel({}), "local");

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

        setCustomerData: function (result) {
          var oModel = this.getModel("local");
          var oDataModel = this.getModel();
          if (result && result.bulkDocumentId) {
            var sBulkDocumentID = result.bulkDocumentId;
            var oFilter1 = new sap.ui.model.Filter("identifier", 'EQ', sBulkDocumentID);
            oDataModel.read("/zdd_cust_mass_upload_view", {
              filters: [oFilter1],
              success: function (oData) {
                oModel.setData(oData);
                

              }, 
              error : function (oError) {
                MessageBox.error(oError);
              }
            });
          } else {
            MessageBox.error("Bulk Documnet ID not Found!");
          }

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
        }
      }
    );
  }
);
