{
	"contents": {
		"e81f0b52-546c-43a9-a5f7-2086ab8f00db": {
			"classDefinition": "com.sap.bpm.wfs.Model",
			"id": "iffco.customerchange",
			"subject": "customerChange",
			"customAttributes": [{
				"id": "customerId",
				"label": "customerId",
				"type": "string",
				"value": "${context.customerId}"
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
			"name": "customerChange",
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
				"ad125241-3fcf-4475-baaa-ff33cfb8e722": {
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
				"76d9ea72-b34f-45d2-922f-812c46f6579c": {
					"name": "readViolation"
				},
				"0ba38a5f-41e4-406d-9ad1-d0c9579000c5": {
					"name": "isViolationThere"
				},
				"55ff7dde-82f5-432b-a836-ef78f71637dc": {
					"name": "defineNotificationTexts"
				},
				"4f7403d3-5452-4be4-9bc3-37f6f6b72c7a": {
					"name": "violationNotification"
				},
				"f1325af5-cbed-401d-8f60-b0f42cc2886b": {
					"name": "initialise"
				},
				"9008fda4-6640-492e-b212-90440cc83b8b": {
					"name": "switchOFF"
				}
			},
			"sequenceFlows": {
				"c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f": {
					"name": "SequenceFlow1"
				},
				"958aa658-ae43-4210-8d20-2275b24185bd": {
					"name": "SequenceFlow2"
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
				"0cd0ae90-9187-4c51-96e6-95f375f55cba": {
					"name": "SequenceFlow40"
				},
				"9ff7a277-d200-4309-a2d5-ac50fbb77442": {
					"name": "noViolation"
				},
				"f613bf5a-3fbe-4c44-9625-ed8a4fbb19ca": {
					"name": "SequenceFlow42"
				},
				"53de4319-1853-4e69-bb61-b30277d9ec7e": {
					"name": "SequenceFlow43"
				},
				"a68fa458-35ed-42ba-8b1e-fa41d9f8d712": {
					"name": "violationIsThere"
				},
				"cd504a59-1c17-4dcc-a01e-f36665a2c3bd": {
					"name": "SequenceFlow45"
				},
				"e1269605-bf97-4680-8d0f-832521642f86": {
					"name": "SequenceFlow46"
				},
				"e35517e9-f0bb-4b92-8a33-26bb24986e73": {
					"name": "SequenceFlow47"
				},
				"c6c75ba9-d58b-4288-a932-086cf519164a": {
					"name": "SequenceFlow48"
				},
				"ac2b1a4e-aa3c-403b-849c-20543f9a12a0": {
					"name": "SequenceFlow49"
				},
				"e3915251-8f0f-436a-8854-69382840cc16": {
					"name": "SequenceFlow50"
				},
				"dcc6acfd-8527-4645-92ff-ec7dbf5d22d6": {
					"name": "SequenceFlow51"
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
		"ad125241-3fcf-4475-baaa-ff33cfb8e722": {
			"classDefinition": "com.sap.bpm.wfs.BoundaryEvent",
			"isCanceling": true,
			"id": "boundarytimerevent6",
			"name": "BoundaryTimerEvent6",
			"attachedToRef": "350fe4a6-df14-45fc-bd76-7d5703fd7140",
			"eventDefinitions": {
				"e55b7274-9b9a-4ad0-939b-5c4be93291b0": {}
			}
		},
		"66fb6a8d-8703-4906-8f96-bea7967d87b2": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "ABAP_COMMUNICATION_SYSTEM",
			"destinationSource": "consumer",
			"path": "/sap/opu/odata4/sap/zsb_wf_customer_v4/srvd_a2x/sap/zsd_wf_customer/0001/customer(customer=${context.customerId})/_approvers",
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
			"path": "sap/opu/odata4/sap/zsb_wf_customer_v4/srvd_a2x/sap/zsd_wf_customer/0001/customer(customer=${context.customerId})/_create_customer",
			"httpMethod": "GET",
			"id": "servicetask2",
			"name": "updateCustomer"
		},
		"350fe4a6-df14-45fc-bd76-7d5703fd7140": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "Approve change of a new customer (${context.customerName})",
			"priority": "MEDIUM",
			"isHiddenInLogForParticipant": false,
			"supportsForward": false,
			"userInterface": "sapui5://customerService.customerChangeUI/customerChangeUI",
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
		"76d9ea72-b34f-45d2-922f-812c46f6579c": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "ABAP_COMMUNICATION_SYSTEM",
			"destinationSource": "consumer",
			"path": "/sap/opu/odata4/sap/zsb_violation_code_v4/srvd_a2x/sap/zsd_violation_code/0001/Violation_Code(zcustomer_num=${context.customerId},Reviewer_Mail='${context.currentApprover}')",
			"httpMethod": "GET",
			"responseVariable": "${context.violation}",
			"id": "servicetask4",
			"name": "readViolation"
		},
		"0ba38a5f-41e4-406d-9ad1-d0c9579000c5": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway3",
			"name": "isViolationThere",
			"default": "9ff7a277-d200-4309-a2d5-ac50fbb77442"
		},
		"55ff7dde-82f5-432b-a836-ef78f71637dc": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/defineNotificationTexts.js",
			"id": "scripttask3",
			"name": "defineNotificationTexts"
		},
		"4f7403d3-5452-4be4-9bc3-37f6f6b72c7a": {
			"classDefinition": "com.sap.bpm.wfs.MailTask",
			"destinationSource": "consumer",
			"id": "mailtask7",
			"name": "violationNotification",
			"mailDefinitionRef": "ccff2768-b9a3-4596-8292-620302b87f8d"
		},
		"f1325af5-cbed-401d-8f60-b0f42cc2886b": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/initialise.js",
			"id": "scripttask4",
			"name": "initialise"
		},
		"9008fda4-6640-492e-b212-90440cc83b8b": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway4",
			"name": "switchOFF",
			"default": "e35517e9-f0bb-4b92-8a33-26bb24986e73"
		},
		"c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow1",
			"name": "SequenceFlow1",
			"sourceRef": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3",
			"targetRef": "f1325af5-cbed-401d-8f60-b0f42cc2886b"
		},
		"958aa658-ae43-4210-8d20-2275b24185bd": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow2",
			"name": "SequenceFlow2",
			"sourceRef": "66fb6a8d-8703-4906-8f96-bea7967d87b2",
			"targetRef": "c5155940-1199-4c2d-98a3-80721dc6eb4e"
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
		"0cd0ae90-9187-4c51-96e6-95f375f55cba": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow40",
			"name": "SequenceFlow40",
			"sourceRef": "76d9ea72-b34f-45d2-922f-812c46f6579c",
			"targetRef": "0ba38a5f-41e4-406d-9ad1-d0c9579000c5"
		},
		"9ff7a277-d200-4309-a2d5-ac50fbb77442": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow41",
			"name": "noViolation",
			"sourceRef": "0ba38a5f-41e4-406d-9ad1-d0c9579000c5",
			"targetRef": "55ff7dde-82f5-432b-a836-ef78f71637dc"
		},
		"f613bf5a-3fbe-4c44-9625-ed8a4fbb19ca": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow42",
			"name": "SequenceFlow42",
			"sourceRef": "55ff7dde-82f5-432b-a836-ef78f71637dc",
			"targetRef": "430c0de6-1714-423f-956c-42fc2c6a456b"
		},
		"53de4319-1853-4e69-bb61-b30277d9ec7e": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow43",
			"name": "SequenceFlow43",
			"sourceRef": "4f7403d3-5452-4be4-9bc3-37f6f6b72c7a",
			"targetRef": "55ff7dde-82f5-432b-a836-ef78f71637dc"
		},
		"a68fa458-35ed-42ba-8b1e-fa41d9f8d712": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${context.violation != null && context.violation.Violation_Message != \"\"}",
			"id": "sequenceflow44",
			"name": "violationIsThere",
			"sourceRef": "0ba38a5f-41e4-406d-9ad1-d0c9579000c5",
			"targetRef": "4f7403d3-5452-4be4-9bc3-37f6f6b72c7a"
		},
		"cd504a59-1c17-4dcc-a01e-f36665a2c3bd": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow45",
			"name": "SequenceFlow45",
			"sourceRef": "ad125241-3fcf-4475-baaa-ff33cfb8e722",
			"targetRef": "a9e8ab33-18e2-4d27-9993-98c596c4f437"
		},
		"e1269605-bf97-4680-8d0f-832521642f86": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow46",
			"name": "SequenceFlow46",
			"sourceRef": "f1325af5-cbed-401d-8f60-b0f42cc2886b",
			"targetRef": "66fb6a8d-8703-4906-8f96-bea7967d87b2"
		},
		"e35517e9-f0bb-4b92-8a33-26bb24986e73": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow47",
			"name": "SequenceFlow47",
			"sourceRef": "9008fda4-6640-492e-b212-90440cc83b8b",
			"targetRef": "55ff7dde-82f5-432b-a836-ef78f71637dc"
		},
		"c6c75ba9-d58b-4288-a932-086cf519164a": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow48",
			"name": "SequenceFlow48",
			"sourceRef": "c5155940-1199-4c2d-98a3-80721dc6eb4e",
			"targetRef": "9008fda4-6640-492e-b212-90440cc83b8b"
		},
		"ac2b1a4e-aa3c-403b-849c-20543f9a12a0": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${context.violation != null}",
			"id": "sequenceflow49",
			"name": "SequenceFlow49",
			"sourceRef": "9008fda4-6640-492e-b212-90440cc83b8b",
			"targetRef": "76d9ea72-b34f-45d2-922f-812c46f6579c"
		},
		"e3915251-8f0f-436a-8854-69382840cc16": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow50",
			"name": "SequenceFlow50",
			"sourceRef": "b4178123-3f70-4563-9149-28b7038e714f",
			"targetRef": "8ea5cbb9-7d6b-4dd1-b03e-feefcc6400f3"
		},
		"dcc6acfd-8527-4645-92ff-ec7dbf5d22d6": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow51",
			"name": "SequenceFlow51",
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
				"760244bb-2738-4f52-9189-50c2e3fb1489": {},
				"c70e5752-a5bf-48b2-a652-b3e7be2bed66": {},
				"7706fb73-2023-4d3f-b522-b52138681630": {},
				"e5c59340-37ad-4dc6-9de1-d93e2c1c2a76": {},
				"9be8a455-4deb-4000-a6ac-9d03d930ef65": {},
				"1e4f81f3-7a5d-4b41-b7b2-f668bd5b7930": {},
				"89e8100c-8872-4330-9151-6409fbff5af3": {},
				"adc3deff-bd6c-4115-bb17-42f1561938ef": {},
				"438232fd-f073-4b51-a868-9ce8fb39c975": {},
				"e180f230-6541-4e00-b9ed-bdb476844bdf": {},
				"c00f60a7-e008-4a75-b98d-6eccd1591b28": {},
				"a044aef5-cc7a-4646-a046-fab9695cda40": {},
				"82630355-4594-41aa-a4c6-032397d2e311": {},
				"e1e8b7ff-e44b-4488-be8f-e5ebc4ca1549": {},
				"732207d7-8088-4fd1-856c-990ab299f246": {},
				"c20d5749-0be9-44c3-8c0a-b308ba20b254": {},
				"0bc4ae24-d9d6-44e5-9cd7-01cc45fd5783": {},
				"627624f0-a1e2-4ccb-ad2a-54f3e467bc17": {}
			}
		},
		"a8035138-0513-4321-807f-1e11ed3ba14b": {
			"classDefinition": "com.sap.bpm.wfs.SampleContext",
			"reference": "/sample-data/customerChangeUT.json",
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
		"e55b7274-9b9a-4ad0-939b-5c4be93291b0": {
			"classDefinition": "com.sap.bpm.wfs.TimerEventDefinition",
			"timeDuration": "P10D",
			"id": "timereventdefinition11"
		},
		"df898b52-91e1-4778-baad-2ad9a261d30e": {
			"classDefinition": "com.sap.bpm.wfs.ui.StartEventSymbol",
			"x": -677,
			"y": 166,
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
			"points": "-661,182 -568.5,182",
			"sourceSymbol": "df898b52-91e1-4778-baad-2ad9a261d30e",
			"targetSymbol": "c00f60a7-e008-4a75-b98d-6eccd1591b28",
			"object": "c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f"
		},
		"e146a847-3cd3-480d-8664-c59a8d78e8de": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": -486,
			"y": 152,
			"width": 100,
			"height": 60,
			"object": "66fb6a8d-8703-4906-8f96-bea7967d87b2"
		},
		"845a5d71-b4de-4f4e-8e4e-6af91bfa1fad": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "-386,182 -346,182",
			"sourceSymbol": "e146a847-3cd3-480d-8664-c59a8d78e8de",
			"targetSymbol": "2884ee95-2a1e-41c2-8b0c-4eb268aa5bd5",
			"object": "958aa658-ae43-4210-8d20-2275b24185bd"
		},
		"2884ee95-2a1e-41c2-8b0c-4eb268aa5bd5": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": -346,
			"y": 152,
			"width": 100,
			"height": 60,
			"object": "c5155940-1199-4c2d-98a3-80721dc6eb4e"
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
			"x": 517.9999988079071,
			"y": -19,
			"width": 100,
			"height": 60,
			"object": "467cf7fe-b32d-4e51-8a58-d8ac4dfddc84"
		},
		"7fde4b12-4e1f-4423-87a2-7b1c8b68729d": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "285,161.5 285,16 521,16",
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
				"f61288bd-2f71-4273-940b-9241f2e0e0a5": {}
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
			"points": "567.9999988079071,11 763,11",
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
			"points": "912.4999988079071,202.5 912.5,684 -296,684 -296,211.5",
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
		"760244bb-2738-4f52-9189-50c2e3fb1489": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": -210.25,
			"y": 152,
			"width": 100,
			"height": 60,
			"object": "76d9ea72-b34f-45d2-922f-812c46f6579c"
		},
		"c70e5752-a5bf-48b2-a652-b3e7be2bed66": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "-160.25,182 -53.875,182",
			"sourceSymbol": "760244bb-2738-4f52-9189-50c2e3fb1489",
			"targetSymbol": "7706fb73-2023-4d3f-b522-b52138681630",
			"object": "0cd0ae90-9187-4c51-96e6-95f375f55cba"
		},
		"7706fb73-2023-4d3f-b522-b52138681630": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": -74.875,
			"y": 161,
			"object": "0ba38a5f-41e4-406d-9ad1-d0c9579000c5"
		},
		"e5c59340-37ad-4dc6-9de1-d93e2c1c2a76": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "-33.375,182 120.8125,182",
			"sourceSymbol": "7706fb73-2023-4d3f-b522-b52138681630",
			"targetSymbol": "9be8a455-4deb-4000-a6ac-9d03d930ef65",
			"object": "9ff7a277-d200-4309-a2d5-ac50fbb77442"
		},
		"9be8a455-4deb-4000-a6ac-9d03d930ef65": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 120.3125,
			"y": 152,
			"width": 100,
			"height": 60,
			"object": "55ff7dde-82f5-432b-a836-ef78f71637dc"
		},
		"1e4f81f3-7a5d-4b41-b7b2-f668bd5b7930": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "170.3125,182 285,182",
			"sourceSymbol": "9be8a455-4deb-4000-a6ac-9d03d930ef65",
			"targetSymbol": "96170271-a514-4767-8e35-7c3f16688a41",
			"object": "f613bf5a-3fbe-4c44-9625-ed8a4fbb19ca"
		},
		"89e8100c-8872-4330-9151-6409fbff5af3": {
			"classDefinition": "com.sap.bpm.wfs.ui.MailTaskSymbol",
			"x": 20.46875,
			"y": 50,
			"width": 100,
			"height": 60,
			"object": "4f7403d3-5452-4be4-9bc3-37f6f6b72c7a"
		},
		"adc3deff-bd6c-4115-bb17-42f1561938ef": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "117.46875,80 171.15625,80 171.15625,153",
			"sourceSymbol": "89e8100c-8872-4330-9151-6409fbff5af3",
			"targetSymbol": "9be8a455-4deb-4000-a6ac-9d03d930ef65",
			"object": "53de4319-1853-4e69-bb61-b30277d9ec7e"
		},
		"438232fd-f073-4b51-a868-9ce8fb39c975": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "-53.875,161.5 -53.875,80 20.96875,80",
			"sourceSymbol": "7706fb73-2023-4d3f-b522-b52138681630",
			"targetSymbol": "89e8100c-8872-4330-9151-6409fbff5af3",
			"object": "a68fa458-35ed-42ba-8b1e-fa41d9f8d712"
		},
		"e180f230-6541-4e00-b9ed-bdb476844bdf": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "615.1985142246265,266.9867434640543 615.198486328125,406 285.5,406 285.4999988079071,355.5",
			"sourceSymbol": "f61288bd-2f71-4273-940b-9241f2e0e0a5",
			"targetSymbol": "5c1ecc18-71ab-4bc8-9156-02c77dbf8ae0",
			"object": "cd504a59-1c17-4dcc-a01e-f36665a2c3bd"
		},
		"c00f60a7-e008-4a75-b98d-6eccd1591b28": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": -618.5,
			"y": 152,
			"width": 100,
			"height": 60,
			"object": "f1325af5-cbed-401d-8f60-b0f42cc2886b"
		},
		"a044aef5-cc7a-4646-a046-fab9695cda40": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "-568.5,182 -436,182",
			"sourceSymbol": "c00f60a7-e008-4a75-b98d-6eccd1591b28",
			"targetSymbol": "e146a847-3cd3-480d-8664-c59a8d78e8de",
			"object": "e1269605-bf97-4680-8d0f-832521642f86"
		},
		"82630355-4594-41aa-a4c6-032397d2e311": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": -202,
			"y": 288,
			"object": "9008fda4-6640-492e-b212-90440cc83b8b"
		},
		"e1e8b7ff-e44b-4488-be8f-e5ebc4ca1549": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "-181,329.5 -181,380 170.3125,380 170.3125,211.5",
			"sourceSymbol": "82630355-4594-41aa-a4c6-032397d2e311",
			"targetSymbol": "9be8a455-4deb-4000-a6ac-9d03d930ef65",
			"object": "e35517e9-f0bb-4b92-8a33-26bb24986e73"
		},
		"732207d7-8088-4fd1-856c-990ab299f246": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "-248,182 -223.75,182 -223.75,308.5 -200,308.5",
			"sourceSymbol": "2884ee95-2a1e-41c2-8b0c-4eb268aa5bd5",
			"targetSymbol": "82630355-4594-41aa-a4c6-032397d2e311",
			"object": "c6c75ba9-d58b-4288-a932-086cf519164a"
		},
		"c20d5749-0be9-44c3-8c0a-b308ba20b254": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "-181,288.5 -181,250 -160.25,250 -160.25,211.5",
			"sourceSymbol": "82630355-4594-41aa-a4c6-032397d2e311",
			"targetSymbol": "760244bb-2738-4f52-9189-50c2e3fb1489",
			"object": "ac2b1a4e-aa3c-403b-849c-20543f9a12a0"
		},
		"0bc4ae24-d9d6-44e5-9cd7-01cc45fd5783": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "567.9999988079071,267 568,287.9381103515625 600,287.9381103515625 600,338.876220703125 569.6471196477843,338.876212290188",
			"sourceSymbol": "e569cc79-4067-45de-b1a7-942cadc9b027",
			"targetSymbol": "4980ae3b-58e6-49a4-a93d-d153ef9e50e7",
			"object": "e3915251-8f0f-436a-8854-69382840cc16"
		},
		"627624f0-a1e2-4ccb-ad2a-54f3e467bc17": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "483.1471196477843,308.876212290188 483.1471252441406,221 518.4999988079071,221",
			"sourceSymbol": "4980ae3b-58e6-49a4-a93d-d153ef9e50e7",
			"targetSymbol": "eaa00137-f797-40ca-91c1-0c3d9c9cd98c",
			"object": "dcc6acfd-8527-4645-92ff-ec7dbf5d22d6"
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
		"f61288bd-2f71-4273-940b-9241f2e0e0a5": {
			"classDefinition": "com.sap.bpm.wfs.ui.BoundaryEventSymbol",
			"x": 599.1985142246265,
			"y": 234.9867434640543,
			"object": "ad125241-3fcf-4475-baaa-ff33cfb8e722"
		},
		"62d7f4ed-4063-4c44-af8b-39050bd44926": {
			"classDefinition": "com.sap.bpm.wfs.LastIDs",
			"terminateeventdefinition": 2,
			"messageeventdefinition": 2,
			"message": 1,
			"timereventdefinition": 11,
			"maildefinition": 7,
			"escalationeventdefinition": 2,
			"intermediateescalationevent": 2,
			"sequenceflow": 51,
			"startevent": 1,
			"intermediatemessageevent": 2,
			"intermediatetimerevent": 2,
			"boundarytimerevent": 6,
			"endevent": 4,
			"usertask": 2,
			"servicetask": 4,
			"scripttask": 4,
			"mailtask": 7,
			"exclusivegateway": 4,
			"parallelgateway": 3
		},
		"fa3f0379-5ee5-4490-9f77-67f65cb332a1": {
			"classDefinition": "com.sap.bpm.wfs.MailDefinition",
			"name": "maildefinition1",
			"to": "${context.currentApprover}",
			"subject": "Change of a new customer (${context.customerName}) is awaiting to be approved",
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
			"cc": "${context.createdByUserId} ",
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
		},
		"ccff2768-b9a3-4596-8292-620302b87f8d": {
			"classDefinition": "com.sap.bpm.wfs.MailDefinition",
			"name": "maildefinition7",
			"to": "${context.currentApprover}",
			"cc": "${context.violation.Reviewer_Mail}",
			"subject": "Violation: Change of the customer (${context.customerName}) - ${context.violation.Violation_Message}",
			"text": "${context.violation.Violation_Message}",
			"id": "maildefinition7"
		}
	}
}