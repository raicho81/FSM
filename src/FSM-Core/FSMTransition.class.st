"
FSMTRansition - a class representing a transition of the form S'->a'->S'' directly inheriting from Association for more convenience.
"
Class {
	#name : #FSMTransition,
	#superclass : #Association,
	#category : #'FSM-Core-Base'
}

{ #category : #'instance creation' }
FSMTransition class >> withState: aState withInputSymbol: aInputSymbol withNewState: aNewState [

	| instance |
	instance := self new.
	instance key: aState -> aInputSymbol.
	instance value: aNewState.
	^ instance
]

{ #category : #'instance creation' }
FSMTransition class >> withTriplet: aTriplet [

	| instance |
	instance := self
		withState: (FSMState withMnemonic: (aTriplet at: 1))
		withInputSymbol: (FSMInputSymbol withMnemonic: (aTriplet at: 2))
		withNewState: (FSMState withMnemonic: (aTriplet at: 3)).
	^ instance
]

{ #category : #initialization }
FSMTransition >> initialize [

	key := ''.
	value := ''
]
