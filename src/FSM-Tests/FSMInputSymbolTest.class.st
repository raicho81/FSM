Class {
	#name : #FSMInputSymbolTest,
	#superclass : #TestCase,
	#category : #'FSM-Tests-Base'
}

{ #category : #tests }
FSMInputSymbolTest >> testComparisonsOK [

	| fsminsymb |
	fsminsymb := FSMInputSymbol withMnemonic: 'a'.
	self assert: fsminsymb equals: (FSMInputSymbol withMnemonic: 'a').
	self assert: fsminsymb equals: fsminsymb.
	self assert: fsminsymb ~= (FSMInputSymbol withMnemonic: 'b').
	self assert: fsminsymb ~= FSMInputSymbol new.
	fsminsymb := FSMInputSymbol withMnemonic: 'b'.
	self assert: fsminsymb equals: (FSMInputSymbol withMnemonic: 'b').
	self assert: fsminsymb equals: fsminsymb.
	self assert: fsminsymb ~= (FSMInputSymbol withMnemonic: 'c').
	self assert: fsminsymb ~= (FSMInputSymbol withMnemonic: 'd').
	self assert: fsminsymb ~= (FSMInputSymbol withMnemonic: 'e').
	self assert: fsminsymb ~= (FSMInputSymbol withMnemonic: 'f').
	self assert: fsminsymb ~= FSMInputSymbol new
]

{ #category : #tests }
FSMInputSymbolTest >> testInitializationIsOk [

	self assert: FSMInputSymbol new equals: FSMInputSymbol new
]
