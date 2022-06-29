Class {
	#name : #ManifestFSMTests,
	#superclass : #PackageManifest,
	#category : #'FSM-Tests-Manifest'
}

{ #category : #'code-critics' }
ManifestFSMTests class >> ruleCollectSelectNotUsedRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#FSMTest #testWorking #false)) #'2022-06-29T20:33:51.519+03:00') )
]
