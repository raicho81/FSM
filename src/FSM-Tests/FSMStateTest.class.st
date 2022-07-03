Class {
	#name : #FSMStateTest,
	#superclass : #TestCase,
	#category : #'FSM-Tests-Base'
}

{ #category : #tests }
FSMStateTest >> testInitializationIsOk [

	| testmnemonics |
	testmnemonics := { 'a'. 'b'. 'c'. 'd'. 'e'. 'f' }.
	testmnemonics do: [ :m | 
		self
			assert: (FSMState withMnemonic: m)
			equals: (FSMState withMnemonic: m) ]
]
