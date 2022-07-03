"
FSMState - represent an non-terminal symbol i.e. an output alphabet symbol. The state has a mnemonic (the symbol code if you wish).
"
Class {
	#name : #FSMState,
	#superclass : #Object,
	#instVars : [
		'mnemonic'
	],
	#category : #'FSM-Core-Base'
}

{ #category : #'instance creation' }
FSMState class >> withMnemonic: aMnemonic [

	| fsmstate |
	fsmstate := self new.
	fsmstate
		mnemonic: aMnemonic.
	^ fsmstate
]

{ #category : #comparing }
FSMState >> = aState [
^ self mnemonic = aState mnemonic. 
]

{ #category : #comparing }
FSMState >> hash [

	"Common pattern in Smalltalk to define hash function."
	^ self mnemonic hash bitXor: self mnemonic hash
]

{ #category : #initialization }
FSMState >> initialize [

	super initialize.
	mnemonic := 'S0'.
]

{ #category : #accessing }
FSMState >> mnemonic [
	^ mnemonic
]

{ #category : #accessing }
FSMState >> mnemonic: aString [ 
	mnemonic := aString
]

{ #category : #printing }
FSMState >> printOn: aStream [

	aStream
		nextPutAll: self mnemonic asString
]
