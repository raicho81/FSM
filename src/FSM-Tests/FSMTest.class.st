"
This class contains initialization tests and input sequences of FSMInputSymbol's tests for the FSM matching/not matching the input sequence including randomly generated input sequences.
"
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
	{ 'a'. 'b'. 'c'. 'd'. 'e'. 'f'. 'g' } do: [ :each | 
		fsm inputAlphabetAdd: (FSMInputSymbol withMnemonic: each) ].
	{ 'S1'. 'S2'. 'S3'. 'S4'. 'S5'. 'S6'. 'S7'. 'S8'. 'S9' } do: [ :each | 
		fsm outputAlphabetAdd: (FSMState withMnemonic: each) ].
	{ 
		{ 'S0'. 'a'. 'S1' }.
		{ 'S0'. 'b'. 'S2' }.
		{ 'S1'. 'b'. 'S3' }.
		{ 'S2'. 'd'. 'S7' }.
		{ 'S3'. 'a'. 'S5' }.
		{ 'S4'. 'b'. 'S2' }.
		{ 'S4'. 'f'. 'S6' }.
		{ 'S4'. 'a'. 'S3' }.
		{ 'S5'. 'a'. 'S5' }.
		{ 'S6'. 'g'. 'S4' }.
		{ 'S6'. 'g'. 'S4' }.
		{ 'S7'. 'a'. 'S8' }.
		{ 'S7'. 'e'. 'S4' }.
		{ 'S8'. 'a'. 'S8' }.
		{ 'S8'. 'b'. 'S8' } } do: [ :each | 
		fsm transitionsAdd: (FSMTransitionRule withTriplet: each) ].
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
	fsm validateParams
	"fsm dump" "Dump FSM Structures to console (Transcript in Pharo/Smalltalk/Sqeak)"
]

