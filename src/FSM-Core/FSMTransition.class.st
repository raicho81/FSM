Class {
	#name : #FSMTransition,
	#superclass : #Association,
	#category : #'FSM-Core'
}

{ #category : #'as yet unclassified' }
FSMTransition class >> withState: aState withInputSymbol: aInputSymbol withNewState: aNewState [

	| t |
	t := FSMTransition new.
	t key: aState -> aInputSymbol.
	t value: aNewState.
	^ t
]

{ #category : #initialization }
FSMTransition >> initialize [ 
	key := nil.
	value := nil.
]
