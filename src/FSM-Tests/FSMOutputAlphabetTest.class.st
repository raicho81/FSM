Class {
	#name : #FSMOutputAlphabetTest,
	#superclass : #TestCase,
	#category : #'FSM-Tests-Base'
}

{ #category : #tests }
FSMOutputAlphabetTest >> testInitializationIsOk [

	| fsmoutpab |
	fsmoutpab := FSMOutputAlphabet new.
	self assert: fsmoutpab notNil .
	self assert: fsmoutpab isEmpty
]
