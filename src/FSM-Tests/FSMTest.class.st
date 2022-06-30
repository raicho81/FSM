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
		equals: (FSMState withMnemonic: 'S0').
	self
		assert: fsm curstate
		equals: (FSMState withMnemonic: 'S0').
	self assert: fsm transitions isEmpty.
	fsm dump
]

{ #category : #tests }
FSMTest >> testWorking [

	| fsm inpab outab transitions finalstates randomsymbols |
	fsm := FSM new.
	inpab := FSMInputAlphabet new.
	inpab
		add: (FSMInputSymbol withMnemonic: 'a');
		add: (FSMInputSymbol withMnemonic: 'b');
		add: (FSMInputSymbol withMnemonic: 'e');
		add: (FSMInputSymbol withMnemonic: 'c');
		add: (FSMInputSymbol withMnemonic: 'd').
	fsm inputalphabet: inpab.

	outab := FSMOutputAlphabet new.
	outab
		add: (FSMState withMnemonic: 'S1');
		add: (FSMState withMnemonic: 'S2');
		add: (FSMState withMnemonic: 'S3');
		add: (FSMState withMnemonic: 'S4');
		add: (FSMState withMnemonic: 'S5');
		add: (FSMState withMnemonic: 'S6');
		add: (FSMState withMnemonic: 'S7').
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
		add: (FSMState withMnemonic: 'S8');
		add: (FSMState withMnemonic: 'S5');
		add: (FSMState withMnemonic: 'S9').
	fsm endstates: finalstates.

	"r: Add a nonexistent state S9 as an intercept state to, which will point all states from,
	which there are no possible transitions from the current state to any other defined by the Regular Grammar G of the FSM
	""""This is the canonical way to make any FSM a fully determined DFSM in this case when we raech S9 the FSM doesn't recognize nothing but is in final state and can stop and we can restart it to continue matching.""""	
   https://en.wikipedia.org/wiki/Regular_grammar
	https://en.wikipedia.org/wiki/Regular_language
	I guess the next step is to implement this paper: https://en.wikipedia.org/wiki/Thompson%27s_construction 
	in order to be able to read Regular Expressions and construct FSMs dynamically from them :)"
	fsm dump. "Dump FSM Structures to console (Transcript in Pharo/Smalltalk/Sqeak)"

	randomsymbols := OrderedCollection new: 5000.
	randomsymbols collect: [ :_ | "Init random array with input alphabet symbols for testing the FSM." 
		inpab at: inpab size atRandom ].

	fsm runWithArray: randomsymbols.	
]
