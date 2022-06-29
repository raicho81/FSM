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
FSMState class >> withMnemonic: aMnemonic withValue: aValue [

	| fsmstate |
	fsmstate := FSMState new.
	fsmstate
		mnemonic: aMnemonic;
		symbolvalue: aValue.
	^fsmstate
]

{ #category : #comparing }
FSMState >> = aState [
^ self mnemonic = aState mnemonic and: self symbolvalue = aState symbolvalue. 
]

{ #category : #comparing }
FSMState >> hash [ 
	self identityHash
	
]

{ #category : #initialization }
FSMState >> initialize [

	super initialize.
	mnemonic := nil.
	symbolvalue = nil
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

	aStream nextPutAll: '('; nextPutAll: self mnemonic asString; nextPutAll: '/'; nextPutAll: self symbolvalue asString; nextPutAll: ')'.
]

{ #category : #accessing }
FSMState >> symbolvalue [

	^ symbolvalue
]

{ #category : #accessing }
FSMState >> symbolvalue: aString [ 
	symbolvalue := aString
]
