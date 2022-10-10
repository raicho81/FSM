Class {
	#name : #BaselineOfFSM,
	#superclass : #BaselineOf,
	#category : #BaselineOfFSM
}

{ #category : #baselines }
BaselineOfFSM >> baseline: spec [
	<baseline>
	
	spec for: #pharo do: [
		spec package: 'FSM-Core'.
		spec package: 'FSM-Tests' with: [ spec requires: #('FSM-Core') ].
		spec package: 'FSM-RE' with: [ spec requires: #('FSM-Core') ]
	]
]