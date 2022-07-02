Class {
	#name : #ManifestFSMTests,
	#superclass : #PackageManifest,
	#category : #'FSM-Tests-Manifest'
}

{ #category : #'code-critics' }
ManifestFSMTests class >> ruleCollectSelectNotUsedRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#FSMTest #testWorking #false)) #'2022-06-29T20:33:51.519+03:00') )
]

{ #category : #'code-critics' }
ManifestFSMTests class >> ruleCollectionProtocolRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#FSMTest #testWorking #false)) #'2022-06-30T06:51:02.772+03:00') )
]

{ #category : #'code-critics' }
ManifestFSMTests class >> ruleLiteralArrayContainsSuspiciousTrueFalseOrNilRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#'ManifestFSMTests class' #ruleCollectionProtocolRuleV1FalsePositive #true)) #'2022-06-30T07:03:44.894+03:00') )
]
