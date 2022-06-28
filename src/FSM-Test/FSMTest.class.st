Class {
	#name : #FSMTest,
	#superclass : #TestCase,
	#instVars : [
		'inputalphabet',
		'outputalphabet',
		'startsymbol',
		'endstates',
		'curstate',
		'transitions'
	],
	#category : #'FSM-Test'
}

{ #category : #tests }
FSMTest >> testInitializationIsOk [

	| fsm |
	fsm := FSM new.
	self assert: fsm inputalphabet isEmpty.
	self assert: fsm outputalphabet isEmpty.
	self assert: fsm endstates isEmpty.
	self assert: fsm startstate isNil.
	self assert: fsm curstate isNil.
	self assert: fsm transitions isEmpty.
]