{ #category : #tests }
FSMTest >> testInitializationIsOk [

	| fsmempty |
	fsmempty := FSM new.
	self assert: fsmempty inputalphabet isEmpty.
	self assert: fsmempty outputalphabet isEmpty.
	self assert: fsmempty endstates isEmpty.
	self assert: fsmempty startstate equals: FSMState new.
	self assert: fsmempty curstate equals: FSMState new.
	self assert: fsmempty transitions isEmpty.
	self assert: fsmempty endstate_unrecognized equals: FSMState new.
	self assert: fsmempty isfinal not.
	self assert: fsmempty isrecognized not .
	self assert: fsmempty inputSequence isEmpty
]

{ #category : #tests }
FSMTest >> testInputSequence1 [

	fsm resetFSMState.
	({ 'a'. 'b'. 'a'. 'a'. 'a' } collect: [ :eachSymbol | 
		 FSMInputSymbol withMnemonic: eachSymbol ]) do: [ 
		:eachFSMInputSymbol | fsm evalInpSymb: eachFSMInputSymbol ].
	self
		assert: fsm isfinal;
		assert: fsm isrecognized
]

{ #category : #tests }
FSMTest >> testInputSequence2 [

	fsm resetFSMState.
	({ 'a'. 'b'. 'a'. 'a'. 'a'. 'c' } collect: [ :eachSymbol | 
		 FSMInputSymbol withMnemonic: eachSymbol ]) do: [ 
		:eachFSMInputSymbol | fsm evalInpSymb: eachFSMInputSymbol ].
	self
		assert: fsm isfinal;
		assert: fsm isrecognized not
]

{ #category : #tests }
FSMTest >> testInputSequence3 [

	fsm resetFSMState.
	({ 'a'. 'b'. 'a'. 'a'. 'a'. 'c'. 'c'. 'f'. 'd' } collect: [ 
		 :eachSymbol | FSMInputSymbol withMnemonic: eachSymbol ]) do: [ 
		:eachFSMInputSymbol | fsm evalInpSymb: eachFSMInputSymbol ].
	self
		assert: fsm isfinal;
		assert: fsm isrecognized not
]

{ #category : #tests }
FSMTest >> testInputSequence4 [

	fsm resetFSMState.
	({ 'a'. 'b'. 'a'. 'a'. 'a'. 'a'. 'a'. 'a'. 'a' } collect: [ 
		 :eachSymbol | FSMInputSymbol withMnemonic: eachSymbol ]) do: [ 
		:eachFSMInputSymbol | fsm evalInpSymb: eachFSMInputSymbol ].
	self
		assert: fsm isfinal;
		assert: fsm isrecognized
]

{ #category : #tests }
FSMTest >> testInputSequence5 [

	fsm resetFSMState.
	({ 'b'. 'd'. 'e'. 'a'. 'a' } collect: [ :eachSymbol | 
		 FSMInputSymbol withMnemonic: eachSymbol ]) do: [ 
		:eachFSMInputSymbol | fsm evalInpSymb: eachFSMInputSymbol ].
	self
		assert: fsm isfinal;
		assert: fsm isrecognized
]

{ #category : #tests }
FSMTest >> testInputSequence6 [

	fsm resetFSMState.
	({ 'b'. 'd'. 'e'. 'f'. 'g'. 'b'. 'd'. 'e'. 'a'. 'a' } collect: [ 
		 :eachSymbol | FSMInputSymbol withMnemonic: eachSymbol ]) do: [ 
		:eachFSMInputSymbol | fsm evalInpSymb: eachFSMInputSymbol ].
	self
		assert: fsm isfinal;
		assert: fsm isrecognized
]

{ #category : #tests }
FSMTest >> testInputSequence7 [

	fsm resetFSMState.
	({ 'b'. 'd'. 'e'. 'f'. 'g'. 'b'. 'd'. 'e'. 'a'. 'a'. 'f' } collect: [ 
		 :eachSymbol | FSMInputSymbol withMnemonic: eachSymbol ]) do: [ 
		:eachFSMInputSymbol | fsm evalInpSymb: eachFSMInputSymbol ].
	self
		assert: fsm isfinal;
		assert: fsm isrecognized not
]

{ #category : #tests }
FSMTest >> testMatchRandomInputSequenceWithLength10 [

	^ self assert: (self testMatchRandomInputSequenceWithLength: 10)
]

{ #category : #tests }
FSMTest >> testMatchRandomInputSequenceWithLength3 [

	^ self assert: (self testMatchRandomInputSequenceWithLength: 3)
]

{ #category : #tests }
FSMTest >> testMatchRandomInputSequenceWithLength4 [

	^ self assert: (self testMatchRandomInputSequenceWithLength: 4)
]

{ #category : #tests }
FSMTest >> testMatchRandomInputSequenceWithLength5 [

	^ self assert: (self testMatchRandomInputSequenceWithLength: 5)
]

{ #category : #tests }
FSMTest >> testMatchRandomInputSequenceWithLength6 [

	^ self assert: (self testMatchRandomInputSequenceWithLength: 6)
]

{ #category : #tests }
FSMTest >> testMatchRandomInputSequenceWithLength7 [

	^ self assert: (self testMatchRandomInputSequenceWithLength: 7)
]

{ #category : #tests }
FSMTest >> testMatchRandomInputSequenceWithLength8 [

	^ self assert: (self testMatchRandomInputSequenceWithLength: 8)
]

{ #category : #tests }
FSMTest >> testMatchRandomInputSequenceWithLength9 [

	^ self assert: (self testMatchRandomInputSequenceWithLength: 9)
]

{ #category : #tests }
FSMTest >> testMatchRandomInputSequenceWithLength: aRandomSequenceLength [
	| fsmiab |
	fsmiab := fsm inputalphabet asOrderedCollection.
	[ true ] whileTrue: [ 
		| randinpsequence |
		randinpsequence := OrderedCollection new.
		fsm resetFSMState.
		1 to: aRandomSequenceLength do: [ :x | 
			randinpsequence add: ( fsmiab at:
					 fsm inputalphabet size atRandom) ].
		randinpsequence do: [ :eachFSMInputSymbol | 
			fsm evalInpSymb: eachFSMInputSymbol ].
		fsm isrecognized ifTrue: [ Transcript
				show: 'randinpsequence: ';
				show: randinpsequence;
				show: ', isfinal : ';
				show: fsm isfinal;
				show: ', isrecognized : ';
				show: fsm isrecognized;
				cr;
				cr.
			^ true ] ].
	^ false
]
