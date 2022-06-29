Class {
	#name : #FSMTransitionsTest,
	#superclass : #TestCase,
	#category : #'FSM-Tests'
}

{ #category : #tests }
FSMTransitionsTest >> testInitializationIsOk [

	| fsmtrans t1 t2 |
	fsmtrans := FSMTransitions new.
	t1 := FSMTransition
		      withState: (FSMState withMnemonic: 'S0' withValue: 'S0')
		      withInputSymbol:
		      (FSMInputSymbol withMnemonic: 'a' withValue: 'a')
		      withNewState: (FSMState withMnemonic: 'S1' withValue: 'S1').
	t2 := FSMTransition
		      withState: (FSMState withMnemonic: 'S1' withValue: 'S1')
		      withInputSymbol:
		      (FSMInputSymbol withMnemonic: 'b' withValue: 'b')
		      withNewState: (FSMState withMnemonic: 'S2' withValue: 'S2').
	fsmtrans add: t1.
	fsmtrans add: t2.
	self assert: (fsmtrans at: t1 key) equals: t1 value.
	self assert: (fsmtrans at: t2 key) equals: t2 value
]
