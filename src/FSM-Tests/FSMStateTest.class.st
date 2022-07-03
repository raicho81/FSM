Class {
	#name : #FSMStateTest,
	#superclass : #TestCase,
	#category : #'FSM-Tests-Base'
}

{ #category : #tests }
FSMStateTest >> testInitializationIsOk [

	self assert: FSMState new equals: FSMState new
]
