Class {
	#name : #FSMTransitionsTest,
	#superclass : #TestCase,
	#category : #'FSM-Tests'
}

{ #category : #tests }
FSMTransitionsTest >> testInitializationIsOk [

	| fsmtrans |
	fsmtrans := FSMTransitions new.
	fsmtrans add: (FSMTransition
			 withState: (FSMState withMnemonic: 'S0' withValue: 'S0')
			 withInputSymbol: (FSMInputSymbol withMnemonic: 'a' withValue: 'a')
			 withNewState: (FSMState withMnemonic: 'S1' withValue: 'S1')).
	Transcript show: fsmtrans; cr.
]
