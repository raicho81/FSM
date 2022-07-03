Class {
	#name : #FSMInputSymbolTest,
	#superclass : #TestCase,
	#category : #'FSM-Tests-Base'
}

{ #category : #tests }
FSMInputSymbolTest >> testInitializationIsOk [ 
	|fsminsymb|
	fsminsymb := FSMInputSymbol withMnemonic: 'a' withValue: 'a'.
	self assert: fsminsymb mnemonic equals: 'a'.
		self assert: fsminsymb symbolvalue equals: 'a'.

]
