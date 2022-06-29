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

{ #category : #accessing }
FSM >> endstates [
	^ endstates
]

{ #category : #initialization }
FSM >> initialize [

	inputalphabet := FSMInputAlphabet new.
	outputalphabet := FSMOutputAlphabet new.
	startsymbol := FSMState withMnemonic: 'S0' withValue: 'S0'.
	curstate := startsymbol.
	endstates := FSMOutputAlphabet new.
	transitions := FSMTransitions new
]

{ #category : #accessing }
FSM >> inputalphabet [
	^ inputalphabet
]

{ #category : #accessing }
FSM >> outputalphabet [
	^ outputalphabet
]

{ #category : #accessing }
FSM >> startstate [
	^ startsymbol
]

{ #category : #accessing }
FSM >> transitions [
	^ transitions
]
