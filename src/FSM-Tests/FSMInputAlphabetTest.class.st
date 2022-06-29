Class {
	#name : #FSMInputAlphabetTest,
	#superclass : #TestCase,
	#category : #'FSM-Tests'
}

{ #category : #tests }
FSMInputAlphabetTest >> testInitializationIsOk [

	| fsmiab |
	fsmiab := FSMInputAlphabet new.
	self assert: fsmiab isEmpty.
	fsmiab add: (FSMInputSymbol withMnemonic: 'S0' withValue: 'S0').
]
