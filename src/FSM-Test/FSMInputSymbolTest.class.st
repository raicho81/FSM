Class {
	#name : #FSMInputSymbolTest,
	#superclass : #TestCase,
	#instVars : [
		'mnemonic',
		'symbolvalue'
	],
	#category : #'FSM-Test'
}

{ #category : #tests }
FSMInputSymbolTest >> testInitializationIsOk [ 
	|fsminsymb|
	fsminsymb := FSMInputSymbol withMnemonic: 'a' withValue: 'a'.
	self assert: fsminsymb mnemonic equals: 'a'.
		self assert: fsminsymb symbolvalue equals: 'a'.

]
