{
	"contents": {
		"8af54cd8-83c9-4fc2-8c31-da445ff430e0": {
			"classDefinition": "com.sap.bpm.wfs.Model",
			"id": "iffco.annualappraisal",
			"subject": "annualAppraisal",
			"name": "annualAppraisal",
			"documentation": "",
			"lastIds": "62d7f4ed-4063-4c44-af8b-39050bd44926",
			"events": {
				"11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3": {
					"name": "StartEvent1"
				},
				"2798f4e7-bc42-4fad-a248-159095a2f40a": {
					"name": "EndEvent1"
				}
			},
			"activities": {
				"9f812b48-a5cd-4e4a-b85e-d056d0fcc063": {
					"name": "Get annual appraisal approver"
				},
				"58620ac2-95c6-4f2e-beb2-68c85ae44729": {
					"name": "creditController"
				}
			},
			"sequenceFlows": {
				"c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f": {
					"name": "SequenceFlow1"
				},
				"4a46510a-d7b2-41c0-bcd0-53d87d474ac9": {
					"name": "SequenceFlow2"
				},
				"ec49aad8-8fe6-4fc1-bd56-28c16184448b": {
					"name": "SequenceFlow3"
				}
			},
			"diagrams": {
				"42fa7a2d-c526-4a02-b3ba-49b5168ba644": {}
			}
		},
		"11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3": {
			"classDefinition": "com.sap.bpm.wfs.StartEvent",
			"id": "startevent1",
			"name": "StartEvent1",
			"sampleContextRefs": {
				"abb19b73-e5a4-4991-8031-63d48b1a0174": {}
			}
		},
		"2798f4e7-bc42-4fad-a248-159095a2f40a": {
			"classDefinition": "com.sap.bpm.wfs.EndEvent",
			"id": "endevent1",
			"name": "EndEvent1"
		},
		"9f812b48-a5cd-4e4a-b85e-d056d0fcc063": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "ABAP_COMMUNICATION_SYSTEM",
			"destinationSource": "consumer",
			"httpMethod": "GET",
			"id": "servicetask1",
			"name": "Get annual appraisal approver"
		},
		"58620ac2-95c6-4f2e-beb2-68c85ae44729": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "Annual appraisal of a customer (${context.customerName})",
			"priority": "MEDIUM",
			"isHiddenInLogForParticipant": false,
			"supportsForward": false,
			"userInterface": "sapui5://comsapbpmworkflow.comsapbpmwusformplayer/com.sap.bpm.wus.form.player",
			"recipientUsers": "${context.currentApprover}",
			"formReference": "/forms/ApproveForm.form",
			"userInterfaceParams": [{
				"key": "formId",
				"value": "approveform"
			}, {
				"key": "formRevision",
				"value": "1.0"
			}],
			"id": "usertask1",
			"name": "creditController"
		},
		"c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow1",
			"name": "SequenceFlow1",
			"sourceRef": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3",
			"targetRef": "9f812b48-a5cd-4e4a-b85e-d056d0fcc063"
		},
		"4a46510a-d7b2-41c0-bcd0-53d87d474ac9": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow2",
			"name": "SequenceFlow2",
			"sourceRef": "9f812b48-a5cd-4e4a-b85e-d056d0fcc063",
			"targetRef": "58620ac2-95c6-4f2e-beb2-68c85ae44729"
		},
		"ec49aad8-8fe6-4fc1-bd56-28c16184448b": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow3",
			"name": "SequenceFlow3",
			"sourceRef": "58620ac2-95c6-4f2e-beb2-68c85ae44729",
			"targetRef": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"42fa7a2d-c526-4a02-b3ba-49b5168ba644": {
			"classDefinition": "com.sap.bpm.wfs.ui.Diagram",
			"symbols": {
				"df898b52-91e1-4778-baad-2ad9a261d30e": {},
				"53e54950-7757-4161-82c9-afa7e86cff2c": {},
				"6bb141da-d485-4317-93b8-e17711df4c32": {},
				"a4c7c0f1-8464-44ff-a3d0-500b74979024": {},
				"26c43c75-4c98-40b9-b288-dcb845c440c6": {},
				"7d862716-2b76-457d-87cf-231f2f67b87e": {},
				"6723c616-e36b-40c1-8649-f43669fd0d84": {}
			}
		},
		"abb19b73-e5a4-4991-8031-63d48b1a0174": {
			"classDefinition": "com.sap.bpm.wfs.SampleContext",
			"reference": "/sample-data/annualAppraisal/annualAppraisalUT.json",
			"id": "default-start-context"
		},
		"df898b52-91e1-4778-baad-2ad9a261d30e": {
			"classDefinition": "com.sap.bpm.wfs.ui.StartEventSymbol",
			"x": 12,
			"y": 26,
			"width": 32,
			"height": 32,
			"object": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3"
		},
		"53e54950-7757-4161-82c9-afa7e86cff2c": {
			"classDefinition": "com.sap.bpm.wfs.ui.EndEventSymbol",
			"x": 394,
			"y": 24.5,
			"width": 35,
			"height": 35,
			"object": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"6bb141da-d485-4317-93b8-e17711df4c32": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "44,42 94,42",
			"sourceSymbol": "df898b52-91e1-4778-baad-2ad9a261d30e",
			"targetSymbol": "a4c7c0f1-8464-44ff-a3d0-500b74979024",
			"object": "c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f"
		},
		"a4c7c0f1-8464-44ff-a3d0-500b74979024": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 94,
			"y": 12,
			"width": 100,
			"height": 60,
			"object": "9f812b48-a5cd-4e4a-b85e-d056d0fcc063"
		},
		"26c43c75-4c98-40b9-b288-dcb845c440c6": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "194,42 244,42",
			"sourceSymbol": "a4c7c0f1-8464-44ff-a3d0-500b74979024",
			"targetSymbol": "7d862716-2b76-457d-87cf-231f2f67b87e",
			"object": "4a46510a-d7b2-41c0-bcd0-53d87d474ac9"
		},
		"7d862716-2b76-457d-87cf-231f2f67b87e": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 244,
			"y": 12,
			"width": 100,
			"height": 60,
			"object": "58620ac2-95c6-4f2e-beb2-68c85ae44729"
		},
		"6723c616-e36b-40c1-8649-f43669fd0d84": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "344,42 394,42",
			"sourceSymbol": "7d862716-2b76-457d-87cf-231f2f67b87e",
			"targetSymbol": "53e54950-7757-4161-82c9-afa7e86cff2c",
			"object": "ec49aad8-8fe6-4fc1-bd56-28c16184448b"
		},
		"62d7f4ed-4063-4c44-af8b-39050bd44926": {
			"classDefinition": "com.sap.bpm.wfs.LastIDs",
			"sequenceflow": 3,
			"startevent": 1,
			"endevent": 1,
			"usertask": 1,
			"servicetask": 1
		}
	}
}