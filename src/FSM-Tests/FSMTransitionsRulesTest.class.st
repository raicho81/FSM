Class {
	#name : #FSMTransitionsRulesTest,
	#superclass : #TestCase,
	#category : #'FSM-Tests-Base'
}

{ #category : #tests }
FSMTransitionsRulesTest >> testInitializationIsOk [

	| fsmtrans t1 t2 t3 |
	fsmtrans := FSMTransitionsRules new.

	t1 := FSMTransitionRule withTriplet: { '0'. 'a'. 'S1' }.
	t2 := FSMTransitionRule withTriplet: { 'S1'. 'b'. 'S2' }.
	t3 := FSMTransitionRule withTriplet: { 'S2'. 'e'. 'S4' }.

	fsmtrans add: t1.
	fsmtrans add: t2.
	fsmtrans add: t3.

	self assert: (fsmtrans at: t1 key) equals: t1 value.
	self assert: (fsmtrans at: t2 key) equals: t2 value.
	self assert: (fsmtrans at: t3 key) equals: t3 value.

	fsmtrans
		removeKey: t1 key;
		removeKey: t2 key;
		removeKey: t3 key.

	self assert: fsmtrans isEmpty
]
