Class {
	#name : #FSMInputSymbolTest,
	#superclass : #TestCase,
	#category : #'FSM-Tests-Base'
}

{ #category : #tests }
FSMInputSymbolTest >> testInitializationIsOk [

	| fsminsymb |
	fsminsymb := FSMInputSymbol withMnemonic: 'a'.
	self assert: fsminsymb equals: (FSMInputSymbol withMnemonic: 'a').
	self assert: fsminsymb ~= (FSMInputSymbol withMnemonic: 'b')
]
