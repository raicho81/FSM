Class {
	#name : #FSMTest,
	#superclass : #TestCase,
	#category : #'FSM-Tests'
}

{ #category : #tests }
FSMTest >> testInitializationIsOk [

	| fsm |
	fsm := FSM new.
	self assert: fsm inputalphabet isEmpty.
	self assert: fsm outputalphabet isEmpty.
	self assert: fsm endstates isEmpty.
	self assert: fsm startstate equals: (FSMState withMnemonic: 'S0' withValue: 'S0').
	self assert: fsm curstate equals: (FSMState withMnemonic: 'S0' withValue: 'S0').
	self assert: fsm transitions isEmpty.
]
