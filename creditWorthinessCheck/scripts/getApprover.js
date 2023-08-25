if ($.context.currentApproverLevel == $.context.numberOfApprovers
    && $.context.currentApproverLevel != 0) {
    $.context.currentState = "finished";
    delete $.context.approvers;
    delete $.context.aApprovers;
} else {
    if ($.context.aApprovers.length == 0) {
        var aODataApprovers = $.context.approvers.value;

        if (aODataApprovers.length > 0) {
            for (var i = 0; i < aODataApprovers.length; i++) {
                var oApprover = { approverId: aODataApprovers[i].email, approverName: aODataApprovers[i].name };

                $.context.aApprovers.push(oApprover);
            }
        }

        $.context.numberOfApprovers = $.context.aApprovers.length;

        delete $.context.approvers;
    }

    $.context.lastApprover = $.context.currentApprover;
    $.context.lastApproverName = $.context.lastApproverName;

    $.context.currentApprover = $.context.aApprovers[$.context.currentApproverLevel].approverId;
    $.context.currentApproverName = $.context.aApprovers[$.context.currentApproverLevel].approverName;

    $.context.violationReviewer = $.context.currentApprover;
    $.context.violationReviewerName = $.context.currentApproverName;

    $.context.currentApproverLevel++;

    if ($.context.testMode) {
        $.context.currentApprover = "t_nithinsj@iffco.com";
    }
}