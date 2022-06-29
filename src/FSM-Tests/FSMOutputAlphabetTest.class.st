Class {
	#name : #FSMOutputAlphabetTest,
	#superclass : #TestCase,
	#category : #'FSM-Tests'
}

{ #category : #tests }
FSMOutputAlphabetTest >> testInitializationIsOk [ 
	|fsmoutpab|
	fsmoutpab := FSMOutputAlphabet new.
	self assert: fsmoutpab isEmpty.
]
