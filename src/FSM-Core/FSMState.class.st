"
FSMState - represent an non-terminal symbol i.e. an output alphabet symbol. The state has a mnemonic (the symbol code if you wish and a value for future use).
"
Class {
	#name : #FSMState,
	#superclass : #Object,
	#instVars : [
		'mnemonic',
		'symbolvalue'
	],
	#category : #'FSM-Core'
}

{ #category : #'instance creation' }
FSMState class >> withMnemonic: aMnemonic [

	| fsmstate |
	fsmstate := self new.
	fsmstate
		mnemonic: aMnemonic;
		symbolvalue: aMnemonic.
	^ fsmstate
]

{ #category : #'instance creation' }
FSMState class >> withMnemonic: aMnemonic withValue: aValue [

	| fsmstate |
	fsmstate := self new.
	fsmstate
		mnemonic: aMnemonic;
		symbolvalue: aValue.
	^ fsmstate
]

{ #category : #comparing }
FSMState >> = aState [
^ self mnemonic = aState mnemonic and: self symbolvalue = aState symbolvalue. 
]

{ #category : #comparing }
FSMState >> hash [

	"Common pattern in Smalltalk to define hash function."
	^ (self mnemonic, self symbolvalue) hash bitXor: (self mnemonic, self symbolvalue) hash
]

{ #category : #initialization }
FSMState >> initialize [

	super initialize.
	mnemonic := 'S0'.
	symbolvalue := 'S0'
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
		cr;
		nextPutAll: '(';
		nextPutAll: self mnemonic asString;
		nextPutAll: '/';
		nextPutAll: self symbolvalue asString;
		nextPutAll: ')';
		cr
]

{ #category : #accessing }
FSMState >> symbolvalue [

	^ symbolvalue
]

{ #category : #accessing }
FSMState >> symbolvalue: aString [ 
	symbolvalue := aString
]
