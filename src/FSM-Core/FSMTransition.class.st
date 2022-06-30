"
FSMTRansition - a class representing a transition of the form S'->a'->S'' directly inheriting from Association for more convenience.
"
Class {
	#name : #FSMTransition,
	#superclass : #Association,
	#instVars : [
		'mnemonic',
		'symbolvalue'
	],
	#category : #'FSM-Core'
}

{ #category : #'instance creation' }
FSMTransition class >> withState: aState withInputSymbol: aInputSymbol withNewState: aNewState [

	| t |
	t := self new.
	t key: aState -> aInputSymbol.
	t value: aNewState.
	^ t
]

{ #category : #'instance creation' }
FSMTransition class >> withTriplet: aTriplet [

	| instance |
	instance := self
		withState: (aTriplet at: 1)
		withInputSymbol: (aTriplet at: 2)
		withNewState: (aTriplet at: 3)
	^ instance
]

{ #category : #initialization }
FSMTransition >> initialize [

	key := ''.
	value := ''
]

{ #category : #accessing }
FSMTransition >> mnemonic [
	^ mnemonic
]

{ #category : #printing }
FSMTransition >> printOn: aStream [

	aStream
		cr;
		nextPutAll: '|';
		nextPutAll: self mnemonic asString;
		nextPutAll: '->';
		nextPutAll: self symbolvalue asString;
		nextPutAll: '|)|';
		cr
]

{ #category : #accessing }
FSMTransition >> symbolvalue [
	^ symbolvalue
]
