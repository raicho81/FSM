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

	| fsm inpab outab transitions finalstates |
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
		add: (FSMState withMnemonic: 'S5' withValue: 'S5');
		add: (FSMState withMnemonic: 'S6' withValue: 'S6');
		add: (FSMState withMnemonic: 'S7' withValue: 'S7').
	fsm outputalphabet: outab.

	transitions := FSMTransitions new.
	transitions
		add:
			(FSMTransition
				 withState: 'S0'
				 withInputSymbol: 'a'
				 withNewState: 'S1');
		add:
			(FSMTransition
				 withState: 'S1'
				 withInputSymbol: 'b'
				 withNewState: 'S3');
		add:
			(FSMTransition
				 withState: 'S0'
				 withInputSymbol: 'b'
				 withNewState: 'S2');
		add:
			(FSMTransition
				 withState: 'S2'
				 withInputSymbol: 'd'
				 withNewState: 'S7');
		add:
			(FSMTransition
				 withState: 'S7'
				 withInputSymbol: 'a'
				 withNewState: 'S8');
		add:
			(FSMTransition
				 withState: 'S8'
				 withInputSymbol: 'a'
				 withNewState: 'S8');
		add:
			(FSMTransition
				 withState: 'S8'
				 withInputSymbol: 'b'
				 withNewState: 'S8');
		add:
			(FSMTransition
				 withState: 'S7'
				 withInputSymbol: 'e'
				 withNewState: 'S4');
		add:
			(FSMTransition
				 withState: 'S4'
				 withInputSymbol: 'b'
				 withNewState: 'S2');
		add:
			(FSMTransition
				 withState: 'S4'
				 withInputSymbol: 'f'
				 withNewState: 'S6');
		add:
			(FSMTransition
				 withState: 'S6'
				 withInputSymbol: 'g'
				 withNewState: 'S4');
		add:
			(FSMTransition
				 withState: 'S6'
				 withInputSymbol: 'g'
				 withNewState: 'S4');
		add:
			(FSMTransition
				 withState: 'S4'
				 withInputSymbol: 'b'
				 withNewState: 'S5');
		add:
			(FSMTransition
				 withState: 'S3'
				 withInputSymbol: 'a'
				 withNewState: 'S5');
		add:
			(FSMTransition
				 withState: 'S5'
				 withInputSymbol: 'a'
				 withNewState: 'S5').
	fsm transitions: transitions.

	finalstates := FSMOutputAlphabet new.
	finalstates
		add: (FSMState withMnemonic: 'S8' withValue: 'S8');
		add: (FSMState withMnemonic: 'S5' withValue: 'S5');
		add: (FSMState withMnemonic: 'S9' withValue: 'S9').
	"Add a nonexistent state S9 as an intercept state to, which wiull point all states from, which there are no possible transitions from the current state to any other defined by the Regular Grammar G of the FSM       	 		https://en.wikipedia.org/wiki/Regular_grammar
		https://en.wikipedia.org/wiki/Regular_language
		https://en.wikipedia.org/wiki/Thompson%27s_construction"
	"This the canonical way to make any FSM a fully determined DFSM in this case when we raech S9 the FSM doesn't recognize nothing but is in final state and can stop and restart it if needed."
	fsm dump "Dump FSM Structures to console (Transcript in Pharo/Smalltalk/Sqeak)"
]
