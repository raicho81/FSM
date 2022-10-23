"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestFSMRE,
	#superclass : #PackageManifest,
	#category : #'FSM-RE-Manifest'
}

{ #category : #'code-critics' }
ManifestFSMRE class >> ruleCollectSelectNotUsedRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#SimpleRETokenizer #tokenizeRun #false)) #'2022-10-10T15:57:35.483909+03:00') )
]

{ #category : #'code-critics' }
ManifestFSMRE class >> ruleCollectionProtocolRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#SimpleRETokenizer #tokenizeRun #false)) #'2022-10-10T14:25:55.980343+03:00') )
]

{ #category : #'code-critics' }
ManifestFSMRE class >> ruleEqualNotUsedRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#'SimpleTokenizer class' #initialize #true)) #'2022-10-08T22:54:43.410249+03:00') )
]

{ #category : #'code-critics' }
ManifestFSMRE class >> ruleReNoNilAssignationInInitializeRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#SimpleTokenizer #initialize #false)) #'2022-10-09T21:20:48.93432+03:00') )
]

{ #category : #'code-critics' }
ManifestFSMRE class >> ruleUnclassifiedMethodsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#SimpleRETokenizer #tokenizeRun #false)) #'2022-10-10T14:26:06.66067+03:00') )
]
