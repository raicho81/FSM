"
FSMTRansition - a class representing a transition of the form S'->a'->S'' directly inheriting from Association for more convenience.
"
Class {
	#name : #FSMTransitionRule,
	#superclass : #Association,
	#category : #'FSM-Core-Base'
}

{ #category : #'instance creation' }
FSMTransitionRule class >> withState: aFSMState withInputSymbol: aFSMInputSymbol withNewState: aNewFSMState [

	| instance |
	instance := self new.
	instance key: aFSMState -> aFSMInputSymbol.
	instance value: aNewFSMState.
	^ instance
]

{ #category : #'instance creation' }
FSMTransitionRule class >> withTriplet: aTriplet [

	| instance |
	instance := self
		withState: (FSMState withMnemonic: (aTriplet at: 1))
		withInputSymbol: (FSMInputSymbol withMnemonic: (aTriplet at: 2))
		withNewState: (FSMState withMnemonic: (aTriplet at: 3)).
	^ instance
]

{ #category : #initialization }
FSMTransitionRule >> initialize [

	key := ''->''.
	value := ''
]
