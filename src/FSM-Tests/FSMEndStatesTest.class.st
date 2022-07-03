Class {
	#name : #FSMEndStatesTest,
	#superclass : #TestCase,
	#category : #'FSM-Tests-Base'
}

{ #category : #tests }
FSMEndStatesTest >> testComparisonsOk [

	| fsmendstates fsmendstates1 |
	fsmendstates := FSMEndStates new.
	fsmendstates1 := FSMEndStates new.
	self assert: fsmendstates equals: FSMEndStates new.
	self assert: FSMEndStates new equals: FSMEndStates new.
	fsmendstates add: (FSMState withMnemonic: 'S42').
	fsmendstates1 add: (FSMState withMnemonic: 'S24').
	self assert: fsmendstates ~= fsmendstates1.
	fsmendstates add: (FSMState withMnemonic: 'S24').
	fsmendstates1 add: (FSMState withMnemonic: 'S42').
	self assert: fsmendstates equals: fsmendstates1.	
]

{ #category : #tests }
FSMEndStatesTest >> testInitializationIsOk [

	| fsmendstates |
	fsmendstates := FSMEndStates new.
	self assert: fsmendstates isEmpty.

]
