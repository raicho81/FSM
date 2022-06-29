Class {
	#name : #FSMTransitionTest,
	#superclass : #TestCase,
	#category : #'FSM-Tests'
}

{ #category : #tests }
FSMTransitionTest >> testInitializationIsOk [ 
	|fsmtr|
	fsmtr := FSMTransition new.
	self assert: fsmtr key isNil.
	self assert: fsmtr value isNil.
]
