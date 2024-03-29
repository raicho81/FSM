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
		'transitions',
		'endStateEvent',
		'inputSequence',
		'endstate_unrecognized'
	],
	#category : #'FSM-Core-Base'
}

{ #category : #accessing }
FSM >> curstate [
	^ curstate
]

{ #category : #accessing }
FSM >> curstate: aState [

	curstate := aState
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
		show: 'Current input sequence: ';
		show: inputSequence asString;
		cr;
		show: 'Current FSM state: ';
		show: curstate asString;
		show: ', isfinal: ';
		show: self isfinal;
		show: ', isrecognized: ';
		show: self isrecognized;
		cr;
		show: 'Current FSM endstate_unrecognized: ';
		show: endstate_unrecognized asString;
		cr;
		show: 'FSM Final (End) States: ';
		show: endstates asString;
		cr;
		show: 'FSM transitions: ';
		show: transitions asString;
		cr;
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
FSM >> endstate_unrecognized [
	^ endstate_unrecognized
]

{ #category : #accessing }
FSM >> endstate_unrecognized: aFSMState [

	endstate_unrecognized := aFSMState
]

{ #category : #accessing }
FSM >> endstates [
	^ endstates
]

{ #category : #accessing }
FSM >> endstates: aSet [
	endstates := aSet
]

{ #category : #accessing }
FSM >> endstatesAdd: aFSMState [ 
	self endstates add: aFSMState 
]

{ #category : #compute }
FSM >> evalInpSymb: aFSMInputSymbol [

	| assoc |
	inputSequence add: aFSMInputSymbol.
	curstate = endstate_unrecognized ifTrue: [ ^ self ].	
	assoc := Association key: curstate value: aFSMInputSymbol.
	(transitions keys includes: assoc)
		ifTrue: [ self curstate: (transitions at: assoc) ]
		ifFalse: [ self curstate: self endstate_unrecognized ]
]

{ #category : #'events-triggering' }
FSM >> fireEndStateEvent [
	endStateEvent value: { 
			('inputSequence' -> inputSequence).
			('isfinal' -> self isfinal).
			('isrecognized' -> self isrecognized) }
]

{ #category : #initialization }
FSM >> initialize [

	inputalphabet := FSMInputAlphabet new.
	outputalphabet := FSMOutputAlphabet new.
	startsymbol := FSMState new. "By convention the non-terminals are all *UPPERCASE* followed by their respective index in the non-terminals set. The start symbol is S0."
	curstate := startsymbol.
	endstates := FSMEndStates new.
	transitions := FSMTransitionsRulesLUT new.
	endStateEvent := WeakMessageSend new selector: #update.
	inputSequence := OrderedCollection new.
	endstate_unrecognized := FSMState new.
]

{ #category : #accessing }
FSM >> inputAlphabetAdd: aFSMInputSymbol [
	inputalphabet add: aFSMInputSymbol.
]

{ #category : #accessing }
FSM >> inputSequence [

	^ inputSequence
]

{ #category : #accessing }
FSM >> inputalphabet [
	^ inputalphabet
]

{ #category : #accessing }
FSM >> inputalphabet: aSet [

	inputalphabet := aSet.
]

{ #category : #testing }
FSM >> isfinal [

	^ endstates includes: self curstate
]

{ #category : #testing }
FSM >> isrecognized [

	^ self isfinal and: (self curstate ~= self endstate_unrecognized)
]

{ #category : #accessing }
FSM >> outputAlphabetAdd: aFSMState [

	outputalphabet add: aFSMState
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
FSM >> resetFSMState [

	curstate := startsymbol.
		inputSequence := OrderedCollection new
]

{ #category : #run }
FSM >> runWithArray: aCollection [

	self validateParams.
	aCollection do: [ :inputsymb | 
		self evalInpSymb: inputsymb.
		self isfinal ifTrue: [ 
			self fireEndStateEvent.
			self isrecognized ifFalse: [ self resetFSMState ] ] ]
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

{ #category : #accessing }
FSM >> transitionsAdd: aFSMTransition [ 
	self transitions add: aFSMTransition
]

{ #category : #validation }
FSM >> validateParams [

	"Do some basic validation of the input data."

	endstates ifEmpty: [ 
		self error:
			'Empty end/final tsates set. No need to run infinitely right ;) Aborting ...' ].
	startsymbol = FSMState new ifFalse: [ 
		self error:
			'Wrong start state. Shuld be "S0". FSM wasnt reset? Aborting ...' ].
	inputalphabet ifEmpty:  [ 
		self error:
			'Empty inputalphabet set. No need to run infinitely right ;) Aborting ...' ].
	endstate_unrecognized ~= FSMState new ifFalse: [ 
		self error:
			'The intercept state (unrecognized state) must be set. Aborting ...' ].
	transitions ifEmpty: [ 
		self error: 'The transitions LUT must not be empty. Aborting ...' ]
]
