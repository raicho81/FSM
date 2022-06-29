Class {
	#name : #FSMInputSymbol,
	#superclass : #Object,
	#instVars : [
		'mnemonic',
		'symbolvalue'
	],
	#classInstVars : [
		'mnemonic',
		'symbolvalue'
	],
	#category : #'FSM-Core'
}

{ #category : #'instance creation' }
FSMInputSymbol class >> withMnemonic: aMnemonic withValue: aValue [

	|inps|
	inps:= FSMInputSymbol withMnemonic: aMnemonic  withValue: aValue.
	^inps
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

{ #category : #accessing }
FSMInputSymbol >> symbolvalue [
	^ symbolvalue
]

{ #category : #accessing }
FSMInputSymbol >> symbolvalue: aString [ 
	symbolvalue := aString 
]
