if ($.context.currentApproverLevel == 0) {
	$.context.notificationText = "There is a credit form created by " + $.context.createdByRole + " " +
		$.context.createdByName + " (" + $.context.createdByUserId + ")" + " on " + $.context.createdOn + " with below mentioned details.";

	$.context.notificationTextRemarksInMail = "";
}
else {
	$.context.notificationText = "Please review the credit form approved by " + $.context.lastApproverName + " (" + $.context.lastApprover + ")" + " and provide your approval.";

	if ($.context.currentApproverRemarks != "") {
		$.context.notificationTextRemarksInMail = "Remarks by " + $.context.lastApproverName + " (" + $.context.lastApprover + ")" + ": " + $.context.currentApproverRemarks;
	}
}
