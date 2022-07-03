Class {
	#name : #FSMInputAlphabetTest,
	#superclass : #TestCase,
	#category : #'FSM-Tests-Base'
}

{ #category : #tests }
FSMInputAlphabetTest >> testComparisonsOk [

	| fsmiab fsmiab1 |
	fsmiab := FSMInputAlphabet new.
	fsmiab
		add: (FSMInputSymbol withMnemonic: 'a');
		add: (FSMInputSymbol withMnemonic: 'b');
		add: (FSMInputSymbol withMnemonic: 'c').
	fsmiab1 := FSMInputAlphabet new.
	fsmiab1
		add: (FSMInputSymbol withMnemonic: 'f');
		add: (FSMInputSymbol withMnemonic: 'd').
	self assert: (fsmiab includes: (FSMInputSymbol withMnemonic: 'a')).
	self assert:
		(fsmiab includes: (FSMInputSymbol withMnemonic: 'f')) not.
	self assert: (fsmiab1 includes: (FSMInputSymbol withMnemonic: 'f')).
	self assert:
		(fsmiab1 includes: (FSMInputSymbol withMnemonic: 'a')) not.
	self assert:
		(fsmiab1 includes: (FSMInputSymbol withMnemonic: 'd')).
	self assert: fsmiab ~= fsmiab1
]

{ #category : #tests }
FSMInputAlphabetTest >> testInitializationIsOk [

	| fsmiab |
	fsmiab := FSMInputAlphabet new.
	self assert: fsmiab notNil.
	self assert: fsmiab isEmpty.

]
