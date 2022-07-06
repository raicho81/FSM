"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestFSMTests,
	#superclass : #PackageManifest,
	#category : #'FSM-Tests-Manifest'
}

{ #category : #'code-critics' }
ManifestFSMTests class >> ruleCollectSelectNotUsedRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#FSMTest #testMatchRandomInputSequenceWithLength: #false)) #'2022-07-06T10:31:26.481256+03:00') )
]

{ #category : #'code-critics' }
ManifestFSMTests class >> ruleLongMethodsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#FSMTest #testMatchRandomInputSequenceWithLength: #false)) #'2022-07-06T00:52:12.220281+03:00') )
]
