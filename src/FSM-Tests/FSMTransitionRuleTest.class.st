Class {
	#name : #FSMTransitionRuleTest,
	#superclass : #TestCase,
	#category : #'FSM-Tests-Base'
}

{ #category : #tests }
FSMTransitionRuleTest >> testComparisonsOk [

	| fsmtr |
	fsmtr := FSMTransitionRule new.
	self assert: fsmtr equals: FSMTransitionRule new.
	self assert:
		fsmtr ~= (FSMTransitionRule withTriplet: { 'S1'. 'x'. 'S900' }).
	self
		assert: (FSMTransitionRule withTriplet: { 'S112'. 'z'. 'S120' })
		equals: (FSMTransitionRule withTriplet: { 'S112'. 'z'. 'S120' }).
	self assert:
		(FSMTransitionRule withTriplet: { 'S112'. 'z'. 'S120' })
		~= (FSMTransitionRule withTriplet: { 'S1'. 'l'. 'S900' })
]

{ #category : #tests }
FSMTransitionRuleTest >> testInitializationIsOk [

	| fsmtr |
	fsmtr := FSMTransitionRule new.
	self assert: fsmtr notNil.

]
