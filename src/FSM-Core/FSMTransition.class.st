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

{ #category : #initialization }
FSMTransition >> initialize [ 
	key := nil.
	value := nil.
]

{ #category : #accessing }
FSMTransition >> mnemonic [
	^ mnemonic
]

{ #category : #accessing }
FSMTransition >> symbolvalue [
	^ symbolvalue
]
