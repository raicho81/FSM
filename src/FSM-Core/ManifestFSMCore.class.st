"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestFSMCore,
	#superclass : #PackageManifest,
	#category : #'FSM-Core-Manifest'
}

{ #category : #'code-critics' }
ManifestFSMCore class >> ruleSentNotImplementedRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#FSM #validateParams #false)) #'2022-06-29T22:42:45.148+03:00') )
]
