sap.ui.define([
    "sap/ui/core/mvc/Controller",
    'sap/ui/model/Filter',
	'sap/ui/model/FilterOperator',
	"sap/ui/core/Fragment",
    "sap/m/MessageBox",
    "customerChangeUI/formatter/formatter"
],
    /**
     * @param {typeof sap.ui.core.mvc.Controller} Controller
     */
    function (Controller, Filter, FilterOperator, Fragment, MessageBox, formatter) {
        "use strict";

        return Controller.extend("customerChangeUI.controller.View1", {
            formatter: formatter,
            onInit: function () {
                this.check1 = false;
                this.check2 = false;
                 this.busyDialog = new sap.m.BusyDialog();
                if (!this.ex) {
                    this.ex = new sap.ui.xmlfragment("customerChangeUI.fragments.ExistingCustomer", this);
                    this.getView().addDependent(this.ex);
                    this.ex.setModel(this.getOwnerComponent().getModel());
                }
                this.existingCustomerList();
                // var oFileUploader = this.getView().byId("fileUploader");
            //  oFileUploader.attachUploadComplete(this.onFileUploadComplete, this);

            },
            existingCustomerList:function(evt){
                // zbusiness_partner_id
                var serviceURL = this.getOwnerComponent().getModel("S4D111").sServiceUrl;
                var oModel = new sap.ui.model.odata.ODataModel(serviceURL, true);
                this.arr=[];

                oModel.read("/ExistingCustomerSet", {
                    success: function (oData, oResponse) {
                        var aCombinedData = [];
                        var aUniqueCustomers = [];
                        oData.results.forEach(function (oCustomer) {
                            if (!aUniqueCustomers.includes(oCustomer.zbusiness_partner_id)){
                                aUniqueCustomers.push(oCustomer.zbusiness_partner_id);
                                aCombinedData.push(oCustomer);
                            }
                        });
                    
                      
                    //   console.log(oData);
                      
                      this.getOwnerComponent().setModel(new sap.ui.model.json.JSONModel(aCombinedData), "existingCustomerSet");



                    }.bind(this),
                    error: function (error) {},
                  });
            },
            handleOK:function (evt) {
                var that=this;
                
                this.check2 = true;
                var busyDialog = new sap.m.BusyDialog();
                busyDialog.open();
                // if(that.getView().getModel("appView").getProperty("/selectedMode") === true){
                    
                //  var oModel = this.getOwnerComponent().getModel();
                // this.sPath = "/ZDD_CUSTOMER";
                // oModel.read(this.sPath, {
                //     filters: [
                //           new sap.ui.model.Filter("zbusiness_partner_id", "EQ", this.zbusinessPartnerId),
                //         ],
                //     success: function (oData, oResponse) {
                //         if(oData.results.length > 0){
                //             oData.results.sort((a, b) => b.zcreated_date - a.zcreated_date);
                //         for(var i=0; i<oData.results.length; i++){
                //             this.zcustNo = oData.results[i].zcustomer_num;
                //             this.zsales = oData.results[i].zsales_orgnization;
                //             this.reqType = oData.results[i].zrequest_type ? oData.results[i].zrequest_type : "";
                //             break;
                //         }
                //         if(this.reqType !== 'Change Customer' && this.reqType !== 'Extend Customer'){
                //             // busyDialog.open();
                //             var oRouter = this.getOwnerComponent().getRouter();
                //             oRouter.navTo("CustomerDetail",{
                //                 "zcustomer_legal_name": this.zcustomer_legal_name,
                //                 "zprocess": that.getView().getModel("appView").getProperty("/process"),
                //                 "mode" : "add",
                //                 "zbusinessPartnerId" : this.zbusinessPartnerId,
                //                 "zcustomer_num" : this.zcustNo,
                //                 "zsales_orgnization" : this.zsales
                //             });  
                //             if(!this.check1 && !this.checkB){
                //                 this.checkB  = true;
                //                 setTimeout(function () {
                //                     busyDialog.close();
                //                 }, 28000);
                //                 }else{
                //                     busyDialog.close(); 
                //                 }
                //         }else{
                //             busyDialog.close();
                //             MessageBox.error("The request is already in process");
                //         }
                //     }
                //         }.bind(this),
                //         error:function (error) {
                            
                        
                //     }
                    
                //     });


                // }else{
                //     busyDialog.close();
                //     MessageBox.error("Please select a customer to proceed");
                // }

                var oRouter = this.getOwnerComponent().getRouter();
                            oRouter.navTo("CustomerDetail",{
                                "zcustomer_legal_name": this.zcustomer_legal_name,
                                "zprocess": that.getView().getModel("appView").getProperty("/process"),
                                "mode" : "add",
                                "zbusinessPartnerId" : this.zbusinessPartnerId
                                // "zcustomer_num" : this.zcustNo
                            });  
                            if(!this.check1 && !this.checkB){
                                this.checkB  = true;
                                setTimeout(function () {
                                    busyDialog.close();
                                }, 28000);
                                }else{
                                    busyDialog.close(); 
                                }
                
            
            },
            handleBtnValidation:function () {
                var oModel = this.getOwnerComponent().getModel();
                this.sPath = "/ZDD_CUSTOMER";
                oModel.read(this.sPath, {
                    filters: [
                          new sap.ui.model.Filter("zbusiness_partner_id", "EQ", this.businessPartnerId),
                        ],
                    success: function (oData, oResponse) {
                        if(oData.results[0].zrequest_type === 'Change Customer' || oData.results[0].zrequest_type === 'Extend Customer'){

                        }
                    }.bind(this),
                    error : function (err) {
                        
                    }
            });
        },
        
            handleRequestnavigation: function(oEvent){
                this.check2 = true;
                var busyDialog = new sap.m.BusyDialog();
                busyDialog.open();
                var oRouter = this.getOwnerComponent().getRouter();
                
                oRouter.navTo("CustomerDetail",{
                    "zcustomer_num":oEvent.getSource().getBindingContext().getProperty("zcustomer_num"),
                    "zsales_orgnization": oEvent.getSource().getBindingContext().getProperty("zsales_orgnization"),
                    "zprocess": oEvent.getSource().getBindingContext().getProperty("zrequest_type"),
                    "zcustomer_legal_name": oEvent.getSource().getBindingContext().getProperty("zcustomer_legal_name"),
                    "mode":"edit", 
                    "bpg" : oEvent.getSource().getBindingContext().getProperty("zbusiness_partner_id_grouping"),
                    "zbusinessPartnerId" : oEvent.getSource().getBindingContext().getProperty("zbusiness_partner_id")

                });
                
                if(!this.check1 && !this.checkB){
                    this.checkB  = true;
                    setTimeout(function () {
                        busyDialog.close();
                    }, 28000);
                    }else{
                        busyDialog.close(); 
                    }
            },
            onSearch: function(){
                var oModel = this.getView().getModel();
                var oTable = this.getView().byId("table");
                var oFilter = this.getView().byId("filterbar");
                var aFilters = [];
                for(var i=0; i < oFilter.getAllFilterItems().length; i++){
                    var sName = oFilter.getAllFilterItems()[i].getProperty("name");
                    var sPath = "";
                    var dPath = "";
                    var sValue = "";
                    var sKeys = [];
                     if(sName === "Request Number"){
                        sPath = "zrequest_no";
                        sValue = oFilter.getAllFilterItems()[i].getControl().getValue();
                    }else if(sName === "Customer Name"){
                        sPath = "zfirst_name";
                        sValue = oFilter.getAllFilterItems()[i].getControl().getValue();
                        
                    } else if(sName === "Company Code"){
                        sPath = "zcompany_code";
                        sValue = oFilter.getAllFilterItems()[i].getControl().getValue();
                    }
                    else if(sName === "License Code"){
                        sPath = "zimport_license_number";
                        sValue = oFilter.getAllFilterItems()[i].getControl().getValue();
                    }
                    else if(sName == "Status"){
                        sPath = "zrequest_status";
                        sKeys = oFilter.getAllFilterItems()[i].getControl().getSelectedKeys();
                    }
                    else if(sName == "Business Unit"){
                        sPath = "zbusiness_unit_name";
                        sKeys = oFilter.getAllFilterItems()[i].getControl().getSelectedKeys();
                    }
                    else if(sName == "Request Type"){
                        sPath = "zrequest_type";
                        sKeys = oFilter.getAllFilterItems()[i].getControl().getSelectedKeys();
                    }
                    else if(sName == "Date Range"){
                        sPath = "zcreated_date";
                        dPath = "zupdated_date";
                        
                        var a = oFilter.getAllFilterItems()[i].getControl();
                        var from = a.mProperties.dateValue;
                        var to = a.mProperties.secondDateValue;
                        if(from != null){
                        aFilters.push(new Filter({ path: sPath, operator: FilterOperator.GE, value1: from }));
                        aFilters.push(new Filter({ path: dPath, operator: FilterOperator.LE, value1: to }));
                        }
                    }

                    if(sPath !== ""){
                        if(sValue !== ""){
                        aFilters.push(new Filter({ path: sPath, operator: FilterOperator.Contains, value1: sValue }));
                        }
                    if(sKeys.length > 0){
                        var aKeysFilter = [];
                        for(var j=0; j < sKeys.length; j++){
                            if(sKeys[j] !== "All"){
                                aKeysFilter.push(new Filter({ path: sPath, operator: FilterOperator.Contains, value1: sKeys[j] }));
                            }
                        }
                        if(aKeysFilter.length > 0){
                            aFilters.push(new Filter({
                                filters: aKeysFilter,
                                and: false
                            }));
                        }
                    }
                }
            }
                
                oTable.getBinding("items").filter(aFilters);

            },
            onSearchExist:function(){
                var oModel = this.getView().getModel();
                var oTable = this.ex;
                var oFilter = this.ex.getContent()[0];
                var aFilters = [];
                for(var i=0; i < oFilter.getAllFilterItems().length; i++){
                    var sName = oFilter.getAllFilterItems()[i].getProperty("name");
                    var sPath = "";
                    var dPath = "";
                    var sValue = "";
                    var sKeys = [];
                     if(sName === "Business Partner Id"){
                        sPath = "zbusiness_partner_id";
                        sValue = oFilter.getAllFilterItems()[i].getControl().getValue();
                    }else if(sName === "Customer Name"){
                        sPath = "zfirst_name";
                        sValue = oFilter.getAllFilterItems()[i].getControl().getValue();
                        
                    } else if(sName === "Company Code"){
                        sPath = "zcompany_code";
                        sValue = oFilter.getAllFilterItems()[i].getControl().getValue();
                    }
                    else if(sName === "Customer Legal Name"){
                        sPath = "zcustomer_legal_name";
                        sValue = oFilter.getAllFilterItems()[i].getControl().getValue();
                    }
                    else if(sName == "Status"){
                        sPath = "zrequest_status";
                        sKeys = oFilter.getAllFilterItems()[i].getControl().getSelectedKeys();
                    }
                    else if(sName == "Request Type"){
                        sPath = "zrequest_type";
                        sKeys = oFilter.getAllFilterItems()[i].getControl().getSelectedKeys();
                    }
                    if(sPath !== ""){
                        if(sValue !== ""){
                        aFilters.push(new Filter({ path: sPath, operator: FilterOperator.Contains, value1: sValue }));
                        }
                    if(sKeys.length > 0){
                        var aKeysFilter = [];
                        for(var j=0; j < sKeys.length; j++){
                            if(sKeys[j] !== "All"){
                                aKeysFilter.push(new Filter({ path: sPath, operator: FilterOperator.Contains, value1: sKeys[j] }));
                            }
                        }
                        if(aKeysFilter.length > 0){
                            aFilters.push(new Filter({
                                filters: aKeysFilter,
                                and: false
                            }));
                        }
                    }
                }
            }
                
            oTable.getContent()[1].getBinding("items").filter(aFilters);
                // this.ex.getContent()[1].getBinding("items").filter(aFilters);
                // this.ex.getContent()[1].getBinding("items").filter(aFilters)
            },
            handleEditCustomer: function (oEvent) {
                var oButton = oEvent.getSource(),
                    oView = this.getView();
    
                if (!this._pDialog) {
                    this._pDialog = Fragment.load({
                        id: oView.getId(),
                        name: "customerChangeUI.fragments.LegalName",
                        controller: this
                    }).then(function (oDialog){
                        oDialog.setModel(oView.getModel("LegalName"));
                        return oDialog;
                    });
                }
    
                this._pDialog.then(function(oDialog){
                    // this._configDialog(oButton, oDialog);
                    oDialog.open();
                }.bind(this));
    
            },

            onDialogClose: function (oEvent) {
                var aContexts = oEvent.getParameter("selectedContexts");
                // if (aContexts && aContexts.length) {
                //     MessageToast.show("You have chosen " + aContexts.map(function (oContext) { return oContext.getObject().Name; }).join(", "));
                // } else {
                //     MessageToast.show("No new item was selected.");
                // }
                oEvent.getSource().getBinding("items").filter([]);
            },
    
            handleChangeCustomer: function(oEvent){
                this.getView().getModel("appView").setProperty("/process", 'CHANGE');
                this.ex.open();
                
            },
        handleExtendCustomer: function(oEvent){
            this.getView().getModel("appView").setProperty("/process", 'EXTEND');
            this.ex.open();
            
    },
    handleCancel:function () {
        this.ex.close();
    },
        getSelections:function (evt) {
            var that=this;
            that.getView().getModel("appView").setProperty("/selectedMode", evt.getParameters().selected);
            this.zcustomer_legal_name = evt.getSource().getSelectedContexts()[0].getObject().zcustomer_legal_name;
            this.zbusinessPartnerId = evt.getSource().getSelectedContexts()[0].getObject().zbusiness_partner_id;
        },
        handleBulkRequest:function (evt) {
            this.bulkRequest.open();
        },
        handleUploadPress:function (evt) {
            console.log(evt);
        },
    //     handleFileUpload:function (evt) {
    //         var that=this;
    //         this.fileType = evt.getParameters().files[0].type
    //         var reader = new FileReader();
	// 		reader.onload = function (e) {
    //             console.log("e");
	// 	that.vContent = e.currentTarget.result.replace("data:" + this.fileType + ";base64,", "");
    //     console.log(that.vContent);
    //     }
    // },
    // onFileUploadComplete: function(oEvent) {
    //     var sResponse = oEvent.getParameter("response");
    //     if (sResponse) {
    //         var oData = JSON.parse(sResponse);
    //         // store the uploaded file data in a model
    //         var oModel = this.getView().getModel();
    //         oModel.setProperty("/fileData", oData);
    //         this.getView().getModel().getData();
    //     }
    // },
    // onProcessFilePress: function() {
    //     var oModel = this.getView().getModel();
    //     var oFileData = oModel.getProperty("/fileData");
    //     // process the uploaded file data
    //     // ...
    // },
    onFileUploadComplete: function(oEvent) {
			console.log("ji");
    },
    handleFileUpload:function (evt) {
        this.getOwnerComponent().setModel(new sap.ui.model.json.JSONModel([]), "attachmentsDataModel");
        this.fileName = evt.getParameters().files[0].name
        this.fileType = evt.getParameters().files[0];
        this.file = evt.getParameters().files[0].type;
        this.batchAttachments = [];
        console.log(this.file);
        var reader = new FileReader();
							reader.readAsDataURL(this.fileType);
                             reader.onload = function(e) {
                           
                                    console.log("a");
                            this.vContent = e.currentTarget.result.replace("data:" + this.file + ";base64,", "");

                            this.getView().getModel("appView").setProperty("/content",e.currentTarget.result.replace("data:" + this.file + ";base64,", ""));
                            console.log(this.vContent);

                            this.arr=[{
                                "Filename" : this.fileName,
                                "Attachment" : this.getView().getModel("appView").getProperty("/content")
                            }]
                            
                            }.bind(this)

    },
    onProcessFilePress: function(evt){
      console.log("est");
    },
    handleUploadPress: function() {
        var serviceURL = this.getOwnerComponent().getModel().sServiceUrl;
        var oModel = new sap.ui.model.odata.ODataModel(serviceURL, true);
        this.arr.forEach(function (obj) {
            this.batchAttachments.push(oModel.createBatchOperation("/zdd_upload2", "POST", obj));
        }.bind(this))
        oModel.addBatchChangeOperations(this.batchAttachments);
                oModel.submitBatch(function (data) {

                }, function (err) {
                    // sap.m.MessageBox.error("Internal Server Error");
                    // that.getView().setBusy(false);
                });
        // var payload={
        //     "Filename" : this.fileName,
        //     "Attachment" : this.getView().getModel("appView").getProperty("/content")
        // }
        // this.getView().getModel().create("/zdd_upload2",payload,{
        //     success: function (oData, oResponse) {
        //         console.log("200");
        //     }.bind(this),
        //     error:function (err) {
                
        //     }
        // })
        // var oFileUploader = sap.ui.getCore().byId("fileUploader");
        // oFileUploader.checkFileReadable().then(function() {
        //     oFileUploader.upload();
        // }, function(error) {
        //     sap.m.MessageToast.show("The file cannot be read. It may have changed.");
        // }).then(function() {
        //     // oFileUploader.clear();
        // });
    },
    handleUploadComplete: function(oEvent) {
        var sResponse = oEvent.getParameter("response"),
            iHttpStatusCode = parseInt(/\d{3}/.exec(sResponse)[0]),
            sMessage;

        if (sResponse) {
            sMessage = iHttpStatusCode === 200 ? sResponse + " (Upload Success)" : sResponse + " (Upload Error)";
            sap.m.MessageToast.show(sMessage);
        }
    }
        });
    });
    