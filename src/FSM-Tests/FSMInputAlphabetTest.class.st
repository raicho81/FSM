Class {
	#name : #FSMInputAlphabetTest,
	#superclass : #TestCase,
	#category : #'FSM-Tests-Base'
}

{ #category : #tests }
FSMInputAlphabetTest >> testInitializationIsOk [

	| fsmiab |
	fsmiab := FSMInputAlphabet new.
	self assert: fsmiab isEmpty.
	fsmiab add: (FSMInputSymbol withMnemonic: 'a').
	self assert: (fsmiab includes: (FSMInputSymbol withMnemonic: 'a')).
		self assert: (fsmiab includes: (FSMInputSymbol withMnemonic: 'b')) not
]
