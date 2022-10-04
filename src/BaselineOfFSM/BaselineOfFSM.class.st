Class {
	#name : #BaselineOfFSM,
	#superclass : #BaselineOf,
	#category : #BaselineOfFSM
}

{ #category : #baseline }
BaselineOfFSM >> baseline: spec [
	<baseline>
	
	spec for: #pharo do: [ 
		spec package: 'FSM-Core'.
		spec package: 'FSM-Tests' with: [ spec requires: #('FSM-Core') ]
	]
]
