Class {
	#name : #FSMTranasitionsTest,
	#superclass : #TestCase,
	#category : #'FSM-Tests'
}

{ #category : #tests }
FSMTranasitionsTest >> testInitializationIsOk [ 
	|fsmrtransitions|
	fsmrtransitions := FSMTranasitions new.
	self assert: fsmrtransitions isEmpty.
]
