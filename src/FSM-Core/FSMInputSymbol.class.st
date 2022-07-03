"
A class to represent and input (terminal symbol) with mnemonic (symbol value).
"
Class {
	#name : #FSMInputSymbol,
	#superclass : #Object,
	#instVars : [
		'mnemonic'
	],
	#category : #'FSM-Core-Base'
}

{ #category : #'instance creation' }
FSMInputSymbol class >> withMnemonic: aMnemonic [

	| inps |
	inps := self new.
	inps
		mnemonic: aMnemonic.
	^ inps
]

{ #category : #comparing }
FSMInputSymbol >> = aState [

	^ self mnemonic = aState mnemonic. 
]

{ #category : #comparing }
FSMInputSymbol >> hash [

	"Common pattern in Smalltalk to define hash function."
	^ self mnemonic hash bitXor: self mnemonic hash
]

{ #category : #initialization }
FSMInputSymbol >> initialize [

	super initialize.
	mnemonic := ''.
]

{ #category : #accessing }
FSMInputSymbol >> mnemonic [
	^ mnemonic
]

{ #category : #accessing }
FSMInputSymbol >> mnemonic: aString [ 
	mnemonic:= aString
]

{ #category : #printing }
FSMInputSymbol >> printOn: aStream [

	aStream
		nextPutAll: self mnemonic asString
]
