{
	"contents": {
		"3f104f1a-6ae1-4598-a969-bf4e44e41371": {
			"classDefinition": "com.sap.bpm.wfs.Model",
			"id": "datasteward",
			"subject": "dataSteward",
			"name": "dataSteward",
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
				"fb7fb5e1-0658-4840-90c9-dbbe8b41c8d0": {
					"name": "BU manager Approval"
				},
				"317154f2-c1b4-4fff-b107-11b1cefec86f": {
					"name": "ParallelGateway1"
				},
				"4b2806c2-1d6b-4121-81a0-59cd40cfb6aa": {
					"name": "notifyApprover"
				},
				"35b044ef-ea3a-484a-b4a9-671c252648df": {
					"name": "ParallelGateway2"
				},
				"94659d9c-54c6-4ef5-917e-2231f11337bc": {
					"name": "Finance Approval"
				},
				"6c5a6243-04d3-45c6-ba07-d46828013d76": {
					"name": "notifyApprover"
				},
				"a6a83d47-05e5-4afd-85fb-6c66b0db6dbe": {
					"name": "ExclusiveGateway1"
				},
				"2c83d028-047f-4ddf-a85e-4e3854029423": {
					"name": "notifyRequestorRejected"
				},
				"fc659aa6-a1e4-499a-9b89-bd40ce87ba1a": {
					"name": "Read approvers"
				},
				"af0b927b-4af7-4fa3-90cb-1ae3bcf06ee5": {
					"name": "ExclusiveGateway2"
				},
				"03fa0c1f-7ccb-4b87-9dba-686c166339dd": {
					"name": "create customer"
				},
				"3ca23ae0-9361-47d4-85a2-c4b0f6d23126": {
					"name": "notifyRequestorSuccess"
				},
				"5c212b1d-805b-4ddc-826e-c69cab374148": {
					"name": "notifyRequestorRejected"
				},
				"ecb5fe5a-6bdf-46ab-b0c6-e0552df4889b": {
					"name": "getApprover"
				},
				"d9726cf4-f28b-459e-9a2e-a95a6ed47e80": {
					"name": "ParallelGateway3"
				},
				"0ab9668c-430f-484f-9af1-1633398d1a56": {
					"name": "ParallelGateway4"
				}
			},
			"sequenceFlows": {
				"c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f": {
					"name": "SequenceFlow1"
				},
				"afe4a5ed-4456-46b9-95f9-f348f6ce2898": {
					"name": "SequenceFlow5"
				},
				"5a002e32-cb5b-49f6-a84f-a00e9f2ae41f": {
					"name": "SequenceFlow6"
				},
				"1fa9f1b8-642c-41a5-999c-a38e8251ccbe": {
					"name": "SequenceFlow16"
				},
				"1c526880-f6c1-4d4e-9315-fb8ac69d8c9e": {
					"name": "isApproved"
				},
				"29b4817d-9569-4681-93b9-8e183d3b7b61": {
					"name": "SequenceFlow18"
				},
				"dc04e40e-f843-401b-8145-24c6bd746dc4": {
					"name": "SequenceFlow19"
				},
				"3c44ecfe-cefc-4b31-acd8-8f78092ea78f": {
					"name": "isRejected"
				},
				"2fe02eae-c6f5-4496-8b4f-4364598c6d9b": {
					"name": "SequenceFlow23"
				},
				"61901eed-5952-42d5-b391-10a2023f0f6a": {
					"name": "Finally approved"
				},
				"0cb6090c-b802-46fe-b18b-a17e25104974": {
					"name": "SequenceFlow26"
				},
				"355ffa08-d28b-4476-89e9-05fe3e90d3d3": {
					"name": "SequenceFlow27"
				},
				"a478d111-1453-4e28-bf98-9e958728915b": {
					"name": "SequenceFlow28"
				},
				"b8bd1ff5-8be0-47ed-bf50-29f8862645a8": {
					"name": "SequenceFlow29"
				},
				"cce3b9ef-af9a-469a-9246-22b3ab833235": {
					"name": "SequenceFlow31"
				},
				"7919d6a3-ee8e-4b81-8e98-be2a6379f719": {
					"name": "SequenceFlow32"
				},
				"6526f8a5-a539-43d1-8daf-fb1ff56468de": {
					"name": "SequenceFlow33"
				},
				"bd91ecb5-8fd8-4aee-8657-83a6b9a4db7e": {
					"name": "SequenceFlow34"
				},
				"bcab712b-902c-41bb-9e63-11da79eca060": {
					"name": "SequenceFlow35"
				},
				"fca7c4e2-01d5-44c0-a094-b136a789ada2": {
					"name": "SequenceFlow36"
				},
				"922231a6-c63f-4c56-99a3-a2994256986a": {
					"name": "SequenceFlow37"
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
				"ac09533a-b197-478f-9abb-a7242ea84ab9": {}
			}
		},
		"2798f4e7-bc42-4fad-a248-159095a2f40a": {
			"classDefinition": "com.sap.bpm.wfs.EndEvent",
			"id": "endevent1",
			"name": "EndEvent1"
		},
		"fb7fb5e1-0658-4840-90c9-dbbe8b41c8d0": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "Approve creation of a new customer (${context.customerName})",
			"priority": "MEDIUM",
			"isHiddenInLogForParticipant": false,
			"supportsForward": false,
			"userInterface": "sapui5://customerService.customerReviewcustomerServiceUI/customerReview.customerServiceUI",
			"recipientUsers": "${context.currentApprover}",
			"userInterfaceParams": [],
			"id": "usertask1",
			"name": "BU manager Approval",
			"dueDateRef": "e6a5e94c-19b6-436a-8bc2-c26ac8580093"
		},
		"317154f2-c1b4-4fff-b107-11b1cefec86f": {
			"classDefinition": "com.sap.bpm.wfs.ParallelGateway",
			"id": "parallelgateway1",
			"name": "ParallelGateway1"
		},
		"4b2806c2-1d6b-4121-81a0-59cd40cfb6aa": {
			"classDefinition": "com.sap.bpm.wfs.MailTask",
			"destinationSource": "consumer",
			"id": "mailtask1",
			"name": "notifyApprover",
			"mailDefinitionRef": "573183bb-ca38-4eb0-a29a-7dab19bdc181"
		},
		"35b044ef-ea3a-484a-b4a9-671c252648df": {
			"classDefinition": "com.sap.bpm.wfs.ParallelGateway",
			"id": "parallelgateway2",
			"name": "ParallelGateway2"
		},
		"94659d9c-54c6-4ef5-917e-2231f11337bc": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "Approve creation of a new customer (${context.customerName})",
			"priority": "MEDIUM",
			"isHiddenInLogForParticipant": false,
			"supportsForward": false,
			"userInterface": "sapui5://customerService.customerReviewcustomerServiceUI/customerReview.customerServiceUI",
			"recipientUsers": "${context.currentApprover}",
			"userInterfaceParams": [],
			"id": "usertask2",
			"name": "Finance Approval"
		},
		"6c5a6243-04d3-45c6-ba07-d46828013d76": {
			"classDefinition": "com.sap.bpm.wfs.MailTask",
			"destinationSource": "consumer",
			"id": "mailtask2",
			"name": "notifyApprover",
			"mailDefinitionRef": "0cce3b03-a4cf-47a9-9d06-1f3b178bd4c1"
		},
		"a6a83d47-05e5-4afd-85fb-6c66b0db6dbe": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway1",
			"name": "ExclusiveGateway1",
			"default": "3c44ecfe-cefc-4b31-acd8-8f78092ea78f"
		},
		"2c83d028-047f-4ddf-a85e-4e3854029423": {
			"classDefinition": "com.sap.bpm.wfs.MailTask",
			"destinationSource": "consumer",
			"id": "mailtask3",
			"name": "notifyRequestorRejected",
			"mailDefinitionRef": "98c0bc37-cb17-4b34-a7fc-282d1b391ba3"
		},
		"fc659aa6-a1e4-499a-9b89-bd40ce87ba1a": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "ABAP_COMMUNICATION_SYSTEM",
			"destinationSource": "consumer",
			"path": "/sap/opu/odata4/sap/zsb_wf_customer_v4/srvd_a2x/sap/zsd_wf_customer/0001/customer(${context.customerId})/_approvers_MD",
			"httpMethod": "GET",
			"responseVariable": "${context.approvers}",
			"id": "servicetask1",
			"name": "Read approvers"
		},
		"af0b927b-4af7-4fa3-90cb-1ae3bcf06ee5": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway2",
			"name": "ExclusiveGateway2",
			"default": "7919d6a3-ee8e-4b81-8e98-be2a6379f719"
		},
		"03fa0c1f-7ccb-4b87-9dba-686c166339dd": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "ABAP_COMMUNICATION_SYSTEM",
			"destinationSource": "consumer",
			"path": "/sap/opu/odata4/sap/zsb_wf_customer_v4/srvd_a2x/sap/zsd_wf_customer/0001/customer(customer=${context.customerId})/_create_customer",
			"httpMethod": "GET",
			"id": "servicetask2",
			"name": "create customer"
		},
		"3ca23ae0-9361-47d4-85a2-c4b0f6d23126": {
			"classDefinition": "com.sap.bpm.wfs.MailTask",
			"destinationSource": "consumer",
			"id": "mailtask4",
			"name": "notifyRequestorSuccess",
			"mailDefinitionRef": "b4d3ecbd-d534-49de-9e79-8ac787e52aa1"
		},
		"5c212b1d-805b-4ddc-826e-c69cab374148": {
			"classDefinition": "com.sap.bpm.wfs.MailTask",
			"destinationSource": "consumer",
			"id": "mailtask5",
			"name": "notifyRequestorRejected",
			"mailDefinitionRef": "ff224e54-d05a-4e25-87ce-7000432e8cc4"
		},
		"ecb5fe5a-6bdf-46ab-b0c6-e0552df4889b": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/dataSteward/getApprover.js",
			"id": "scripttask1",
			"name": "getApprover"
		},
		"d9726cf4-f28b-459e-9a2e-a95a6ed47e80": {
			"classDefinition": "com.sap.bpm.wfs.ParallelGateway",
			"id": "parallelgateway3",
			"name": "ParallelGateway3"
		},
		"0ab9668c-430f-484f-9af1-1633398d1a56": {
			"classDefinition": "com.sap.bpm.wfs.ParallelGateway",
			"id": "parallelgateway4",
			"name": "ParallelGateway4"
		},
		"c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow1",
			"name": "SequenceFlow1",
			"sourceRef": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3",
			"targetRef": "fc659aa6-a1e4-499a-9b89-bd40ce87ba1a"
		},
		"afe4a5ed-4456-46b9-95f9-f348f6ce2898": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow5",
			"name": "SequenceFlow5",
			"sourceRef": "317154f2-c1b4-4fff-b107-11b1cefec86f",
			"targetRef": "fb7fb5e1-0658-4840-90c9-dbbe8b41c8d0"
		},
		"5a002e32-cb5b-49f6-a84f-a00e9f2ae41f": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow6",
			"name": "SequenceFlow6",
			"sourceRef": "317154f2-c1b4-4fff-b107-11b1cefec86f",
			"targetRef": "4b2806c2-1d6b-4121-81a0-59cd40cfb6aa"
		},
		"1fa9f1b8-642c-41a5-999c-a38e8251ccbe": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow16",
			"name": "SequenceFlow16",
			"sourceRef": "4b2806c2-1d6b-4121-81a0-59cd40cfb6aa",
			"targetRef": "d9726cf4-f28b-459e-9a2e-a95a6ed47e80"
		},
		"1c526880-f6c1-4d4e-9315-fb8ac69d8c9e": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${usertasks.usertask1.last.decision == \"approve\"}",
			"id": "sequenceflow17",
			"name": "isApproved",
			"sourceRef": "a6a83d47-05e5-4afd-85fb-6c66b0db6dbe",
			"targetRef": "35b044ef-ea3a-484a-b4a9-671c252648df"
		},
		"29b4817d-9569-4681-93b9-8e183d3b7b61": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow18",
			"name": "SequenceFlow18",
			"sourceRef": "35b044ef-ea3a-484a-b4a9-671c252648df",
			"targetRef": "94659d9c-54c6-4ef5-917e-2231f11337bc"
		},
		"dc04e40e-f843-401b-8145-24c6bd746dc4": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow19",
			"name": "SequenceFlow19",
			"sourceRef": "35b044ef-ea3a-484a-b4a9-671c252648df",
			"targetRef": "6c5a6243-04d3-45c6-ba07-d46828013d76"
		},
		"3c44ecfe-cefc-4b31-acd8-8f78092ea78f": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow21",
			"name": "isRejected",
			"sourceRef": "a6a83d47-05e5-4afd-85fb-6c66b0db6dbe",
			"targetRef": "2c83d028-047f-4ddf-a85e-4e3854029423"
		},
		"2fe02eae-c6f5-4496-8b4f-4364598c6d9b": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow23",
			"name": "SequenceFlow23",
			"sourceRef": "fc659aa6-a1e4-499a-9b89-bd40ce87ba1a",
			"targetRef": "ecb5fe5a-6bdf-46ab-b0c6-e0552df4889b"
		},
		"61901eed-5952-42d5-b391-10a2023f0f6a": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${usertasks.usertask2.last.decision == \"approve\"}",
			"id": "sequenceflow24",
			"name": "Finally approved",
			"sourceRef": "af0b927b-4af7-4fa3-90cb-1ae3bcf06ee5",
			"targetRef": "03fa0c1f-7ccb-4b87-9dba-686c166339dd"
		},
		"0cb6090c-b802-46fe-b18b-a17e25104974": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow26",
			"name": "SequenceFlow26",
			"sourceRef": "94659d9c-54c6-4ef5-917e-2231f11337bc",
			"targetRef": "0ab9668c-430f-484f-9af1-1633398d1a56"
		},
		"355ffa08-d28b-4476-89e9-05fe3e90d3d3": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow27",
			"name": "SequenceFlow27",
			"sourceRef": "03fa0c1f-7ccb-4b87-9dba-686c166339dd",
			"targetRef": "3ca23ae0-9361-47d4-85a2-c4b0f6d23126"
		},
		"a478d111-1453-4e28-bf98-9e958728915b": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow28",
			"name": "SequenceFlow28",
			"sourceRef": "2c83d028-047f-4ddf-a85e-4e3854029423",
			"targetRef": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"b8bd1ff5-8be0-47ed-bf50-29f8862645a8": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow29",
			"name": "SequenceFlow29",
			"sourceRef": "3ca23ae0-9361-47d4-85a2-c4b0f6d23126",
			"targetRef": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"cce3b9ef-af9a-469a-9246-22b3ab833235": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow31",
			"name": "SequenceFlow31",
			"sourceRef": "5c212b1d-805b-4ddc-826e-c69cab374148",
			"targetRef": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"7919d6a3-ee8e-4b81-8e98-be2a6379f719": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow32",
			"name": "SequenceFlow32",
			"sourceRef": "af0b927b-4af7-4fa3-90cb-1ae3bcf06ee5",
			"targetRef": "5c212b1d-805b-4ddc-826e-c69cab374148"
		},
		"6526f8a5-a539-43d1-8daf-fb1ff56468de": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow33",
			"name": "SequenceFlow33",
			"sourceRef": "ecb5fe5a-6bdf-46ab-b0c6-e0552df4889b",
			"targetRef": "317154f2-c1b4-4fff-b107-11b1cefec86f"
		},
		"bd91ecb5-8fd8-4aee-8657-83a6b9a4db7e": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow34",
			"name": "SequenceFlow34",
			"sourceRef": "d9726cf4-f28b-459e-9a2e-a95a6ed47e80",
			"targetRef": "a6a83d47-05e5-4afd-85fb-6c66b0db6dbe"
		},
		"bcab712b-902c-41bb-9e63-11da79eca060": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow35",
			"name": "SequenceFlow35",
			"sourceRef": "fb7fb5e1-0658-4840-90c9-dbbe8b41c8d0",
			"targetRef": "d9726cf4-f28b-459e-9a2e-a95a6ed47e80"
		},
		"fca7c4e2-01d5-44c0-a094-b136a789ada2": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow36",
			"name": "SequenceFlow36",
			"sourceRef": "0ab9668c-430f-484f-9af1-1633398d1a56",
			"targetRef": "af0b927b-4af7-4fa3-90cb-1ae3bcf06ee5"
		},
		"922231a6-c63f-4c56-99a3-a2994256986a": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow37",
			"name": "SequenceFlow37",
			"sourceRef": "6c5a6243-04d3-45c6-ba07-d46828013d76",
			"targetRef": "0ab9668c-430f-484f-9af1-1633398d1a56"
		},
		"42fa7a2d-c526-4a02-b3ba-49b5168ba644": {
			"classDefinition": "com.sap.bpm.wfs.ui.Diagram",
			"symbols": {
				"df898b52-91e1-4778-baad-2ad9a261d30e": {},
				"53e54950-7757-4161-82c9-afa7e86cff2c": {},
				"6bb141da-d485-4317-93b8-e17711df4c32": {},
				"066821c7-77d1-4268-aa6e-682a8835baed": {},
				"7ccb66e1-6e26-4a50-b79c-30193270433f": {},
				"b4d7f216-2073-4a77-8c36-c53aebf6e3f2": {},
				"386cf494-e865-4b86-b35d-9b572ea669d7": {},
				"56140402-5ab3-4200-9021-7f22a4c1a32f": {},
				"b674ae5a-88fe-42cb-ae7d-634bc98eaaba": {},
				"535ae8ff-ba79-4ae4-a5d8-78cd3a4172e2": {},
				"438096b5-872e-42bb-90e3-17886cadfd0d": {},
				"573b2271-e768-4f37-b0e6-4650759b0192": {},
				"6586ac2f-8916-4cf7-8a4e-547b938f1560": {},
				"ed3e43f7-a998-4403-9ca6-ffb13a0c7010": {},
				"b416d8f7-6e43-4cb0-9c24-56aca467ba57": {},
				"966fc43c-da37-4169-b512-2ad832d6c3b4": {},
				"8ff5687f-a9f1-4c9e-a412-0c57172241a1": {},
				"f49a6b6b-90ad-4b5f-9ebf-aa9338724c84": {},
				"406db5fb-c9be-4910-aabb-41495d37c3c2": {},
				"f460baa8-d6f0-48de-86b3-623b8a6163ee": {},
				"2c40023e-24ed-4afe-b507-a45c739dfdc1": {},
				"2ed60a74-8ad8-4f23-8fdc-6d47b01588f0": {},
				"3d3df24d-6ccd-4ae1-8bcb-33def26d960a": {},
				"7de58077-7ed0-43ac-820e-2a1c5e01b3dd": {},
				"0e8cdc0c-c2f0-4fa0-94e2-581aa41786cb": {},
				"ca8db2f7-e387-44f9-b564-efab6cb5108a": {},
				"4be0986e-4616-47b6-8a54-7659846005e7": {},
				"9c8f0e9d-8205-4184-a507-7a50e5885288": {},
				"80e6a588-a2e1-4a7e-a09e-f3fa0d4f1f5c": {},
				"5f5b92e4-f525-499f-b742-25e2cb40cdb5": {},
				"53d40d1d-da2c-409a-b6e2-6f18f1f94d77": {},
				"36a31488-b0a9-4fd3-b14f-857563d110dc": {},
				"e7eba05b-7495-4ee2-a8ee-071fd3ff4f08": {},
				"f106852f-6f46-4203-882b-1275d66ec949": {},
				"a4ed8418-ed3f-40a8-af91-06e566292542": {},
				"3f1ffe89-53db-48c3-ac14-5f4b7c90aa8c": {},
				"a33915dc-60a3-4fe3-bead-f76ad5b9f6a7": {},
				"64f39088-0186-46c2-8ff0-086556c13e5b": {},
				"96cb1520-9608-49e9-aa6f-a4147a2dc82c": {}
			}
		},
		"ac09533a-b197-478f-9abb-a7242ea84ab9": {
			"classDefinition": "com.sap.bpm.wfs.SampleContext",
			"reference": "/sample-data/dataStewardUT.json",
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
			"x": 1826.999989271164,
			"y": 97.49999970197678,
			"width": 35,
			"height": 35,
			"object": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"6bb141da-d485-4317-93b8-e17711df4c32": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "44,114.99999970197678 94,114.99999970197678",
			"sourceSymbol": "df898b52-91e1-4778-baad-2ad9a261d30e",
			"targetSymbol": "406db5fb-c9be-4910-aabb-41495d37c3c2",
			"object": "c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f"
		},
		"066821c7-77d1-4268-aa6e-682a8835baed": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 505.9999988079071,
			"y": 29.999999701976776,
			"width": 100,
			"height": 60,
			"object": "fb7fb5e1-0658-4840-90c9-dbbe8b41c8d0"
		},
		"7ccb66e1-6e26-4a50-b79c-30193270433f": {
			"classDefinition": "com.sap.bpm.wfs.ui.ParallelGatewaySymbol",
			"x": 394,
			"y": 93.99999970197678,
			"object": "317154f2-c1b4-4fff-b107-11b1cefec86f"
		},
		"b4d7f216-2073-4a77-8c36-c53aebf6e3f2": {
			"classDefinition": "com.sap.bpm.wfs.ui.MailTaskSymbol",
			"x": 505.9999988079071,
			"y": 139.99999970197678,
			"width": 100,
			"height": 60,
			"object": "4b2806c2-1d6b-4121-81a0-59cd40cfb6aa"
		},
		"386cf494-e865-4b86-b35d-9b572ea669d7": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "436,114.99999970197678 470.99999940395355,114.99999970197678 470.99999940395355,59.999999701976776 505.9999988079071,59.999999701976776",
			"sourceSymbol": "7ccb66e1-6e26-4a50-b79c-30193270433f",
			"targetSymbol": "066821c7-77d1-4268-aa6e-682a8835baed",
			"object": "afe4a5ed-4456-46b9-95f9-f348f6ce2898"
		},
		"56140402-5ab3-4200-9021-7f22a4c1a32f": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "436,114.99999970197678 470.99999940395355,114.99999970197678 470.99999940395355,169.99999970197678 505.9999988079071,169.99999970197678",
			"sourceSymbol": "7ccb66e1-6e26-4a50-b79c-30193270433f",
			"targetSymbol": "b4d7f216-2073-4a77-8c36-c53aebf6e3f2",
			"object": "5a002e32-cb5b-49f6-a84f-a00e9f2ae41f"
		},
		"b674ae5a-88fe-42cb-ae7d-634bc98eaaba": {
			"classDefinition": "com.sap.bpm.wfs.ui.ParallelGatewaySymbol",
			"x": 928.9999952316284,
			"y": 148.99999970197678,
			"object": "35b044ef-ea3a-484a-b4a9-671c252648df"
		},
		"535ae8ff-ba79-4ae4-a5d8-78cd3a4172e2": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 1114.9999940395355,
			"y": 157.99999940395355,
			"width": 100,
			"height": 60,
			"object": "94659d9c-54c6-4ef5-917e-2231f11337bc"
		},
		"438096b5-872e-42bb-90e3-17886cadfd0d": {
			"classDefinition": "com.sap.bpm.wfs.ui.MailTaskSymbol",
			"x": 1114.9999940395355,
			"y": 47.99999940395355,
			"width": 100,
			"height": 60,
			"object": "6c5a6243-04d3-45c6-ba07-d46828013d76"
		},
		"573b2271-e768-4f37-b0e6-4650759b0192": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": 787.9999964237213,
			"y": 93.99999970197678,
			"object": "a6a83d47-05e5-4afd-85fb-6c66b0db6dbe"
		},
		"6586ac2f-8916-4cf7-8a4e-547b938f1560": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "605.9999988079071,169.99999970197678 640.9999982118607,169.99999970197678 640.9999982118607,132.99999940395355 675.9999976158142,132.99999940395355",
			"sourceSymbol": "b4d7f216-2073-4a77-8c36-c53aebf6e3f2",
			"targetSymbol": "f106852f-6f46-4203-882b-1275d66ec949",
			"object": "1fa9f1b8-642c-41a5-999c-a38e8251ccbe"
		},
		"ed3e43f7-a998-4403-9ca6-ffb13a0c7010": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "829.9999964237213,114.99999970197678 864.9999958276749,114.99999970197678 864.9999958276749,169.99999970197678 928.9999952316284,169.99999970197678",
			"sourceSymbol": "573b2271-e768-4f37-b0e6-4650759b0192",
			"targetSymbol": "b674ae5a-88fe-42cb-ae7d-634bc98eaaba",
			"object": "1c526880-f6c1-4d4e-9315-fb8ac69d8c9e"
		},
		"b416d8f7-6e43-4cb0-9c24-56aca467ba57": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "970.9999952316284,169.99999970197678 1079.999994635582,169.99999970197678 1079.999994635582,187.99999940395355 1114.9999940395355,187.99999940395355",
			"sourceSymbol": "b674ae5a-88fe-42cb-ae7d-634bc98eaaba",
			"targetSymbol": "535ae8ff-ba79-4ae4-a5d8-78cd3a4172e2",
			"object": "29b4817d-9569-4681-93b9-8e183d3b7b61"
		},
		"966fc43c-da37-4169-b512-2ad832d6c3b4": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "970.9999952316284,169.99999970197678 1079.999994635582,169.99999970197678 1079.999994635582,77.99999940395355 1114.9999940395355,77.99999940395355",
			"sourceSymbol": "b674ae5a-88fe-42cb-ae7d-634bc98eaaba",
			"targetSymbol": "438096b5-872e-42bb-90e3-17886cadfd0d",
			"object": "dc04e40e-f843-401b-8145-24c6bd746dc4"
		},
		"8ff5687f-a9f1-4c9e-a412-0c57172241a1": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "809,114.99999970197678 809,68.99999970197678 899.9999952316284,68.99999970197678",
			"sourceSymbol": "573b2271-e768-4f37-b0e6-4650759b0192",
			"targetSymbol": "f49a6b6b-90ad-4b5f-9ebf-aa9338724c84",
			"object": "3c44ecfe-cefc-4b31-acd8-8f78092ea78f"
		},
		"f49a6b6b-90ad-4b5f-9ebf-aa9338724c84": {
			"classDefinition": "com.sap.bpm.wfs.ui.MailTaskSymbol",
			"x": 899.9999952316284,
			"y": 38.999999701976776,
			"width": 100,
			"height": 60,
			"object": "2c83d028-047f-4ddf-a85e-4e3854029423"
		},
		"406db5fb-c9be-4910-aabb-41495d37c3c2": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 94,
			"y": 84.99999970197678,
			"width": 100,
			"height": 60,
			"object": "fc659aa6-a1e4-499a-9b89-bd40ce87ba1a"
		},
		"f460baa8-d6f0-48de-86b3-623b8a6163ee": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "194,114.99999970197678 244,114.99999970197678",
			"sourceSymbol": "406db5fb-c9be-4910-aabb-41495d37c3c2",
			"targetSymbol": "36a31488-b0a9-4fd3-b14f-857563d110dc",
			"object": "2fe02eae-c6f5-4496-8b4f-4364598c6d9b"
		},
		"2c40023e-24ed-4afe-b507-a45c739dfdc1": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": 1348.9999928474426,
			"y": 111.99999940395355,
			"object": "af0b927b-4af7-4fa3-90cb-1ae3bcf06ee5"
		},
		"2ed60a74-8ad8-4f23-8fdc-6d47b01588f0": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1390.9999928474426,132.99999940395355 1439,133 1439,188 1486.9999916553497,187.99999940395355",
			"sourceSymbol": "2c40023e-24ed-4afe-b507-a45c739dfdc1",
			"targetSymbol": "7de58077-7ed0-43ac-820e-2a1c5e01b3dd",
			"object": "61901eed-5952-42d5-b391-10a2023f0f6a"
		},
		"3d3df24d-6ccd-4ae1-8bcb-33def26d960a": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1164.9999940395355,187.99999940395355 1242.75,188 1242.75,129 1291,129",
			"sourceSymbol": "535ae8ff-ba79-4ae4-a5d8-78cd3a4172e2",
			"targetSymbol": "a33915dc-60a3-4fe3-bead-f76ad5b9f6a7",
			"object": "0cb6090c-b802-46fe-b18b-a17e25104974"
		},
		"7de58077-7ed0-43ac-820e-2a1c5e01b3dd": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 1486.9999916553497,
			"y": 157.99999940395355,
			"width": 100,
			"height": 60,
			"object": "03fa0c1f-7ccb-4b87-9dba-686c166339dd"
		},
		"0e8cdc0c-c2f0-4fa0-94e2-581aa41786cb": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1586.9999916553497,187.99999940395355 1621.9999910593033,187.99999940395355 1621.9999910593033,132.99999940395355 1656.9999904632568,132.99999940395355",
			"sourceSymbol": "7de58077-7ed0-43ac-820e-2a1c5e01b3dd",
			"targetSymbol": "4be0986e-4616-47b6-8a54-7659846005e7",
			"object": "355ffa08-d28b-4476-89e9-05fe3e90d3d3"
		},
		"ca8db2f7-e387-44f9-b564-efab6cb5108a": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "999.9999952316284,68.99999970197678 1034.999994635582,68.99999970197678 1034.999994635582,12 1294.999993443489,12 1294.999993443489,76 1406.9999922513962,76 1406.9999922513962,12 1621.9999910593033,12 1621.9999910593033,67 1791.9999898672104,67 1791.9999898672104,114.99999970197678 1826.999989271164,114.99999970197678",
			"sourceSymbol": "f49a6b6b-90ad-4b5f-9ebf-aa9338724c84",
			"targetSymbol": "53e54950-7757-4161-82c9-afa7e86cff2c",
			"object": "a478d111-1453-4e28-bf98-9e958728915b"
		},
		"4be0986e-4616-47b6-8a54-7659846005e7": {
			"classDefinition": "com.sap.bpm.wfs.ui.MailTaskSymbol",
			"x": 1656.9999904632568,
			"y": 102.99999940395355,
			"width": 100,
			"height": 60,
			"object": "3ca23ae0-9361-47d4-85a2-c4b0f6d23126"
		},
		"9c8f0e9d-8205-4184-a507-7a50e5885288": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1756.9999904632568,132.99999940395355 1791.9999898672104,132.99999940395355 1791.9999898672104,114.99999970197678 1826.999989271164,114.99999970197678",
			"sourceSymbol": "4be0986e-4616-47b6-8a54-7659846005e7",
			"targetSymbol": "53e54950-7757-4161-82c9-afa7e86cff2c",
			"object": "b8bd1ff5-8be0-47ed-bf50-29f8862645a8"
		},
		"80e6a588-a2e1-4a7e-a09e-f3fa0d4f1f5c": {
			"classDefinition": "com.sap.bpm.wfs.ui.MailTaskSymbol",
			"x": 1486.9999916553497,
			"y": 47.99999940395355,
			"width": 100,
			"height": 60,
			"object": "5c212b1d-805b-4ddc-826e-c69cab374148"
		},
		"5f5b92e4-f525-499f-b742-25e2cb40cdb5": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1586.9999916553497,77.99999940395355 1621.9999910593033,77.99999940395355 1621.9999910593033,67 1791.9999898672104,67 1791.9999898672104,114.99999970197678 1826.999989271164,114.99999970197678",
			"sourceSymbol": "80e6a588-a2e1-4a7e-a09e-f3fa0d4f1f5c",
			"targetSymbol": "53e54950-7757-4161-82c9-afa7e86cff2c",
			"object": "cce3b9ef-af9a-469a-9246-22b3ab833235"
		},
		"53d40d1d-da2c-409a-b6e2-6f18f1f94d77": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1390.9999928474426,132.99999940395355 1439,133 1439,78 1486.9999916553497,77.99999940395355",
			"sourceSymbol": "2c40023e-24ed-4afe-b507-a45c739dfdc1",
			"targetSymbol": "80e6a588-a2e1-4a7e-a09e-f3fa0d4f1f5c",
			"object": "7919d6a3-ee8e-4b81-8e98-be2a6379f719"
		},
		"36a31488-b0a9-4fd3-b14f-857563d110dc": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 244,
			"y": 84.99999970197678,
			"width": 100,
			"height": 60,
			"object": "ecb5fe5a-6bdf-46ab-b0c6-e0552df4889b"
		},
		"e7eba05b-7495-4ee2-a8ee-071fd3ff4f08": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "344,114.99999970197678 394,114.99999970197678",
			"sourceSymbol": "36a31488-b0a9-4fd3-b14f-857563d110dc",
			"targetSymbol": "7ccb66e1-6e26-4a50-b79c-30193270433f",
			"object": "6526f8a5-a539-43d1-8daf-fb1ff56468de"
		},
		"f106852f-6f46-4203-882b-1275d66ec949": {
			"classDefinition": "com.sap.bpm.wfs.ui.ParallelGatewaySymbol",
			"x": 675.9999976158142,
			"y": 111.99999940395355,
			"object": "d9726cf4-f28b-459e-9a2e-a95a6ed47e80"
		},
		"a4ed8418-ed3f-40a8-af91-06e566292542": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "717.9999976158142,132.99999940395355 752.9999970197678,132.99999940395355 752.9999970197678,114.99999970197678 787.9999964237213,114.99999970197678",
			"sourceSymbol": "f106852f-6f46-4203-882b-1275d66ec949",
			"targetSymbol": "573b2271-e768-4f37-b0e6-4650759b0192",
			"object": "bd91ecb5-8fd8-4aee-8657-83a6b9a4db7e"
		},
		"3f1ffe89-53db-48c3-ac14-5f4b7c90aa8c": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "555.9999988079071,59.999999701976776 641.25,60 641.25,133 696.9999976158142,132.99999940395355",
			"sourceSymbol": "066821c7-77d1-4268-aa6e-682a8835baed",
			"targetSymbol": "f106852f-6f46-4203-882b-1275d66ec949",
			"object": "bcab712b-902c-41bb-9e63-11da79eca060"
		},
		"a33915dc-60a3-4fe3-bead-f76ad5b9f6a7": {
			"classDefinition": "com.sap.bpm.wfs.ui.ParallelGatewaySymbol",
			"x": 1270,
			"y": 108,
			"object": "0ab9668c-430f-484f-9af1-1633398d1a56"
		},
		"64f39088-0186-46c2-8ff0-086556c13e5b": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1291,130.99999970197678 1369.9999928474426,130.99999970197678",
			"sourceSymbol": "a33915dc-60a3-4fe3-bead-f76ad5b9f6a7",
			"targetSymbol": "2c40023e-24ed-4afe-b507-a45c739dfdc1",
			"object": "fca7c4e2-01d5-44c0-a094-b136a789ada2"
		},
		"96cb1520-9608-49e9-aa6f-a4147a2dc82c": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1164.9999940395355,77.99999940395355 1242.75,78 1242.75,129 1291,129",
			"sourceSymbol": "438096b5-872e-42bb-90e3-17886cadfd0d",
			"targetSymbol": "a33915dc-60a3-4fe3-bead-f76ad5b9f6a7",
			"object": "922231a6-c63f-4c56-99a3-a2994256986a"
		},
		"62d7f4ed-4063-4c44-af8b-39050bd44926": {
			"classDefinition": "com.sap.bpm.wfs.LastIDs",
			"timereventdefinition": 4,
			"maildefinition": 5,
			"sequenceflow": 37,
			"startevent": 1,
			"boundarytimerevent": 1,
			"endevent": 1,
			"usertask": 2,
			"servicetask": 2,
			"scripttask": 1,
			"mailtask": 5,
			"exclusivegateway": 2,
			"parallelgateway": 4
		},
		"573183bb-ca38-4eb0-a29a-7dab19bdc181": {
			"classDefinition": "com.sap.bpm.wfs.MailDefinition",
			"name": "maildefinition1",
			"to": "${context.currentApprover}",
			"subject": "Master form created for a New customer (${context.customerName})",
			"reference": "/webcontent/dataSteward/approverNotification.html",
			"id": "maildefinition1"
		},
		"0cce3b03-a4cf-47a9-9d06-1f3b178bd4c1": {
			"classDefinition": "com.sap.bpm.wfs.MailDefinition",
			"name": "maildefinition2",
			"to": "${context.currentApprover}",
			"subject": "Master form creation for a New customer (${context.customerName})",
			"text": "Rejected",
			"id": "maildefinition2"
		},
		"98c0bc37-cb17-4b34-a7fc-282d1b391ba3": {
			"classDefinition": "com.sap.bpm.wfs.MailDefinition",
			"name": "maildefinition3",
			"to": "${context.submittedByUserId}",
			"subject": "Creation of a new customer (${context.customerName}) has been rejected",
			"reference": "/webcontent/dataSteward/notifyRequestorRejected.html",
			"id": "maildefinition3"
		},
		"b4d3ecbd-d534-49de-9e79-8ac787e52aa1": {
			"classDefinition": "com.sap.bpm.wfs.MailDefinition",
			"name": "maildefinition4",
			"to": "${context.submittedByUserId}",
			"subject": "Creation of a new customer (${context.customerName}) has been approved",
			"reference": "/webcontent/dataSteward/notifyRequestorApproved.html",
			"id": "maildefinition4"
		},
		"ff224e54-d05a-4e25-87ce-7000432e8cc4": {
			"classDefinition": "com.sap.bpm.wfs.MailDefinition",
			"name": "maildefinition5",
			"to": "${context.submittedByUserId}",
			"subject": "Creation of a new customer (${context.customerName}) has been rejected",
			"text": "Rejected",
			"id": "maildefinition5"
		},
		"e6a5e94c-19b6-436a-8bc2-c26ac8580093": {
			"classDefinition": "com.sap.bpm.wfs.TimerEventDefinition",
			"timeDuration": "P2D",
			"id": "timereventdefinition4"
		}
	}
}