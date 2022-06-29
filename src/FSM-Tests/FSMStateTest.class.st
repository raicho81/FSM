Class {
	#name : #FSMStateTest,
	#superclass : #TestCase,
	#category : #'FSM-Tests'
}

{ #category : #tests }
FSMStateTest >> testInitializationIsOk [

	| fsmstate |
	fsmstate := FSMState withMnemonic: 'S0'.
	self assert: fsmstate mnemonic equals: 'S0'.
	self assert: fsmstate symbolvalue equals: 'S0'
]
