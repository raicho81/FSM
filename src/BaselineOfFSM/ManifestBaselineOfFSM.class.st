"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestBaselineOfFSM,
	#superclass : #PackageManifest,
	#category : #'BaselineOfFSM-Manifest'
}

{ #category : #'code-critics' }
ManifestBaselineOfFSM class >> ruleUtilityMethodsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#BaselineOfFSM #baseline: #false)) #'2022-10-04T06:28:26.769524+03:00') )
]
