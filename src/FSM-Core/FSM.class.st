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
	transitions := FSMTranasitions new.
	startsymbol := nil.
	curstate := startsymbol.
	endstates :=  FSMOutputAlphabet new.
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
