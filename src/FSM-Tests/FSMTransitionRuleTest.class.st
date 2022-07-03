Class {
	#name : #FSMTransitionRuleTest,
	#superclass : #TestCase,
	#category : #'FSM-Tests-Base'
}

{ #category : #tests }
FSMTransitionRuleTest >> testInitializationIsOk [

	| fsmtr |
	fsmtr := FSMTransitionRule new.
	self assert: fsmtr key equals: ''.
	self assert: fsmtr value equals: ''
]
