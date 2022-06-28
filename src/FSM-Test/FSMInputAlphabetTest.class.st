Class {
	#name : #FSMInputAlphabetTest,
	#superclass : #TestCase,
	#category : #'FSM-Test'
}

{ #category : #tests }
FSMInputAlphabetTest >> testInitializationIsOk [

	|fsmiab|
	fsmiab := FSMInputAlphabet new.
	self assert: fsmiab isEmpty.
]
