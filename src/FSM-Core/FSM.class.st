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
		show: 'Input alphabet (terminals): '; show: inputalphabet asString;
		cr;
		show: 'Outout alphabet (non-terminals): '; show: outputalphabet asString;
		cr;
		show: 'Start symbol: ';show: startsymbol asString;
		cr;
		show: 'Current FSM state: ';show: curstate asString;
		cr;
		show: 'FSM Final (End) States: ';show: endstates asString;
		cr;
		show: 'FSM transitions: '; show: transitions asString;
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

{ #category : #accessing }
FSM >> startstate [
	^ startsymbol
]

{ #category : #accessing }
FSM >> transitions [
	^ transitions
]
