Class {
	#name : #BaselineOfFSMCore,
	#superclass : #BaselineOf,
	#category : 'BaselineOfFSMCore'
}

{ #category : #baselines }
BaselineOfFSMCore >> baseline: spec [
	<baseline>
	
	spec for: #pharo do: [ 
		spec package: 'FSM-Core'.
		spec package: 'FSM-Tests' with: [ spec requires: #('FSM-Core') ]
	]
]
