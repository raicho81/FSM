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
	self
		assert: fsm startstate
		equals: (FSMState withMnemonic: 'S0' withValue: 'S0').
	self
		assert: fsm curstate
		equals: (FSMState withMnemonic: 'S0' withValue: 'S0').
	self assert: fsm transitions isEmpty.
	fsm dump
]

{ #category : #tests }
FSMTest >> testWorking [

	| fsm inpab outab |
	fsm := FSM new.
	inpab := FSMInputAlphabet new.
	inpab
		add: (FSMInputSymbol withMnemonic: 'a' withValue: 'a');
		add: (FSMInputSymbol withMnemonic: 'b' withValue: 'b');
		add: (FSMInputSymbol withMnemonic: 'e' withValue: 'e');
		add: (FSMInputSymbol withMnemonic: 'c' withValue: 'c');
		add: (FSMInputSymbol withMnemonic: 'd' withValue: 'd').
	fsm inputalphabet: inpab.

	outab := FSMOutputAlphabet new.
	outab
		add: (FSMState withMnemonic: 'S1' withValue: 'S1');
		add: (FSMState withMnemonic: 'S2' withValue: 'S2');
		add: (FSMState withMnemonic: 'S3' withValue: 'S3');
		add: (FSMState withMnemonic: 'S4' withValue: 'S4');
		add: (FSMState withMnemonic: 'S5' withValue: 'S5').
	fsm outputalphabet: outab.

	fsm dump
]
