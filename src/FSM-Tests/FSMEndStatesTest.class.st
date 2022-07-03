Class {
	#name : #FSMEndStatesTest,
	#superclass : #TestCase,
	#category : #'FSM-Tests-Base'
}

{ #category : #tests }
FSMEndStatesTest >> testInitializationIsOk [

	| fsmendstates |
	fsmendstates := FSMEndStates  new.
	self assert: fsmendstates isEmpty
]
