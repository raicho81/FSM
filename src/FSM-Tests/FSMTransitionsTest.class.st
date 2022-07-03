Class {
	#name : #FSMTransitionsTest,
	#superclass : #TestCase,
	#category : #'FSM-Tests-Base'
}

{ #category : #tests }
FSMTransitionsTest >> testInitializationIsOk [

	| fsmtrans t1 t2 t3|
	fsmtrans := FSMTransitions new.
	t1 := FSMTransition withTriplet: { '0'. 'a'.  'S1' }.
	t2 := FSMTransition withTriplet: { 'S1'. 'b'. 'S2' }.
	t3 := FSMTransition withTriplet: { 'S2'. 'e'. 'S4' }.
	fsmtrans add: t1.
	fsmtrans add: t2.
	self assert: (fsmtrans at: t1 key) equals: t1 value.
	self assert: (fsmtrans at: t2 key) equals: t2 value.
	fsmtrans removeKey: t1 key; removeKey: t2 key.
	self assert: fsmtrans isEmpty
]
