"
The main FSM class, which will do the heavy lifting.
"
Class {
	#name : #FSM,
	#superclass : #Object,
	#instVars : [
		'inputalphabet',
		'outputalphabet',
		'startsymbol',
		'endstates',
		'curstate',
		'transitions'
	],
	#category : #'FSM-Core'
}

{ #category : #accessing }
FSM >> curstate [
	^ curstate
]

{ #category : #debugging }
FSM >> dump [

	Transcript
		show: 'Input alphabet (terminals): ';
		show: inputalphabet asString;
		cr;
		show: 'Output alphabet (non-terminals): ';
		show: outputalphabet asString;
		cr;
		show: 'Start symbol: ';
		show: startsymbol asString;
		cr;
		show: 'Current FSM state: ';
		show: curstate asString;
		cr;
		show: 'FSM Final (End) States: ';
		show: endstates asString;
		cr;
		show: 'FSM transitions: ';
		show: transitions asString;
		cr
]

{ #category : #debugging }
FSM >> dumpToStream: aStream [

	aStream
		nextPut: inputalphabet asString;
		cr.
	aStream
		nextPut: outputalphabet asString;
		cr.
	aStream
		nextPut: startsymbol asString;
		cr.
	aStream
		nextPut: curstate asString;
		cr.
	aStream
		nextPut: endstates asString;
		cr.
	aStream
		nextPut: transitions asString;
		cr
]

{ #category : #accessing }
FSM >> endstates [
	^ endstates
]

{ #category : #accessing }
FSM >> endstates: aSet [
	endstates := aSet
]

{ #category : #compute }
FSM >> eval: aFSMInputSymbol [

	self validateParams.
]

{ #category : #compute }
FSM >> evalInpSymb: aFSMInputSymbol [

	| a |
	self validateParams.

	a := Association
		     key: aFSMInputSymbol mnemonic
		      value: curstate mnemonic
]

{ #category : #initialization }
FSM >> initialize [

	inputalphabet := FSMInputAlphabet new.
	outputalphabet := FSMOutputAlphabet new.
	startsymbol := FSMState withMnemonic: 'S0' withValue: 'S0'. "By convention the non-terminals are all *UPPERCASE* followed by their respective index in the non-terminals set. The start symbol is S0."
	curstate := startsymbol.
	endstates := FSMOutputAlphabet new.
	transitions := FSMTransitions new
]

{ #category : #accessing }
FSM >> inputalphabet [
	^ inputalphabet
]

{ #category : #accessing }
FSM >> inputalphabet: aSet [

	inputalphabet := aSet.
]

{ #category : #accessing }
FSM >> outputalphabet [
	^ outputalphabet
]

{ #category : #accessing }
FSM >> outputalphabet: aSet [

	outputalphabet := aSet.
]

{ #category : #initialization }
FSM >> resetFSM [

	curstate := startsymbol.
]

{ #category : #run }
FSM >> runWithArray: aCollection [

	aCollection do: [ :inputsymb | self evalInpSymb inputsymb ]
]

{ #category : #accessing }
FSM >> startstate [
	^ startsymbol
]

{ #category : #accessing }
FSM >> transitions [
	^ transitions
]

{ #category : #accessing }
FSM >> transitions: aSet [

	transitions := aSet
]

{ #category : #initialization }
FSM >> validateParams [

	endstates size <= 0 ifTrue: [ 
		self error:
			'Empty end/final tsates set. No need to run infinitely right ;) Aborting ...'.
	startsymbol = FSMState new ifFalse:
		self error:
			'Wrong start state. Shuld be "S0". FSM wasnt reset? Aborting ...' ].

	(inputalphabet size <= 0)
		self error:
			'Empty inputalphabet set. No need to run infinitely right ;) Aborting ...'.
		
		(inputalphabet size <= 0)
		self error:
			'Empty inputalphabet set. No need to run infinitely right ;) Aborting ...'.
]
