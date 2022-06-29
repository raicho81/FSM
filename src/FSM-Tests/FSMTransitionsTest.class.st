Class {
	#name : #FSMTransitionsTest,
	#superclass : #TestCase,
	#category : #'FSM-Tests'
}

{ #category : #tests }
FSMTransitionsTest >> testInitializationIsOk [

	| fsmtrans t1 t2 t3|
	fsmtrans := FSMTransitions new.
	t1 := FSMTransition
		      withState: (FSMState withMnemonic: 'S0')
		      withInputSymbol: (FSMInputSymbol withMnemonic: 'a')
		      withNewState: (FSMState withMnemonic: 'S1').
	t2 := FSMTransition
		      withState: (FSMState withMnemonic: 'S1')
		      withInputSymbol: (FSMInputSymbol withMnemonic: 'b')
		      withNewState: (FSMState withMnemonic: 'S2').
	t3 := FSMTransition
		      withState: (FSMState withMnemonic: 'S2')
		      withInputSymbol: (FSMInputSymbol withMnemonic: 'e')
		      withNewState: (FSMState withMnemonic: 'S4').		
	fsmtrans add: t1.
	fsmtrans add: t2.
	self assert: (fsmtrans at: t1 key) equals: t1 value.
	self assert: (fsmtrans at: t2 key) equals: t2 value.
	fsmtrans
		removeKey: t1 key;
		removeKey: t2 key.
	self assert: fsmtrans isEmpty
]
