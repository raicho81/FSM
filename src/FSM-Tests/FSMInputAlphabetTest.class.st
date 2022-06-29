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
]
