Class {
	#name : #FSMTest,
	#superclass : #TestCase,
	#instVars : [
		'fsm'
	],
	#category : #'FSM-Tests-Base'
}

{ #category : #running }
FSMTest >> setUp [

	super setUp.

	fsm := FSM new.
	{ 'a'. 'b'. 'c'. 'd'. 'e' } do: [ :each | 
		fsm inputAlphabetAdd: (FSMInputSymbol withMnemonic: each) ].
	{ 'S1'. 'S2'. 'S3'. 'S4'. 'S5'. 'S6'. 'S7'. 'S8'. 'S9' } do: [ :each | 
		fsm outputAlphabetAdd: (FSMState withMnemonic: each) ].
	{ 
		{ 'S0'. 'a'. 'S1' }.
		{ 'S1'. 'b'. 'S3' }.
		{ 'S0'. 'b'. 'S2' }.
		{ 'S2'. 'd'. 'S7' }.
		{ 'S7'. 'a'. 'S8' }.
		{ 'S8'. 'a'. 'S8' }.
		{ 'S8'. 'b'. 'S8' }.
		{ 'S7'. 'e'. 'S4' }.
		{ 'S4'. 'b'. 'S2' }.
		{ 'S4'. 'f'. 'S6' }.
		{ 'S6'. 'g'. 'S4' }.
		{ 'S6'. 'g'. 'S4' }.
		{ 'S4'. 'b'. 'S5' }.
		{ 'S3'. 'a'. 'S5' }.
		{ 'S5'. 'a'. 'S5' } } do: [ :each | 
		fsm transitionsAdd: (FSMTransition withTriplet: each) ].
	{ 'S8'. 'S5'. 'S9' } do: [ :each | 
		fsm endstatesAdd: (FSMState withMnemonic: each) ].
	fsm endstate_unrecognized: (FSMState withMnemonic: 'S9').
	"r: Add a nonexistent state S9 as an intercept state to, which will point all states from,
	which there are no possible transitions from the current state to any other defined by the Regular Grammar G of the FSM
	This is the canonical way to make any FSM a fully determined DFSM in this case when we raech S9 the FSM doesn't recognize nothing
	but is in final state and can stop and we can restart it to continue matching.
   https://en.wikipedia.org/wiki/Regular_grammar
	https://en.wikipedia.org/wiki/Regular_language
	I guess the next step is to implement this paper: https://en.wikipedia.org/wiki/Thompson%27s_construction 
	in order to be able to read Regular Expressions and construct FSMs dynamically from them :)"
	fsm dump "Dump FSM Structures to console (Transcript in Pharo/Smalltalk/Sqeak)"
]

{ #category : #tests }
FSMTest >> testInitializationIsOk [

	| fsmempty |
	fsmempty := FSM new.
	self assert: fsmempty inputalphabet isEmpty.
	self assert: fsmempty outputalphabet isEmpty.
	self assert: fsmempty endstates isEmpty.
	self assert: fsmempty startstate equals: (FSMState withMnemonic: 'S0').
	self assert: fsmempty curstate equals: (FSMState withMnemonic: 'S0').
	self assert: fsmempty transitions isEmpty.
	fsmempty dump
]

{ #category : #tests }
FSMTest >> testWorking [

	({ 'a'. 'b'. 'a'. 'a'. 'a' } collect: [ :each | 
		 FSMInputSymbol withMnemonic: each ]) do: [ :each | 
		fsm evalInpSymb: each ].
	fsm dump.
	self
		assert: fsm isfinal;
		assert: fsm isrecognized.
	
	fsm resetFSM.
	({ 'a'. 'b'. 'a'. 'a'. 'a'. 'c' } collect: [ :each | 
		 FSMInputSymbol withMnemonic: each ]) do: [ :each | 
		fsm evalInpSymb: each ].
	fsm dump.
	self
		assert: fsm isfinal;
		assert: fsm isrecognized not
]
