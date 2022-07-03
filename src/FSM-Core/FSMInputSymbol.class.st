"
A class to represent and input (terminal symbol) with mnemonic and value, which is really optional for now probably can be used in the future.
"
Class {
	#name : #FSMInputSymbol,
	#superclass : #Object,
	#instVars : [
		'mnemonic',
		'symbolvalue'
	],
	#category : #'FSM-Core-Base'
}

{ #category : #'instance creation' }
FSMInputSymbol class >> withMnemonic: aMnemonic [

	| inps |
	inps := self new.
	inps
		mnemonic: aMnemonic;
		symbolvalue: aMnemonic.
	^ inps
]

{ #category : #'instance creation' }
FSMInputSymbol class >> withMnemonic: aMnemonic withValue: aValue [

	| inps |
	inps := self new.
	inps
		mnemonic: aMnemonic;
		symbolvalue: aValue.
	^ inps
]

{ #category : #initialization }
FSMInputSymbol >> initialize [

	super initialize.
	mnemonic := ''.
	symbolvalue := ''
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
		nextPutAll: '(';
		nextPutAll: self mnemonic asString;
		nextPutAll: '/';
		nextPutAll: self symbolvalue asString;
		nextPutAll: ')'
]

{ #category : #accessing }
FSMInputSymbol >> symbolvalue [
	^ symbolvalue
]

{ #category : #accessing }
FSMInputSymbol >> symbolvalue: aString [ 
	symbolvalue := aString 
]
