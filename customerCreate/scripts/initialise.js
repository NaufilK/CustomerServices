$.context.aApprovers = [];
$.context.numberOfApprovers = 0;
$.context.currentApprover = "";
$.context.currentApproverName = "";
$.context.currentApproverLevel = 0; 
$.context.currentState = "running";
$.context.currentApproverRemarks = "";

var taskID = $.info.workflowInstanceId;
var linkToTask = $.context.linkToTask;

$.context.linkToTask = linkToTask.replaceAll("<taskID>", taskID);

$.context.infoStartedBy = $.info.startedBy;