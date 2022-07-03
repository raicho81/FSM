Class {
	#name : #FSMTransitionTest,
	#superclass : #TestCase,
	#category : #'FSM-Tests-Base'
}

{ #category : #tests }
FSMTransitionTest >> testInitializationIsOk [

	| fsmtr |
	fsmtr := FSMTransition new.
	self assert: fsmtr key equals: ''.
	self assert: fsmtr value equals: ''
]
