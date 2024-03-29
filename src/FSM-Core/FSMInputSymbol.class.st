"
A class to represent a input (terminal symbol) with mnemonic (symbol value).
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
FSMInputSymbol >> = aFSMInputSymbol [

	^ self mnemonic = aFSMInputSymbol mnemonic
]

{ #category : #comparing }
FSMInputSymbol >> hash [

	^ self mnemonic hash
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
FSMInputSymbol >> mnemonic: aInputSymbolMnemonic [

	mnemonic := aInputSymbolMnemonic
]

{ #category : #printing }
FSMInputSymbol >> printOn: aStream [

	aStream nextPutAll: self mnemonic asString
]
