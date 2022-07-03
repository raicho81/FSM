Class {
	#name : #FSMStateTest,
	#superclass : #TestCase,
	#category : #'FSM-Tests-Base'
}

{ #category : #tests }
FSMStateTest >> testComparisonsOK [

	| testmnemonics |
	self assert: FSMState new equals: FSMState new.
	testmnemonics := { 'a'. 'b'. 'c'. 'd'. 'e'. 'f' }.
	testmnemonics do: [ :m | 
		self
			assert: (FSMState withMnemonic: m)
			equals: (FSMState withMnemonic: m).
		self assert: (FSMState withMnemonic: m) ~= FSMState new.
		self assert:
			(FSMState withMnemonic: m) ~= (FSMState withMnemonic: 'x').
		self assert:
			(FSMState withMnemonic: m) ~= (FSMState withMnemonic: 'y').
	self assert:
		(FSMState withMnemonic: m) ~= (FSMState withMnemonic: 'z') ]
]

{ #category : #tests }
FSMStateTest >> testInitializationIsOk [

	self assert: FSMState new equals: FSMState new

]
