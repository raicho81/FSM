"
Implementation Points
"
Class {
	#name : #BaselineOfFSM,
	#superclass : #BaselineOf,
	#category : #'FSM-Baseline'
}

{ #category : #baselines }
BaselineOfFSM >> baseline: spec [
	<baseline>

	spec for: #pharo do: [ 
		spec package: 'FSM-Core'.
		spec package: 'FSM-Tests' with: [ spec requires: #('FSM-Core') ]
	]
]
