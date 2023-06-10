{
	"contents": {
		"e81f0b52-546c-43a9-a5f7-2086ab8f00db": {
			"classDefinition": "com.sap.bpm.wfs.Model",
			"id": "iffco.customerchangebulk",
			"subject": "customerChangeBulk",
			"customAttributes": [{
				"id": "bulkDocumentId",
				"label": "bulkDocumentId",
				"type": "string",
				"value": "${context.bulkDocumentId}"
			}, {
				"id": "currentApproverName",
				"label": "currentApproverName",
				"type": "string",
				"value": "${context.currentApproverName}"
			}, {
				"id": "currentApprover",
				"label": "currentApprover",
				"type": "string",
				"value": "${context.currentApprover}"
			}],
			"name": "customerChangeBulk",
			"documentation": "Main customer change process",
			"lastIds": "62d7f4ed-4063-4c44-af8b-39050bd44926",
			"events": {
				"11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3": {
					"name": "Start"
				},
				"2798f4e7-bc42-4fad-a248-159095a2f40a": {
					"name": "End"
				},
				"a9e8ab33-18e2-4d27-9993-98c596c4f437": {
					"name": "purge"
				},
				"368954ef-0247-4b9e-af51-bb805d462b4c": {
					"name": "BoundaryTimerEvent4"
				},
				"b4178123-3f70-4563-9149-28b7038e714f": {
					"name": "BoundaryTimerEvent5"
				},
				"80e1eb9c-d473-4367-8010-2a4971417b9a": {
					"name": "BoundaryTimerEvent6"
				}
			},
			"activities": {
				"66fb6a8d-8703-4906-8f96-bea7967d87b2": {
					"name": "ReadApprovers"
				},
				"c5155940-1199-4c2d-98a3-80721dc6eb4e": {
					"name": "getApprover"
				},
				"430c0de6-1714-423f-956c-42fc2c6a456b": {
					"name": "isApprovementPossible"
				},
				"467cf7fe-b32d-4e51-8a58-d8ac4dfddc84": {
					"name": "updateCustomer"
				},
				"350fe4a6-df14-45fc-bd76-7d5703fd7140": {
					"name": "approveRequest"
				},
				"4bcbb4fc-9c43-42e6-8c8e-1a8f9333e9d8": {
					"name": "isApproved"
				},
				"316e2675-cb6e-4726-820b-c51b341789ad": {
					"name": "ParallelGateway2"
				},
				"0d9ae261-84c7-4070-b298-72b11cde9ce7": {
					"name": "notifyApprover"
				},
				"a80ce3ed-4c27-4bed-9c8d-f62e2a568289": {
					"name": "ParallelGateway3"
				},
				"d26f4ce8-f4ff-4631-bc34-2007c2ae9ee6": {
					"name": "notifyRequestorSuccess"
				},
				"29c03e80-4781-4074-8552-f9186a47b914": {
					"name": "notifyRequestorRejected"
				},
				"8ea5cbb9-7d6b-4dd1-b03e-feefcc6400f3": {
					"name": "sendReminderToApprover"
				},
				"1279653f-1f6a-4a6b-b347-2e9d4d8c66ea": {
					"name": "initialise"
				}
			},
			"sequenceFlows": {
				"c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f": {
					"name": "SequenceFlow1"
				},
				"958aa658-ae43-4210-8d20-2275b24185bd": {
					"name": "SequenceFlow2"
				},
				"59f6b3fb-f0e6-467a-9455-83c20833d049": {
					"name": "SequenceFlow3"
				},
				"9f057f59-6eda-4cb9-be48-02720557251b": {
					"name": "noApprover"
				},
				"33c06ded-eafe-48b6-9003-89217ca943bd": {
					"name": "finallyApproved"
				},
				"8539e67d-f3ca-4ed8-966a-d14c2d6db27a": {
					"name": "approve"
				},
				"965a7380-3245-4030-80c1-980bb0a06139": {
					"name": "SequenceFlow8"
				},
				"9ed59499-ee79-43e7-ae41-fb1490a5c1bc": {
					"name": "isDeclined"
				},
				"1383f266-f21b-4639-9640-4d13135dc176": {
					"name": "approved"
				},
				"6b58124a-6ede-4fc3-8569-607c0273975c": {
					"name": "SequenceFlow21"
				},
				"38c408eb-6a2e-41e1-955b-b3c436b0c477": {
					"name": "SequenceFlow23"
				},
				"e459a5ed-0064-45a9-8e20-a58a4074d08f": {
					"name": "SequenceFlow24"
				},
				"618e31da-7139-4906-b3e7-2b7c5e5b91e8": {
					"name": "SequenceFlow25"
				},
				"d66e8b11-d74d-4665-84b3-4f999a957f64": {
					"name": "SequenceFlow26"
				},
				"2f147450-b7f7-48b3-a338-568d90dd4c09": {
					"name": "SequenceFlow27"
				},
				"8a7c728b-b836-458a-9456-67273e6336a4": {
					"name": "SequenceFlow28"
				},
				"5e9160c5-f57e-42f4-878f-7cd95364a9ab": {
					"name": "SequenceFlow29"
				},
				"91abb94f-4cc9-43bf-b839-deacaa63dba1": {
					"name": "SequenceFlow40"
				},
				"800a2da3-50ad-4ec7-8dec-6d29d0a4f76a": {
					"name": "SequenceFlow41"
				},
				"afe3a1f5-4895-4185-8b8d-90aed023e552": {
					"name": "SequenceFlow43"
				},
				"1c9bb402-f53f-4a8a-88c0-d38b3e027e42": {
					"name": "SequenceFlow44"
				}
			},
			"diagrams": {
				"42fa7a2d-c526-4a02-b3ba-49b5168ba644": {}
			}
		},
		"11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3": {
			"classDefinition": "com.sap.bpm.wfs.StartEvent",
			"id": "startevent1",
			"name": "Start",
			"sampleContextRefs": {
				"a8035138-0513-4321-807f-1e11ed3ba14b": {}
			}
		},
		"2798f4e7-bc42-4fad-a248-159095a2f40a": {
			"classDefinition": "com.sap.bpm.wfs.EndEvent",
			"id": "endevent1",
			"name": "End"
		},
		"a9e8ab33-18e2-4d27-9993-98c596c4f437": {
			"classDefinition": "com.sap.bpm.wfs.EndEvent",
			"id": "endevent2",
			"name": "purge",
			"eventDefinitions": {
				"f986b210-3a11-4998-809e-54fd3f052cf8": {}
			}
		},
		"368954ef-0247-4b9e-af51-bb805d462b4c": {
			"classDefinition": "com.sap.bpm.wfs.BoundaryEvent",
			"isCanceling": false,
			"id": "boundarytimerevent4",
			"name": "BoundaryTimerEvent4",
			"attachedToRef": "350fe4a6-df14-45fc-bd76-7d5703fd7140",
			"eventDefinitions": {
				"de32c999-1766-421d-b24e-a7968f7feb71": {}
			}
		},
		"b4178123-3f70-4563-9149-28b7038e714f": {
			"classDefinition": "com.sap.bpm.wfs.BoundaryEvent",
			"isCanceling": false,
			"id": "boundarytimerevent5",
			"name": "BoundaryTimerEvent5",
			"attachedToRef": "350fe4a6-df14-45fc-bd76-7d5703fd7140",
			"eventDefinitions": {
				"9a0a1027-5f67-4303-ab31-51083e607f2c": {}
			}
		},
		"80e1eb9c-d473-4367-8010-2a4971417b9a": {
			"classDefinition": "com.sap.bpm.wfs.BoundaryEvent",
			"isCanceling": true,
			"id": "boundarytimerevent6",
			"name": "BoundaryTimerEvent6",
			"attachedToRef": "350fe4a6-df14-45fc-bd76-7d5703fd7140",
			"eventDefinitions": {
				"3c04c844-f7a6-42e4-ad12-156d87bf8590": {}
			}
		},
		"66fb6a8d-8703-4906-8f96-bea7967d87b2": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "ABAP_COMMUNICATION_SYSTEM",
			"destinationSource": "consumer",
			"path": "/sap/opu/odata4/sap/zsb_wf_bulk_v4/srvd_a2x/sap/zsd_wf_bulk/0001/bulk(${context.bulkDocumentId})/_approvers",
			"httpMethod": "GET",
			"responseVariable": "${context.approvers}",
			"id": "servicetask1",
			"name": "ReadApprovers"
		},
		"c5155940-1199-4c2d-98a3-80721dc6eb4e": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/getApprover.js",
			"id": "scripttask1",
			"name": "getApprover"
		},
		"430c0de6-1714-423f-956c-42fc2c6a456b": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway1",
			"name": "isApprovementPossible",
			"default": "9f057f59-6eda-4cb9-be48-02720557251b"
		},
		"467cf7fe-b32d-4e51-8a58-d8ac4dfddc84": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "ABAP_COMMUNICATION_SYSTEM",
			"destinationSource": "consumer",
			"path": "/sap/opu/odata4/sap/zsb_wf_bulk_v4/srvd_a2x/sap/zsd_wf_bulk/0001/bulk(${context.bulkDocumentId})/_change_customers",
			"httpMethod": "GET",
			"headers": [{
				"name": "x-csrf-token",
				"value": "fetch"
			}],
			"id": "servicetask2",
			"name": "updateCustomer"
		},
		"350fe4a6-df14-45fc-bd76-7d5703fd7140": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "Approve a bulk change of customers",
			"priority": "MEDIUM",
			"isHiddenInLogForParticipant": false,
			"supportsForward": false,
			"userInterface": "sapui5://customerService.customerBulkUploadUI/customerBulkUploadUI",
			"recipientUsers": "${context.currentApprover}",
			"userInterfaceParams": [],
			"id": "approveRequest",
			"name": "approveRequest",
			"dueDateRef": "17e45ed4-e3ec-42b7-bfc4-3f3f128ccdc6"
		},
		"4bcbb4fc-9c43-42e6-8c8e-1a8f9333e9d8": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway2",
			"name": "isApproved",
			"default": "9ed59499-ee79-43e7-ae41-fb1490a5c1bc"
		},
		"316e2675-cb6e-4726-820b-c51b341789ad": {
			"classDefinition": "com.sap.bpm.wfs.ParallelGateway",
			"id": "parallelgateway2",
			"name": "ParallelGateway2"
		},
		"0d9ae261-84c7-4070-b298-72b11cde9ce7": {
			"classDefinition": "com.sap.bpm.wfs.MailTask",
			"destinationSource": "consumer",
			"id": "mailtask1",
			"name": "notifyApprover",
			"mailDefinitionRef": "fa3f0379-5ee5-4490-9f77-67f65cb332a1"
		},
		"a80ce3ed-4c27-4bed-9c8d-f62e2a568289": {
			"classDefinition": "com.sap.bpm.wfs.ParallelGateway",
			"id": "parallelgateway3",
			"name": "ParallelGateway3"
		},
		"d26f4ce8-f4ff-4631-bc34-2007c2ae9ee6": {
			"classDefinition": "com.sap.bpm.wfs.MailTask",
			"destinationSource": "consumer",
			"id": "mailtask2",
			"name": "notifyRequestorSuccess",
			"mailDefinitionRef": "f7437e1c-f877-4094-931b-af454fac5b98"
		},
		"29c03e80-4781-4074-8552-f9186a47b914": {
			"classDefinition": "com.sap.bpm.wfs.MailTask",
			"destinationSource": "consumer",
			"id": "mailtask3",
			"name": "notifyRequestorRejected",
			"mailDefinitionRef": "f935b688-928e-43bd-9111-c4d57ac08872"
		},
		"8ea5cbb9-7d6b-4dd1-b03e-feefcc6400f3": {
			"classDefinition": "com.sap.bpm.wfs.MailTask",
			"destinationSource": "consumer",
			"id": "mailtask4",
			"name": "sendReminderToApprover",
			"mailDefinitionRef": "c1746c8f-02c1-4a91-aa12-8368bcbe80c8"
		},
		"1279653f-1f6a-4a6b-b347-2e9d4d8c66ea": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/initialise.js",
			"id": "scripttask3",
			"name": "initialise"
		},
		"c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow1",
			"name": "SequenceFlow1",
			"sourceRef": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3",
			"targetRef": "1279653f-1f6a-4a6b-b347-2e9d4d8c66ea"
		},
		"958aa658-ae43-4210-8d20-2275b24185bd": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow2",
			"name": "SequenceFlow2",
			"sourceRef": "66fb6a8d-8703-4906-8f96-bea7967d87b2",
			"targetRef": "c5155940-1199-4c2d-98a3-80721dc6eb4e"
		},
		"59f6b3fb-f0e6-467a-9455-83c20833d049": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow3",
			"name": "SequenceFlow3",
			"sourceRef": "c5155940-1199-4c2d-98a3-80721dc6eb4e",
			"targetRef": "430c0de6-1714-423f-956c-42fc2c6a456b"
		},
		"9f057f59-6eda-4cb9-be48-02720557251b": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow5",
			"name": "noApprover",
			"sourceRef": "430c0de6-1714-423f-956c-42fc2c6a456b",
			"targetRef": "a9e8ab33-18e2-4d27-9993-98c596c4f437"
		},
		"33c06ded-eafe-48b6-9003-89217ca943bd": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${context.currentApprover != \"\" && context.currentState == \"finished\"}",
			"id": "sequenceflow6",
			"name": "finallyApproved",
			"sourceRef": "430c0de6-1714-423f-956c-42fc2c6a456b",
			"targetRef": "467cf7fe-b32d-4e51-8a58-d8ac4dfddc84"
		},
		"8539e67d-f3ca-4ed8-966a-d14c2d6db27a": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${context.currentApprover != \"\" && context.currentState != \"finished\"}",
			"id": "sequenceflow7",
			"name": "approve",
			"sourceRef": "430c0de6-1714-423f-956c-42fc2c6a456b",
			"targetRef": "316e2675-cb6e-4726-820b-c51b341789ad"
		},
		"965a7380-3245-4030-80c1-980bb0a06139": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow8",
			"name": "SequenceFlow8",
			"sourceRef": "467cf7fe-b32d-4e51-8a58-d8ac4dfddc84",
			"targetRef": "d26f4ce8-f4ff-4631-bc34-2007c2ae9ee6"
		},
		"9ed59499-ee79-43e7-ae41-fb1490a5c1bc": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow10",
			"name": "isDeclined",
			"sourceRef": "4bcbb4fc-9c43-42e6-8c8e-1a8f9333e9d8",
			"targetRef": "29c03e80-4781-4074-8552-f9186a47b914"
		},
		"1383f266-f21b-4639-9640-4d13135dc176": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${usertasks.approveRequest.last.decision == \"approve\"}",
			"id": "sequenceflow11",
			"name": "approved",
			"sourceRef": "4bcbb4fc-9c43-42e6-8c8e-1a8f9333e9d8",
			"targetRef": "c5155940-1199-4c2d-98a3-80721dc6eb4e"
		},
		"6b58124a-6ede-4fc3-8569-607c0273975c": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow21",
			"name": "SequenceFlow21",
			"sourceRef": "316e2675-cb6e-4726-820b-c51b341789ad",
			"targetRef": "0d9ae261-84c7-4070-b298-72b11cde9ce7"
		},
		"38c408eb-6a2e-41e1-955b-b3c436b0c477": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow23",
			"name": "SequenceFlow23",
			"sourceRef": "316e2675-cb6e-4726-820b-c51b341789ad",
			"targetRef": "350fe4a6-df14-45fc-bd76-7d5703fd7140"
		},
		"e459a5ed-0064-45a9-8e20-a58a4074d08f": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow24",
			"name": "SequenceFlow24",
			"sourceRef": "0d9ae261-84c7-4070-b298-72b11cde9ce7",
			"targetRef": "a80ce3ed-4c27-4bed-9c8d-f62e2a568289"
		},
		"618e31da-7139-4906-b3e7-2b7c5e5b91e8": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow25",
			"name": "SequenceFlow25",
			"sourceRef": "350fe4a6-df14-45fc-bd76-7d5703fd7140",
			"targetRef": "a80ce3ed-4c27-4bed-9c8d-f62e2a568289"
		},
		"d66e8b11-d74d-4665-84b3-4f999a957f64": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow26",
			"name": "SequenceFlow26",
			"sourceRef": "a80ce3ed-4c27-4bed-9c8d-f62e2a568289",
			"targetRef": "4bcbb4fc-9c43-42e6-8c8e-1a8f9333e9d8"
		},
		"2f147450-b7f7-48b3-a338-568d90dd4c09": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow27",
			"name": "SequenceFlow27",
			"sourceRef": "d26f4ce8-f4ff-4631-bc34-2007c2ae9ee6",
			"targetRef": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"8a7c728b-b836-458a-9456-67273e6336a4": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow28",
			"name": "SequenceFlow28",
			"sourceRef": "29c03e80-4781-4074-8552-f9186a47b914",
			"targetRef": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"5e9160c5-f57e-42f4-878f-7cd95364a9ab": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow29",
			"name": "SequenceFlow29",
			"sourceRef": "368954ef-0247-4b9e-af51-bb805d462b4c",
			"targetRef": "8ea5cbb9-7d6b-4dd1-b03e-feefcc6400f3"
		},
		"91abb94f-4cc9-43bf-b839-deacaa63dba1": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow40",
			"name": "SequenceFlow40",
			"sourceRef": "80e1eb9c-d473-4367-8010-2a4971417b9a",
			"targetRef": "a9e8ab33-18e2-4d27-9993-98c596c4f437"
		},
		"800a2da3-50ad-4ec7-8dec-6d29d0a4f76a": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow41",
			"name": "SequenceFlow41",
			"sourceRef": "1279653f-1f6a-4a6b-b347-2e9d4d8c66ea",
			"targetRef": "66fb6a8d-8703-4906-8f96-bea7967d87b2"
		},
		"afe3a1f5-4895-4185-8b8d-90aed023e552": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow43",
			"name": "SequenceFlow43",
			"sourceRef": "b4178123-3f70-4563-9149-28b7038e714f",
			"targetRef": "8ea5cbb9-7d6b-4dd1-b03e-feefcc6400f3"
		},
		"1c9bb402-f53f-4a8a-88c0-d38b3e027e42": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow44",
			"name": "SequenceFlow44",
			"sourceRef": "8ea5cbb9-7d6b-4dd1-b03e-feefcc6400f3",
			"targetRef": "350fe4a6-df14-45fc-bd76-7d5703fd7140"
		},
		"42fa7a2d-c526-4a02-b3ba-49b5168ba644": {
			"classDefinition": "com.sap.bpm.wfs.ui.Diagram",
			"symbols": {
				"df898b52-91e1-4778-baad-2ad9a261d30e": {},
				"53e54950-7757-4161-82c9-afa7e86cff2c": {},
				"6bb141da-d485-4317-93b8-e17711df4c32": {},
				"e146a847-3cd3-480d-8664-c59a8d78e8de": {},
				"845a5d71-b4de-4f4e-8e4e-6af91bfa1fad": {},
				"2884ee95-2a1e-41c2-8b0c-4eb268aa5bd5": {},
				"5fe9fda4-80c9-45ee-b484-5d8d7e0e3485": {},
				"96170271-a514-4767-8e35-7c3f16688a41": {},
				"5c1ecc18-71ab-4bc8-9156-02c77dbf8ae0": {},
				"8deca060-8778-47b2-b458-0f608b3ce628": {},
				"c651faf3-7438-4e9a-b55d-822d4a5dbee7": {},
				"7fde4b12-4e1f-4423-87a2-7b1c8b68729d": {},
				"eaa00137-f797-40ca-91c1-0c3d9c9cd98c": {},
				"02c94efd-52c0-41f4-b900-ea9fb95888ea": {},
				"5fc0aff8-e7e2-4c29-8c07-6c92e75b1086": {},
				"9de857dc-3b9f-4745-8212-38c9f6fc168a": {},
				"3c9049d5-ba1f-4464-9f71-a59d80538be6": {},
				"1601ef28-df51-440e-ab48-ae3e2b5ae088": {},
				"6ad80418-0472-499e-853b-6a8b95905a69": {},
				"6715f195-9a2a-4505-ac1a-d217b6f4e392": {},
				"3b2874c1-a287-4869-8fa5-fc4fab818847": {},
				"cc7921ea-05d3-4a0f-925a-421beee9266f": {},
				"cb609d78-1669-4507-a61f-9e262ea7e9e6": {},
				"efb8901a-cc55-4ecf-a281-c7678fc1ff09": {},
				"df4adeea-7ef1-4cc9-b64c-b0757e29dce1": {},
				"40529b22-b17b-42e7-a5e8-2843856dd895": {},
				"4bb3c874-34e2-4159-9d6c-0378bde0f773": {},
				"ec4d0dd6-a8e9-49b2-b60d-82e1f36e6c44": {},
				"bd912bbf-0fbd-4b7a-9b43-e8ff24fa353e": {},
				"509e26fa-4c83-44db-9e42-84781d2dd6a4": {},
				"4980ae3b-58e6-49a4-a93d-d153ef9e50e7": {},
				"961f3e7e-2417-4cd3-bb94-749f1e0eb6fd": {},
				"57815edf-2067-44f4-bd68-6254a3068dc4": {},
				"a72dffb2-0ee7-478c-8478-097c638c033f": {},
				"d4fbe94c-11ec-4c21-934c-8e6c4ea45a05": {},
				"32b395de-1fd3-4f12-acb7-59fb647c4459": {},
				"f23e167b-1230-4f2f-9180-fd17c88c8c91": {}
			}
		},
		"a8035138-0513-4321-807f-1e11ed3ba14b": {
			"classDefinition": "com.sap.bpm.wfs.SampleContext",
			"reference": "/sample-data/customerChangeBulkUT.json",
			"id": "default-start-context"
		},
		"f986b210-3a11-4998-809e-54fd3f052cf8": {
			"classDefinition": "com.sap.bpm.wfs.TerminateEventDefinition",
			"id": "terminateeventdefinition1"
		},
		"de32c999-1766-421d-b24e-a7968f7feb71": {
			"classDefinition": "com.sap.bpm.wfs.TimerEventDefinition",
			"timeDuration": "P7D",
			"id": "timereventdefinition7"
		},
		"9a0a1027-5f67-4303-ab31-51083e607f2c": {
			"classDefinition": "com.sap.bpm.wfs.TimerEventDefinition",
			"timeDuration": "P14D",
			"id": "timereventdefinition5"
		},
		"3c04c844-f7a6-42e4-ad12-156d87bf8590": {
			"classDefinition": "com.sap.bpm.wfs.TimerEventDefinition",
			"timeDuration": "P10D",
			"id": "timereventdefinition11"
		},
		"df898b52-91e1-4778-baad-2ad9a261d30e": {
			"classDefinition": "com.sap.bpm.wfs.ui.StartEventSymbol",
			"x": -222,
			"y": 170,
			"width": 32,
			"height": 32,
			"object": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3"
		},
		"53e54950-7757-4161-82c9-afa7e86cff2c": {
			"classDefinition": "com.sap.bpm.wfs.ui.EndEventSymbol",
			"x": 890.9999988079071,
			"y": -7,
			"width": 35,
			"height": 35,
			"object": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"6bb141da-d485-4317-93b8-e17711df4c32": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "-206,185 -103.0608303229204,185",
			"sourceSymbol": "df898b52-91e1-4778-baad-2ad9a261d30e",
			"targetSymbol": "a72dffb2-0ee7-478c-8478-097c638c033f",
			"object": "c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f"
		},
		"e146a847-3cd3-480d-8664-c59a8d78e8de": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": -22,
			"y": 152,
			"width": 100,
			"height": 60,
			"object": "66fb6a8d-8703-4906-8f96-bea7967d87b2"
		},
		"845a5d71-b4de-4f4e-8e4e-6af91bfa1fad": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "78,182 114,182",
			"sourceSymbol": "e146a847-3cd3-480d-8664-c59a8d78e8de",
			"targetSymbol": "2884ee95-2a1e-41c2-8b0c-4eb268aa5bd5",
			"object": "958aa658-ae43-4210-8d20-2275b24185bd"
		},
		"2884ee95-2a1e-41c2-8b0c-4eb268aa5bd5": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 114,
			"y": 152,
			"width": 100,
			"height": 60,
			"object": "c5155940-1199-4c2d-98a3-80721dc6eb4e"
		},
		"5fe9fda4-80c9-45ee-b484-5d8d7e0e3485": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "214,182 264,182",
			"sourceSymbol": "2884ee95-2a1e-41c2-8b0c-4eb268aa5bd5",
			"targetSymbol": "96170271-a514-4767-8e35-7c3f16688a41",
			"object": "59f6b3fb-f0e6-467a-9455-83c20833d049"
		},
		"96170271-a514-4767-8e35-7c3f16688a41": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": 264,
			"y": 161,
			"object": "430c0de6-1714-423f-956c-42fc2c6a456b"
		},
		"5c1ecc18-71ab-4bc8-9156-02c77dbf8ae0": {
			"classDefinition": "com.sap.bpm.wfs.ui.EndEventSymbol",
			"x": 267.9999988079071,
			"y": 321,
			"width": 35,
			"height": 35,
			"object": "a9e8ab33-18e2-4d27-9993-98c596c4f437"
		},
		"8deca060-8778-47b2-b458-0f608b3ce628": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "285.24999940395355,202.5 285.24999940395355,321.5",
			"sourceSymbol": "96170271-a514-4767-8e35-7c3f16688a41",
			"targetSymbol": "5c1ecc18-71ab-4bc8-9156-02c77dbf8ae0",
			"object": "9f057f59-6eda-4cb9-be48-02720557251b"
		},
		"c651faf3-7438-4e9a-b55d-822d4a5dbee7": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 520.9999988079071,
			"y": -19,
			"width": 100,
			"height": 60,
			"object": "467cf7fe-b32d-4e51-8a58-d8ac4dfddc84"
		},
		"7fde4b12-4e1f-4423-87a2-7b1c8b68729d": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "285,161.5 285,11 521.4999988079071,11",
			"sourceSymbol": "96170271-a514-4767-8e35-7c3f16688a41",
			"targetSymbol": "c651faf3-7438-4e9a-b55d-822d4a5dbee7",
			"object": "33c06ded-eafe-48b6-9003-89217ca943bd"
		},
		"eaa00137-f797-40ca-91c1-0c3d9c9cd98c": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 517.9999988079071,
			"y": 191,
			"width": 100,
			"height": 60,
			"object": "350fe4a6-df14-45fc-bd76-7d5703fd7140",
			"symbols": {
				"8e96ac8d-76c4-403a-baf0-f4c846b9c398": {},
				"e569cc79-4067-45de-b1a7-942cadc9b027": {},
				"198a5515-d251-4c5d-aa63-a26b6f0f61ab": {}
			}
		},
		"02c94efd-52c0-41f4-b900-ea9fb95888ea": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "302,181.5 417.99999940395355,181.5",
			"sourceSymbol": "96170271-a514-4767-8e35-7c3f16688a41",
			"targetSymbol": "6ad80418-0472-499e-853b-6a8b95905a69",
			"object": "8539e67d-f3ca-4ed8-966a-d14c2d6db27a"
		},
		"5fc0aff8-e7e2-4c29-8c07-6c92e75b1086": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "570.9999988079071,11 763,11",
			"sourceSymbol": "c651faf3-7438-4e9a-b55d-822d4a5dbee7",
			"targetSymbol": "4bb3c874-34e2-4159-9d6c-0378bde0f773",
			"object": "965a7380-3245-4030-80c1-980bb0a06139"
		},
		"9de857dc-3b9f-4745-8212-38c9f6fc168a": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": 891.4999988079071,
			"y": 161,
			"object": "4bcbb4fc-9c43-42e6-8c8e-1a8f9333e9d8"
		},
		"3c9049d5-ba1f-4464-9f71-a59d80538be6": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "912.2499994039536,182 912.2499994039536,102",
			"sourceSymbol": "9de857dc-3b9f-4745-8212-38c9f6fc168a",
			"targetSymbol": "bd912bbf-0fbd-4b7a-9b43-e8ff24fa353e",
			"object": "9ed59499-ee79-43e7-ae41-fb1490a5c1bc"
		},
		"1601ef28-df51-440e-ab48-ae3e2b5ae088": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "912.4999988079071,202.5 912.5,685 164,685 164,211.5",
			"sourceSymbol": "9de857dc-3b9f-4745-8212-38c9f6fc168a",
			"targetSymbol": "2884ee95-2a1e-41c2-8b0c-4eb268aa5bd5",
			"object": "1383f266-f21b-4639-9640-4d13135dc176"
		},
		"6ad80418-0472-499e-853b-6a8b95905a69": {
			"classDefinition": "com.sap.bpm.wfs.ui.ParallelGatewaySymbol",
			"x": 396.99999940395355,
			"y": 161,
			"object": "316e2675-cb6e-4726-820b-c51b341789ad"
		},
		"6715f195-9a2a-4505-ac1a-d217b6f4e392": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "438.49999940395355,182 478.5,182 478.5,140 568,140",
			"sourceSymbol": "6ad80418-0472-499e-853b-6a8b95905a69",
			"targetSymbol": "3b2874c1-a287-4869-8fa5-fc4fab818847",
			"object": "6b58124a-6ede-4fc3-8569-607c0273975c"
		},
		"3b2874c1-a287-4869-8fa5-fc4fab818847": {
			"classDefinition": "com.sap.bpm.wfs.ui.MailTaskSymbol",
			"x": 518,
			"y": 110,
			"width": 100,
			"height": 60,
			"object": "0d9ae261-84c7-4070-b298-72b11cde9ce7"
		},
		"cc7921ea-05d3-4a0f-925a-421beee9266f": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "438.49999940395355,182 478.5,182 478.5,221 518.4999988079071,221",
			"sourceSymbol": "6ad80418-0472-499e-853b-6a8b95905a69",
			"targetSymbol": "eaa00137-f797-40ca-91c1-0c3d9c9cd98c",
			"object": "38c408eb-6a2e-41e1-955b-b3c436b0c477"
		},
		"cb609d78-1669-4507-a61f-9e262ea7e9e6": {
			"classDefinition": "com.sap.bpm.wfs.ui.ParallelGatewaySymbol",
			"x": 681.5,
			"y": 161,
			"object": "a80ce3ed-4c27-4bed-9c8d-f62e2a568289"
		},
		"efb8901a-cc55-4ecf-a281-c7678fc1ff09": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "568,140 650,140 650,182 702.5,182",
			"sourceSymbol": "3b2874c1-a287-4869-8fa5-fc4fab818847",
			"targetSymbol": "cb609d78-1669-4507-a61f-9e262ea7e9e6",
			"object": "e459a5ed-0064-45a9-8e20-a58a4074d08f"
		},
		"df4adeea-7ef1-4cc9-b64c-b0757e29dce1": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "567.9999988079071,221 650,221 650,182.5 684.5,182.5",
			"sourceSymbol": "eaa00137-f797-40ca-91c1-0c3d9c9cd98c",
			"targetSymbol": "cb609d78-1669-4507-a61f-9e262ea7e9e6",
			"object": "618e31da-7139-4906-b3e7-2b7c5e5b91e8"
		},
		"40529b22-b17b-42e7-a5e8-2843856dd895": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "702.5,182 891.9999988079071,182",
			"sourceSymbol": "cb609d78-1669-4507-a61f-9e262ea7e9e6",
			"targetSymbol": "9de857dc-3b9f-4745-8212-38c9f6fc168a",
			"object": "d66e8b11-d74d-4665-84b3-4f999a957f64"
		},
		"4bb3c874-34e2-4159-9d6c-0378bde0f773": {
			"classDefinition": "com.sap.bpm.wfs.ui.MailTaskSymbol",
			"x": 713,
			"y": -19,
			"width": 100,
			"height": 60,
			"object": "d26f4ce8-f4ff-4631-bc34-2007c2ae9ee6"
		},
		"ec4d0dd6-a8e9-49b2-b60d-82e1f36e6c44": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "763,10.75 908.4999988079071,10.75",
			"sourceSymbol": "4bb3c874-34e2-4159-9d6c-0378bde0f773",
			"targetSymbol": "53e54950-7757-4161-82c9-afa7e86cff2c",
			"object": "2f147450-b7f7-48b3-a338-568d90dd4c09"
		},
		"bd912bbf-0fbd-4b7a-9b43-e8ff24fa353e": {
			"classDefinition": "com.sap.bpm.wfs.ui.MailTaskSymbol",
			"x": 862,
			"y": 72,
			"width": 100,
			"height": 60,
			"object": "29c03e80-4781-4074-8552-f9186a47b914"
		},
		"509e26fa-4c83-44db-9e42-84781d2dd6a4": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "910.2499994039536,102 910.2499994039536,10.5",
			"sourceSymbol": "bd912bbf-0fbd-4b7a-9b43-e8ff24fa353e",
			"targetSymbol": "53e54950-7757-4161-82c9-afa7e86cff2c",
			"object": "8a7c728b-b836-458a-9456-67273e6336a4"
		},
		"4980ae3b-58e6-49a4-a93d-d153ef9e50e7": {
			"classDefinition": "com.sap.bpm.wfs.ui.MailTaskSymbol",
			"x": 470.1471196477843,
			"y": 308.876212290188,
			"width": 100,
			"height": 60,
			"object": "8ea5cbb9-7d6b-4dd1-b03e-feefcc6400f3"
		},
		"961f3e7e-2417-4cd3-bb94-749f1e0eb6fd": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "520.8014833911877,266.98674346405437 520.801513671875,287.9314880371094 520.1470947265625,287.9314880371094 520.1471196477843,338.876212290188",
			"sourceSymbol": "8e96ac8d-76c4-403a-baf0-f4c846b9c398",
			"targetSymbol": "4980ae3b-58e6-49a4-a93d-d153ef9e50e7",
			"object": "5e9160c5-f57e-42f4-878f-7cd95364a9ab"
		},
		"57815edf-2067-44f4-bd68-6254a3068dc4": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "615.2817140540842,266.9867434640543 615.28173828125,406 285.5,406 285.4999988079071,355.5",
			"sourceSymbol": "198a5515-d251-4c5d-aa63-a26b6f0f61ab",
			"targetSymbol": "5c1ecc18-71ab-4bc8-9156-02c77dbf8ae0",
			"object": "91abb94f-4cc9-43bf-b839-deacaa63dba1"
		},
		"a72dffb2-0ee7-478c-8478-097c638c033f": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": -153.0608303229204,
			"y": 154,
			"width": 100,
			"height": 60,
			"object": "1279653f-1f6a-4a6b-b347-2e9d4d8c66ea"
		},
		"d4fbe94c-11ec-4c21-934c-8e6c4ea45a05": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "-103.0608303229204,183 28,183",
			"sourceSymbol": "a72dffb2-0ee7-478c-8478-097c638c033f",
			"targetSymbol": "e146a847-3cd3-480d-8664-c59a8d78e8de",
			"object": "800a2da3-50ad-4ec7-8dec-6d29d0a4f76a"
		},
		"32b395de-1fd3-4f12-acb7-59fb647c4459": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "567.9999988079071,267 568,287.9381103515625 598,287.9381103515625 598,338.876220703125 569.6471196477843,338.876212290188",
			"sourceSymbol": "e569cc79-4067-45de-b1a7-942cadc9b027",
			"targetSymbol": "4980ae3b-58e6-49a4-a93d-d153ef9e50e7",
			"object": "afe3a1f5-4895-4185-8b8d-90aed023e552"
		},
		"f23e167b-1230-4f2f-9180-fd17c88c8c91": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "482.1471196477843,308.876212290188 482.1471252441406,221 518.4999988079071,221",
			"sourceSymbol": "4980ae3b-58e6-49a4-a93d-d153ef9e50e7",
			"targetSymbol": "eaa00137-f797-40ca-91c1-0c3d9c9cd98c",
			"object": "1c9bb402-f53f-4a8a-88c0-d38b3e027e42"
		},
		"8e96ac8d-76c4-403a-baf0-f4c846b9c398": {
			"classDefinition": "com.sap.bpm.wfs.ui.BoundaryEventSymbol",
			"x": 504.80148339118773,
			"y": 234.98674346405434,
			"object": "368954ef-0247-4b9e-af51-bb805d462b4c"
		},
		"e569cc79-4067-45de-b1a7-942cadc9b027": {
			"classDefinition": "com.sap.bpm.wfs.ui.BoundaryEventSymbol",
			"x": 551.9999988079071,
			"y": 235,
			"object": "b4178123-3f70-4563-9149-28b7038e714f"
		},
		"198a5515-d251-4c5d-aa63-a26b6f0f61ab": {
			"classDefinition": "com.sap.bpm.wfs.ui.BoundaryEventSymbol",
			"x": 599.2817140540842,
			"y": 234.9867434640543,
			"object": "80e1eb9c-d473-4367-8010-2a4971417b9a"
		},
		"62d7f4ed-4063-4c44-af8b-39050bd44926": {
			"classDefinition": "com.sap.bpm.wfs.LastIDs",
			"terminateeventdefinition": 2,
			"messageeventdefinition": 2,
			"message": 1,
			"timereventdefinition": 11,
			"maildefinition": 6,
			"hubapireference": 1,
			"escalationeventdefinition": 2,
			"intermediateescalationevent": 2,
			"sequenceflow": 44,
			"startevent": 1,
			"intermediatemessageevent": 2,
			"intermediatetimerevent": 2,
			"boundarytimerevent": 6,
			"endevent": 4,
			"usertask": 1,
			"servicetask": 4,
			"scripttask": 3,
			"mailtask": 6,
			"exclusivegateway": 2,
			"parallelgateway": 3
		},
		"fa3f0379-5ee5-4490-9f77-67f65cb332a1": {
			"classDefinition": "com.sap.bpm.wfs.MailDefinition",
			"name": "maildefinition1",
			"to": "${context.currentApprover}",
			"subject": "Bulk change of customers is awaiting to be approved",
			"reference": "/webcontent/approverNotification.html",
			"id": "maildefinition1"
		},
		"f7437e1c-f877-4094-931b-af454fac5b98": {
			"classDefinition": "com.sap.bpm.wfs.MailDefinition",
			"name": "maildefinition2",
			"to": "${context.submittedByUserId}",
			"cc": "${context.createdByUserId}",
			"subject": "Change of a new customer (${context.customerName}) has been approved",
			"reference": "/webcontent/requestorNotificationApproved.html",
			"id": "maildefinition2"
		},
		"f935b688-928e-43bd-9111-c4d57ac08872": {
			"classDefinition": "com.sap.bpm.wfs.MailDefinition",
			"name": "maildefinition3",
			"to": "${context.submittedByUserId}",
			"cc": "${context.createdByUserId}",
			"subject": "Change of a new customer (${context.customerName}) has been rejected",
			"reference": "/webcontent/requestorNotificationRejected.html",
			"id": "maildefinition3"
		},
		"c1746c8f-02c1-4a91-aa12-8368bcbe80c8": {
			"classDefinition": "com.sap.bpm.wfs.MailDefinition",
			"name": "maildefinition5",
			"to": "${context.currentApprover}",
			"subject": "Reminder: Change of a new customer (${context.customerName}) is awaiting to be approved",
			"reference": "/webcontent/approverReminder.html",
			"id": "maildefinition5"
		},
		"17e45ed4-e3ec-42b7-bfc4-3f3f128ccdc6": {
			"classDefinition": "com.sap.bpm.wfs.TimerEventDefinition",
			"timeDuration": "P14D",
			"id": "timereventdefinition8"
		}
	}
}