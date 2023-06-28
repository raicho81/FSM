Class {
	#name : #BaselineOfFSM,
	#superclass : #BaselineOf,
	#category : #BaselineOfFSM
}

{ #category : #baselines }
BaselineOfFSM >> baseline: spec [
	<baseline>

	spec for: #common do: [
            spec blessing: #baseline.  "mandatory to declare a baseline"
 	      spec repository: 'https://github.com/raicho81/FSM'.
		spec package: 'FSM-Core'.
		spec package: 'FSM-RE' with: [ spec requires: #('FSM-Core') ].
		spec package: 'FSM-Tests' with: [ spec requires: #('FSM-Core') ].
	]
]
