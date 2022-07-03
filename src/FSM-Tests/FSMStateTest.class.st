Class {
	#name : #FSMStateTest,
	#superclass : #TestCase,
	#category : #'FSM-Tests-Base'
}

{ #category : #tests }
FSMStateTest >> testInitializationIsOk [

	| testmnemonics |
	self assert: FSMState new equals: FSMState new.
	testmnemonics := { 'a'. 'b'. 'c'. 'd'. 'e'. 'f' }.
	testmnemonics do: [ :m | 
		self
			assert: (FSMState withMnemonic: m)
			equals: (FSMState withMnemonic: m).
		self
			assert: (FSMState withMnemonic: m) ~= (FSMState new) ]
]
