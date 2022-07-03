Class {
	#name : #FSMInputAlphabetTest,
	#superclass : #TestCase,
	#category : #'FSM-Tests-Base'
}

{ #category : #tests }
FSMInputAlphabetTest >> testComparisonsOk [

	| fsmiab fsmiab1 |
	fsmiab := FSMInputAlphabet new.
	fsmiab1 := FSMInputAlphabet new.
	fsmiab add: (FSMInputSymbol withMnemonic: 'a').
	fsmiab1 add: (FSMInputSymbol withMnemonic: 'f').
	self assert: (fsmiab includes: (FSMInputSymbol withMnemonic: 'a')).
	self assert:
		(fsmiab includes: (FSMInputSymbol withMnemonic: 'b')) not.
	self assert: fsmiab ~= fsmiab1
]

{ #category : #tests }
FSMInputAlphabetTest >> testInitializationIsOk [

	| fsmiab |
	fsmiab := FSMInputAlphabet new.
	self assert: fsmiab notNil.
	self assert: fsmiab isEmpty.

]
