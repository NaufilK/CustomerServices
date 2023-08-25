{
	"contents": {
		"ec3dee35-6bd2-4334-a179-cfaa8c78635c": {
			"classDefinition": "com.sap.bpm.wfs.Model",
			"id": "changestewardchange",
			"subject": "changeStewardChange",
			"name": "changeStewardChange",
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
				"4d6859b3-952e-4706-920f-20bff63df87c": {
					"name": "getApprovers"
				},
				"641f5963-36a4-4b85-bd40-fa33f778b0e3": {
					"name": "determine approvers"
				},
				"def40aec-0af2-4dcc-913d-5aeb4306bd84": {
					"name": "ParallelGateway1"
				},
				"158e84cb-92fc-4996-b6c6-a8c85c445740": {
					"name": "BU Manager Approval"
				},
				"cd6e9b87-255e-463d-abe2-9bf0e3982590": {
					"name": "Notify BU"
				},
				"a6f02ad1-ec97-40a2-bf34-430f57cb0d06": {
					"name": "ParallelGateway2"
				},
				"e477dc59-f1c1-43f3-891d-db7ac44b4bec": {
					"name": "isApproved"
				},
				"4c9d10ba-a59d-4a55-b0e4-b96b14ce2980": {
					"name": "Finance Aprroval"
				},
				"143cafba-818b-4658-879d-3c11445741aa": {
					"name": "ParallelGateway3"
				},
				"9aa491d3-ee72-4f1a-b157-27799189b5c2": {
					"name": "Notify Finance"
				},
				"59edd26a-c572-4105-a5bc-420b22b3cdcd": {
					"name": "ParallelGateway4"
				},
				"1739feb4-9afd-4788-bd8d-b2256e83932e": {
					"name": "isApproved"
				},
				"98638e4a-1d3f-4fbd-b3a5-33ffe543e19a": {
					"name": "Notify request rejected"
				},
				"3adfba33-79f1-44d2-96e7-ea68240e1769": {
					"name": "Notify request rejected"
				}
			},
			"sequenceFlows": {
				"c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f": {
					"name": "SequenceFlow1"
				},
				"a526a7a7-33e2-4cec-9da2-4455528ad48e": {
					"name": "SequenceFlow2"
				},
				"dc472ed9-af65-49a0-8278-1ad8c45e1c1d": {
					"name": "SequenceFlow3"
				},
				"58e964d4-3088-4ae6-905f-b58f558501a2": {
					"name": "SequenceFlow4"
				},
				"c694e58a-4c71-420f-b1c7-a5973d91b357": {
					"name": "SequenceFlow6"
				},
				"d992b3e0-4e1b-4db2-a364-162b2c3c8f50": {
					"name": "SequenceFlow7"
				},
				"c70cfef1-d3a4-455d-8fa1-35b13cc4c05a": {
					"name": "SequenceFlow8"
				},
				"7377affd-470a-4f6f-9751-f0b22e735744": {
					"name": "SequenceFlow9"
				},
				"b0b66d90-7558-4739-ba61-8ac9c7dd802f": {
					"name": "Rejected"
				},
				"474968d9-e55d-42c0-8245-6ffea6234e84": {
					"name": "SequenceFlow12"
				},
				"bc63bfde-3fdf-42e9-8d6b-000e57259129": {
					"name": "Approved"
				},
				"84c51d8e-4ff7-4d6b-9086-ad2a42eef43e": {
					"name": "SequenceFlow14"
				},
				"8126afef-8e38-4d98-9028-8e6de038567e": {
					"name": "SequenceFlow17"
				},
				"ef0313e8-522d-4c83-9302-80e96a46e673": {
					"name": "SequenceFlow18"
				},
				"cabd62aa-d005-4643-a53f-3f027f583cfd": {
					"name": "SequenceFlow20"
				},
				"5b308e66-cfb1-4b2b-8256-0650fc3ee74c": {
					"name": "Approved"
				},
				"6bf8308f-c6eb-435f-bf7a-f9b1808960a2": {
					"name": "SequenceFlow22"
				},
				"e18665f5-63c3-429b-8320-7db2fd50c3f5": {
					"name": "SequenceFlow23"
				},
				"63850eb6-1f0c-477b-8b87-a69fd5167543": {
					"name": "SequenceFlow24"
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
				"8a46f991-977b-4224-b700-c24e04bd443f": {}
			}
		},
		"2798f4e7-bc42-4fad-a248-159095a2f40a": {
			"classDefinition": "com.sap.bpm.wfs.EndEvent",
			"id": "endevent1",
			"name": "EndEvent1"
		},
		"4d6859b3-952e-4706-920f-20bff63df87c": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "ABAP_COMMUNICATION_SYSTEM",
			"destinationSource": "consumer",
			"path": "/sap/opu/odata4/sap/zsb_wf_customer_v4/srvd_a2x/sap/zsd_wf_customer/0001/customer(${context.customerId})/_approvers_MD",
			"httpMethod": "GET",
			"responseVariable": "${context.approvers}",
			"id": "servicetask1",
			"name": "getApprovers"
		},
		"c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow1",
			"name": "SequenceFlow1",
			"sourceRef": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3",
			"targetRef": "4d6859b3-952e-4706-920f-20bff63df87c"
		},
		"a526a7a7-33e2-4cec-9da2-4455528ad48e": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow2",
			"name": "SequenceFlow2",
			"sourceRef": "4d6859b3-952e-4706-920f-20bff63df87c",
			"targetRef": "641f5963-36a4-4b85-bd40-fa33f778b0e3"
		},
		"42fa7a2d-c526-4a02-b3ba-49b5168ba644": {
			"classDefinition": "com.sap.bpm.wfs.ui.Diagram",
			"symbols": {
				"df898b52-91e1-4778-baad-2ad9a261d30e": {},
				"53e54950-7757-4161-82c9-afa7e86cff2c": {},
				"6bb141da-d485-4317-93b8-e17711df4c32": {},
				"ad79a3d7-7711-4184-9a06-0094dec5e5f5": {},
				"5d540a8a-bbbd-4635-a1cc-7dfaf9910188": {},
				"c19fb136-0d0b-4641-9b1f-bc064943ae46": {},
				"4ae1c3cf-a869-4632-99f6-d446641efc21": {},
				"97568d71-52a3-40fd-ae3e-2b1e586725c9": {},
				"24b58a85-cc3e-4c8f-8e87-737ff566cefc": {},
				"968a9c07-6001-45ad-ae7f-93acef0a133e": {},
				"f98faf39-0701-4b0a-86cb-a16fd277b202": {},
				"0f1e9bb5-83c7-4b6e-a0d6-96b569a754f8": {},
				"d826faec-d7c8-4bfa-9080-078a8deb89f4": {},
				"bf6a8c25-8c07-4d23-a377-1925187aa03c": {},
				"4b430dfe-7dbb-45d4-9e30-84d53c74f3a5": {},
				"51eaa468-8244-4972-ba66-1f207d75f07f": {},
				"54081d54-1dd1-44f6-9d46-a971fd63ddb1": {},
				"514026d3-4dac-4b50-ba73-dab18dce4a19": {},
				"87e81845-bf9f-4f75-bd95-eb80beda5ceb": {},
				"5b67ee1c-46ec-4074-af4b-1703ab48febe": {},
				"7a074da5-3e80-4dc9-935e-0971960c0dd7": {},
				"43233e67-dfa1-47ec-a0ad-47fea1641bf3": {},
				"000366dd-b9fe-492e-bd62-807ca97024a7": {},
				"743a2b09-68ac-4b6c-96f0-03bb39246de9": {},
				"e16edd68-71ef-405f-b320-ead788b0998d": {},
				"9ea1d20c-3ec1-4f90-b476-bdf4a19d3ad7": {},
				"e3bab927-b397-4442-9dfa-891fa419d90b": {},
				"8f0bd623-1737-4f14-b5e5-471e3cc78438": {},
				"2cb7196f-13d3-470e-a30a-c1e9e0c8b632": {},
				"2d96963e-1ffb-404c-b5a8-24accdb26589": {},
				"db240090-53c8-485d-8e80-dab623a5c32d": {},
				"37e656bd-df34-4d58-8696-074f9e587d36": {},
				"a1d5926a-5b1a-484c-a656-f8adbeff1f91": {},
				"032c78df-9f21-4b8d-9d8b-bf1f4805848f": {},
				"89e287b8-643a-493e-9813-1b1f7447f27c": {}
			}
		},
		"8a46f991-977b-4224-b700-c24e04bd443f": {
			"classDefinition": "com.sap.bpm.wfs.SampleContext",
			"reference": "/sample-data/changeStewardChange/dataStewardChange.json",
			"id": "default-start-context"
		},
		"df898b52-91e1-4778-baad-2ad9a261d30e": {
			"classDefinition": "com.sap.bpm.wfs.ui.StartEventSymbol",
			"x": 12,
			"y": 98.99999970197678,
			"width": 32,
			"height": 32,
			"object": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3"
		},
		"53e54950-7757-4161-82c9-afa7e86cff2c": {
			"classDefinition": "com.sap.bpm.wfs.ui.EndEventSymbol",
			"x": 1683.9999916553497,
			"y": 97.49999970197678,
			"width": 35,
			"height": 35,
			"object": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"6bb141da-d485-4317-93b8-e17711df4c32": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "44,114.99999970197678 94,114.99999970197678",
			"sourceSymbol": "df898b52-91e1-4778-baad-2ad9a261d30e",
			"targetSymbol": "ad79a3d7-7711-4184-9a06-0094dec5e5f5",
			"object": "c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f"
		},
		"ad79a3d7-7711-4184-9a06-0094dec5e5f5": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 94,
			"y": 84.99999970197678,
			"width": 100,
			"height": 60,
			"object": "4d6859b3-952e-4706-920f-20bff63df87c"
		},
		"5d540a8a-bbbd-4635-a1cc-7dfaf9910188": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "194,114.99999970197678 244,114.99999970197678",
			"sourceSymbol": "ad79a3d7-7711-4184-9a06-0094dec5e5f5",
			"targetSymbol": "c19fb136-0d0b-4641-9b1f-bc064943ae46",
			"object": "a526a7a7-33e2-4cec-9da2-4455528ad48e"
		},
		"62d7f4ed-4063-4c44-af8b-39050bd44926": {
			"classDefinition": "com.sap.bpm.wfs.LastIDs",
			"timereventdefinition": 1,
			"maildefinition": 4,
			"sequenceflow": 24,
			"startevent": 1,
			"endevent": 1,
			"usertask": 2,
			"servicetask": 1,
			"scripttask": 1,
			"mailtask": 4,
			"exclusivegateway": 2,
			"parallelgateway": 4
		},
		"641f5963-36a4-4b85-bd40-fa33f778b0e3": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/dataStewardChange/determineApprovers.js",
			"id": "scripttask1",
			"name": "determine approvers"
		},
		"c19fb136-0d0b-4641-9b1f-bc064943ae46": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 244,
			"y": 84.99999970197678,
			"width": 100,
			"height": 60,
			"object": "641f5963-36a4-4b85-bd40-fa33f778b0e3"
		},
		"dc472ed9-af65-49a0-8278-1ad8c45e1c1d": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow3",
			"name": "SequenceFlow3",
			"sourceRef": "641f5963-36a4-4b85-bd40-fa33f778b0e3",
			"targetRef": "def40aec-0af2-4dcc-913d-5aeb4306bd84"
		},
		"4ae1c3cf-a869-4632-99f6-d446641efc21": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "344,114.99999970197678 394,114.99999970197678",
			"sourceSymbol": "c19fb136-0d0b-4641-9b1f-bc064943ae46",
			"targetSymbol": "97568d71-52a3-40fd-ae3e-2b1e586725c9",
			"object": "dc472ed9-af65-49a0-8278-1ad8c45e1c1d"
		},
		"def40aec-0af2-4dcc-913d-5aeb4306bd84": {
			"classDefinition": "com.sap.bpm.wfs.ParallelGateway",
			"id": "parallelgateway1",
			"name": "ParallelGateway1"
		},
		"97568d71-52a3-40fd-ae3e-2b1e586725c9": {
			"classDefinition": "com.sap.bpm.wfs.ui.ParallelGatewaySymbol",
			"x": 394,
			"y": 93.99999970197678,
			"object": "def40aec-0af2-4dcc-913d-5aeb4306bd84"
		},
		"58e964d4-3088-4ae6-905f-b58f558501a2": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow4",
			"name": "SequenceFlow4",
			"sourceRef": "def40aec-0af2-4dcc-913d-5aeb4306bd84",
			"targetRef": "158e84cb-92fc-4996-b6c6-a8c85c445740"
		},
		"24b58a85-cc3e-4c8f-8e87-737ff566cefc": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "436,114.99999970197678 470.99999940395355,114.99999970197678 470.99999940395355,59.999999701976776 505.9999988079071,59.999999701976776",
			"sourceSymbol": "97568d71-52a3-40fd-ae3e-2b1e586725c9",
			"targetSymbol": "968a9c07-6001-45ad-ae7f-93acef0a133e",
			"object": "58e964d4-3088-4ae6-905f-b58f558501a2"
		},
		"158e84cb-92fc-4996-b6c6-a8c85c445740": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "Approve creation of a new customer (${context.customerName})",
			"priority": "MEDIUM",
			"isHiddenInLogForParticipant": false,
			"supportsForward": false,
			"userInterface": "sapui5://customerService.customerChangeUI/customerChangeUI",
			"recipientUsers": "${context.currentApprover}",
			"id": "usertask1",
			"name": "BU Manager Approval",
			"dueDateRef": "27c312fd-44c1-4294-91c7-7a0f557b4f80"
		},
		"968a9c07-6001-45ad-ae7f-93acef0a133e": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 505.9999988079071,
			"y": 29.999999701976776,
			"width": 100,
			"height": 60,
			"object": "158e84cb-92fc-4996-b6c6-a8c85c445740"
		},
		"cd6e9b87-255e-463d-abe2-9bf0e3982590": {
			"classDefinition": "com.sap.bpm.wfs.MailTask",
			"destinationSource": "consumer",
			"id": "mailtask1",
			"name": "Notify BU",
			"mailDefinitionRef": "6f241cff-b1d8-480e-8d85-354ca6c73c1a"
		},
		"f98faf39-0701-4b0a-86cb-a16fd277b202": {
			"classDefinition": "com.sap.bpm.wfs.ui.MailTaskSymbol",
			"x": 505.9999988079071,
			"y": 139.99999970197678,
			"width": 100,
			"height": 60,
			"object": "cd6e9b87-255e-463d-abe2-9bf0e3982590"
		},
		"c694e58a-4c71-420f-b1c7-a5973d91b357": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow6",
			"name": "SequenceFlow6",
			"sourceRef": "def40aec-0af2-4dcc-913d-5aeb4306bd84",
			"targetRef": "cd6e9b87-255e-463d-abe2-9bf0e3982590"
		},
		"0f1e9bb5-83c7-4b6e-a0d6-96b569a754f8": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "436,114.99999970197678 470.99999940395355,114.99999970197678 470.99999940395355,169.99999970197678 505.9999988079071,169.99999970197678",
			"sourceSymbol": "97568d71-52a3-40fd-ae3e-2b1e586725c9",
			"targetSymbol": "f98faf39-0701-4b0a-86cb-a16fd277b202",
			"object": "c694e58a-4c71-420f-b1c7-a5973d91b357"
		},
		"d992b3e0-4e1b-4db2-a364-162b2c3c8f50": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow7",
			"name": "SequenceFlow7",
			"sourceRef": "cd6e9b87-255e-463d-abe2-9bf0e3982590",
			"targetRef": "a6f02ad1-ec97-40a2-bf34-430f57cb0d06"
		},
		"d826faec-d7c8-4bfa-9080-078a8deb89f4": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "605.9999988079071,169.99999970197678 640.9999982118607,169.99999970197678 640.9999982118607,114.99999970197678 675.9999976158142,114.99999970197678",
			"sourceSymbol": "f98faf39-0701-4b0a-86cb-a16fd277b202",
			"targetSymbol": "bf6a8c25-8c07-4d23-a377-1925187aa03c",
			"object": "d992b3e0-4e1b-4db2-a364-162b2c3c8f50"
		},
		"27c312fd-44c1-4294-91c7-7a0f557b4f80": {
			"classDefinition": "com.sap.bpm.wfs.TimerEventDefinition",
			"timeDuration": "P14D",
			"id": "timereventdefinition1"
		},
		"6f241cff-b1d8-480e-8d85-354ca6c73c1a": {
			"classDefinition": "com.sap.bpm.wfs.MailDefinition",
			"name": "maildefinition1",
			"to": "${context.currentApprover}",
			"subject": "Master form change for a New customer (${context.customerName})",
			"reference": "/webcontent/dataStewardChange/notifyBU.html",
			"id": "maildefinition1"
		},
		"a6f02ad1-ec97-40a2-bf34-430f57cb0d06": {
			"classDefinition": "com.sap.bpm.wfs.ParallelGateway",
			"id": "parallelgateway2",
			"name": "ParallelGateway2"
		},
		"bf6a8c25-8c07-4d23-a377-1925187aa03c": {
			"classDefinition": "com.sap.bpm.wfs.ui.ParallelGatewaySymbol",
			"x": 675.9999976158142,
			"y": 93.99999970197678,
			"object": "a6f02ad1-ec97-40a2-bf34-430f57cb0d06"
		},
		"c70cfef1-d3a4-455d-8fa1-35b13cc4c05a": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow8",
			"name": "SequenceFlow8",
			"sourceRef": "a6f02ad1-ec97-40a2-bf34-430f57cb0d06",
			"targetRef": "e477dc59-f1c1-43f3-891d-db7ac44b4bec"
		},
		"4b430dfe-7dbb-45d4-9e30-84d53c74f3a5": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "717.9999976158142,114.99999970197678 767.9999976158142,114.99999970197678",
			"sourceSymbol": "bf6a8c25-8c07-4d23-a377-1925187aa03c",
			"targetSymbol": "54081d54-1dd1-44f6-9d46-a971fd63ddb1",
			"object": "c70cfef1-d3a4-455d-8fa1-35b13cc4c05a"
		},
		"7377affd-470a-4f6f-9751-f0b22e735744": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow9",
			"name": "SequenceFlow9",
			"sourceRef": "158e84cb-92fc-4996-b6c6-a8c85c445740",
			"targetRef": "a6f02ad1-ec97-40a2-bf34-430f57cb0d06"
		},
		"51eaa468-8244-4972-ba66-1f207d75f07f": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "605.9999988079071,59.999999701976776 640.9999982118607,59.999999701976776 640.9999982118607,114.99999970197678 675.9999976158142,114.99999970197678",
			"sourceSymbol": "968a9c07-6001-45ad-ae7f-93acef0a133e",
			"targetSymbol": "bf6a8c25-8c07-4d23-a377-1925187aa03c",
			"object": "7377affd-470a-4f6f-9751-f0b22e735744"
		},
		"e477dc59-f1c1-43f3-891d-db7ac44b4bec": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway1",
			"name": "isApproved",
			"default": "b0b66d90-7558-4739-ba61-8ac9c7dd802f"
		},
		"54081d54-1dd1-44f6-9d46-a971fd63ddb1": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": 767.9999976158142,
			"y": 93.99999970197678,
			"object": "e477dc59-f1c1-43f3-891d-db7ac44b4bec"
		},
		"b0b66d90-7558-4739-ba61-8ac9c7dd802f": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow10",
			"name": "Rejected",
			"sourceRef": "e477dc59-f1c1-43f3-891d-db7ac44b4bec",
			"targetRef": "3adfba33-79f1-44d2-96e7-ea68240e1769"
		},
		"514026d3-4dac-4b50-ba73-dab18dce4a19": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "809.9999976158142,114.99999970197678 844.9999970197678,114.99999970197678 844.9999970197678,68.99999970197678 879.9999964237213,68.99999970197678",
			"sourceSymbol": "54081d54-1dd1-44f6-9d46-a971fd63ddb1",
			"targetSymbol": "37e656bd-df34-4d58-8696-074f9e587d36",
			"object": "b0b66d90-7558-4739-ba61-8ac9c7dd802f"
		},
		"4c9d10ba-a59d-4a55-b0e4-b96b14ce2980": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "Approve change of a new customer (${context.customerName})",
			"priority": "MEDIUM",
			"isHiddenInLogForParticipant": false,
			"supportsForward": false,
			"userInterface": "sapui5://customerService.customerChangeUI/customerChangeUI",
			"recipientUsers": "${context.currentApprover}",
			"id": "usertask2",
			"name": "Finance Aprroval"
		},
		"87e81845-bf9f-4f75-bd95-eb80beda5ceb": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 1094.9999952316284,
			"y": 47.99999940395355,
			"width": 100,
			"height": 60,
			"object": "4c9d10ba-a59d-4a55-b0e4-b96b14ce2980"
		},
		"143cafba-818b-4658-879d-3c11445741aa": {
			"classDefinition": "com.sap.bpm.wfs.ParallelGateway",
			"id": "parallelgateway3",
			"name": "ParallelGateway3"
		},
		"5b67ee1c-46ec-4074-af4b-1703ab48febe": {
			"classDefinition": "com.sap.bpm.wfs.ui.ParallelGatewaySymbol",
			"x": 908.9999964237213,
			"y": 148.99999970197678,
			"object": "143cafba-818b-4658-879d-3c11445741aa"
		},
		"474968d9-e55d-42c0-8245-6ffea6234e84": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow12",
			"name": "SequenceFlow12",
			"sourceRef": "143cafba-818b-4658-879d-3c11445741aa",
			"targetRef": "4c9d10ba-a59d-4a55-b0e4-b96b14ce2980"
		},
		"7a074da5-3e80-4dc9-935e-0971960c0dd7": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "950.9999964237213,169.99999970197678 1059.9999958276749,169.99999970197678 1059.9999958276749,77.99999940395355 1094.9999952316284,77.99999940395355",
			"sourceSymbol": "5b67ee1c-46ec-4074-af4b-1703ab48febe",
			"targetSymbol": "87e81845-bf9f-4f75-bd95-eb80beda5ceb",
			"object": "474968d9-e55d-42c0-8245-6ffea6234e84"
		},
		"bc63bfde-3fdf-42e9-8d6b-000e57259129": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${usertasks.usertask1.last.decision == \"approve\"}",
			"id": "sequenceflow13",
			"name": "Approved",
			"sourceRef": "e477dc59-f1c1-43f3-891d-db7ac44b4bec",
			"targetRef": "143cafba-818b-4658-879d-3c11445741aa"
		},
		"43233e67-dfa1-47ec-a0ad-47fea1641bf3": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "809.9999976158142,114.99999970197678 844.9999970197678,114.99999970197678 844.9999970197678,169.99999970197678 908.9999964237213,169.99999970197678",
			"sourceSymbol": "54081d54-1dd1-44f6-9d46-a971fd63ddb1",
			"targetSymbol": "5b67ee1c-46ec-4074-af4b-1703ab48febe",
			"object": "bc63bfde-3fdf-42e9-8d6b-000e57259129"
		},
		"9aa491d3-ee72-4f1a-b157-27799189b5c2": {
			"classDefinition": "com.sap.bpm.wfs.MailTask",
			"destinationSource": "consumer",
			"id": "mailtask2",
			"name": "Notify Finance",
			"mailDefinitionRef": "b46d4980-73cd-4562-8555-747a2c3a11e8"
		},
		"000366dd-b9fe-492e-bd62-807ca97024a7": {
			"classDefinition": "com.sap.bpm.wfs.ui.MailTaskSymbol",
			"x": 1094.9999952316284,
			"y": 157.99999940395355,
			"width": 100,
			"height": 60,
			"object": "9aa491d3-ee72-4f1a-b157-27799189b5c2"
		},
		"84c51d8e-4ff7-4d6b-9086-ad2a42eef43e": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow14",
			"name": "SequenceFlow14",
			"sourceRef": "143cafba-818b-4658-879d-3c11445741aa",
			"targetRef": "9aa491d3-ee72-4f1a-b157-27799189b5c2"
		},
		"743a2b09-68ac-4b6c-96f0-03bb39246de9": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "950.9999964237213,169.99999970197678 1059.9999958276749,169.99999970197678 1059.9999958276749,187.99999940395355 1094.9999952316284,187.99999940395355",
			"sourceSymbol": "5b67ee1c-46ec-4074-af4b-1703ab48febe",
			"targetSymbol": "000366dd-b9fe-492e-bd62-807ca97024a7",
			"object": "84c51d8e-4ff7-4d6b-9086-ad2a42eef43e"
		},
		"59edd26a-c572-4105-a5bc-420b22b3cdcd": {
			"classDefinition": "com.sap.bpm.wfs.ParallelGateway",
			"id": "parallelgateway4",
			"name": "ParallelGateway4"
		},
		"e16edd68-71ef-405f-b320-ead788b0998d": {
			"classDefinition": "com.sap.bpm.wfs.ui.ParallelGatewaySymbol",
			"x": 1309.9999940395355,
			"y": 111.99999940395355,
			"object": "59edd26a-c572-4105-a5bc-420b22b3cdcd"
		},
		"1739feb4-9afd-4788-bd8d-b2256e83932e": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway2",
			"name": "isApproved",
			"default": "e18665f5-63c3-429b-8320-7db2fd50c3f5"
		},
		"9ea1d20c-3ec1-4f90-b476-bdf4a19d3ad7": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": 1401.9999940395355,
			"y": 111.99999940395355,
			"object": "1739feb4-9afd-4788-bd8d-b2256e83932e"
		},
		"8126afef-8e38-4d98-9028-8e6de038567e": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow17",
			"name": "SequenceFlow17",
			"sourceRef": "4c9d10ba-a59d-4a55-b0e4-b96b14ce2980",
			"targetRef": "59edd26a-c572-4105-a5bc-420b22b3cdcd"
		},
		"e3bab927-b397-4442-9dfa-891fa419d90b": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1194.9999952316284,77.99999940395355 1229.999994635582,77.99999940395355 1229.999994635582,132.99999940395355 1309.9999940395355,132.99999940395355",
			"sourceSymbol": "87e81845-bf9f-4f75-bd95-eb80beda5ceb",
			"targetSymbol": "e16edd68-71ef-405f-b320-ead788b0998d",
			"object": "8126afef-8e38-4d98-9028-8e6de038567e"
		},
		"ef0313e8-522d-4c83-9302-80e96a46e673": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow18",
			"name": "SequenceFlow18",
			"sourceRef": "9aa491d3-ee72-4f1a-b157-27799189b5c2",
			"targetRef": "59edd26a-c572-4105-a5bc-420b22b3cdcd"
		},
		"8f0bd623-1737-4f14-b5e5-471e3cc78438": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1194.9999952316284,187.99999940395355 1229.999994635582,187.99999940395355 1229.999994635582,132.99999940395355 1309.9999940395355,132.99999940395355",
			"sourceSymbol": "000366dd-b9fe-492e-bd62-807ca97024a7",
			"targetSymbol": "e16edd68-71ef-405f-b320-ead788b0998d",
			"object": "ef0313e8-522d-4c83-9302-80e96a46e673"
		},
		"cabd62aa-d005-4643-a53f-3f027f583cfd": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow20",
			"name": "SequenceFlow20",
			"sourceRef": "59edd26a-c572-4105-a5bc-420b22b3cdcd",
			"targetRef": "1739feb4-9afd-4788-bd8d-b2256e83932e"
		},
		"2cb7196f-13d3-470e-a30a-c1e9e0c8b632": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1351.9999940395355,132.99999940395355 1401.9999940395355,132.99999940395355",
			"sourceSymbol": "e16edd68-71ef-405f-b320-ead788b0998d",
			"targetSymbol": "9ea1d20c-3ec1-4f90-b476-bdf4a19d3ad7",
			"object": "cabd62aa-d005-4643-a53f-3f027f583cfd"
		},
		"5b308e66-cfb1-4b2b-8256-0650fc3ee74c": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${usertasks.usertask1.last.decision == \"approve\"}",
			"id": "sequenceflow21",
			"name": "Approved",
			"sourceRef": "1739feb4-9afd-4788-bd8d-b2256e83932e",
			"targetRef": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"2d96963e-1ffb-404c-b5a8-24accdb26589": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1443.9999940395355,132.99999940395355 1478.999993443489,132.99999940395355 1478.999993443489,179.99999910593033 1648.9999922513962,179.99999910593033 1648.9999922513962,114.99999970197678 1683.9999916553497,114.99999970197678",
			"sourceSymbol": "9ea1d20c-3ec1-4f90-b476-bdf4a19d3ad7",
			"targetSymbol": "53e54950-7757-4161-82c9-afa7e86cff2c",
			"object": "5b308e66-cfb1-4b2b-8256-0650fc3ee74c"
		},
		"b46d4980-73cd-4562-8555-747a2c3a11e8": {
			"classDefinition": "com.sap.bpm.wfs.MailDefinition",
			"name": "maildefinition2",
			"to": "${context.currentApprover}",
			"subject": "Master form change for a New customer (${context.customerName})",
			"text": "HTML",
			"id": "maildefinition2"
		},
		"98638e4a-1d3f-4fbd-b3a5-33ffe543e19a": {
			"classDefinition": "com.sap.bpm.wfs.MailTask",
			"destinationSource": "consumer",
			"id": "mailtask3",
			"name": "Notify request rejected",
			"mailDefinitionRef": "eb3217d7-4b5b-4aa3-abd7-b8d594fd719d"
		},
		"db240090-53c8-485d-8e80-dab623a5c32d": {
			"classDefinition": "com.sap.bpm.wfs.ui.MailTaskSymbol",
			"x": 1513.9999928474426,
			"y": 84.99999970197678,
			"width": 100,
			"height": 60,
			"object": "98638e4a-1d3f-4fbd-b3a5-33ffe543e19a"
		},
		"3adfba33-79f1-44d2-96e7-ea68240e1769": {
			"classDefinition": "com.sap.bpm.wfs.MailTask",
			"destinationSource": "consumer",
			"id": "mailtask4",
			"name": "Notify request rejected",
			"mailDefinitionRef": "87da6608-05a3-4d4b-8af7-4bcdb188f2e2"
		},
		"37e656bd-df34-4d58-8696-074f9e587d36": {
			"classDefinition": "com.sap.bpm.wfs.ui.MailTaskSymbol",
			"x": 879.9999964237213,
			"y": 38.999999701976776,
			"width": 100,
			"height": 60,
			"object": "3adfba33-79f1-44d2-96e7-ea68240e1769"
		},
		"6bf8308f-c6eb-435f-bf7a-f9b1808960a2": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow22",
			"name": "SequenceFlow22",
			"sourceRef": "3adfba33-79f1-44d2-96e7-ea68240e1769",
			"targetRef": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"a1d5926a-5b1a-484c-a656-f8adbeff1f91": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "979.9999964237213,68.99999970197678 1014.9999958276749,68.99999970197678 1014.9999958276749,12 1274.999994635582,12 1274.999994635582,76 1478.999993443489,76 1478.999993443489,49.000000298023224 1648.9999922513962,49.000000298023224 1648.9999922513962,114.99999970197678 1683.9999916553497,114.99999970197678",
			"sourceSymbol": "37e656bd-df34-4d58-8696-074f9e587d36",
			"targetSymbol": "53e54950-7757-4161-82c9-afa7e86cff2c",
			"object": "6bf8308f-c6eb-435f-bf7a-f9b1808960a2"
		},
		"87da6608-05a3-4d4b-8af7-4bcdb188f2e2": {
			"classDefinition": "com.sap.bpm.wfs.MailDefinition",
			"name": "maildefinition3",
			"to": "${context.submittedByUserId}",
			"subject": "Change of master data for a new customer (${context.customerName}) has been rejected",
			"reference": "/webcontent/dataStewardChange/notifyRequestRejected.html",
			"id": "maildefinition3"
		},
		"eb3217d7-4b5b-4aa3-abd7-b8d594fd719d": {
			"classDefinition": "com.sap.bpm.wfs.MailDefinition",
			"name": "maildefinition4",
			"to": "${context.submittedByUserId}",
			"subject": "Change of master data for a new customer (${context.customerName}) has been rejected",
			"reference": "/webcontent/dataStewardChange/notifyRequestRejected.html",
			"id": "maildefinition4"
		},
		"e18665f5-63c3-429b-8320-7db2fd50c3f5": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow23",
			"name": "SequenceFlow23",
			"sourceRef": "1739feb4-9afd-4788-bd8d-b2256e83932e",
			"targetRef": "98638e4a-1d3f-4fbd-b3a5-33ffe543e19a"
		},
		"032c78df-9f21-4b8d-9d8b-bf1f4805848f": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1443.9999940395355,132.99999940395355 1478.999993443489,132.99999940395355 1478.999993443489,114.99999970197678 1513.9999928474426,114.99999970197678",
			"sourceSymbol": "9ea1d20c-3ec1-4f90-b476-bdf4a19d3ad7",
			"targetSymbol": "db240090-53c8-485d-8e80-dab623a5c32d",
			"object": "e18665f5-63c3-429b-8320-7db2fd50c3f5"
		},
		"63850eb6-1f0c-477b-8b87-a69fd5167543": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow24",
			"name": "SequenceFlow24",
			"sourceRef": "98638e4a-1d3f-4fbd-b3a5-33ffe543e19a",
			"targetRef": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"89e287b8-643a-493e-9813-1b1f7447f27c": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1613.9999928474426,114.99999970197678 1683.9999916553497,114.99999970197678",
			"sourceSymbol": "db240090-53c8-485d-8e80-dab623a5c32d",
			"targetSymbol": "53e54950-7757-4161-82c9-afa7e86cff2c",
			"object": "63850eb6-1f0c-477b-8b87-a69fd5167543"
		}
	}
}