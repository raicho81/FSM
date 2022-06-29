Class {
	#name : #FSMInputSymbol,
	#superclass : #Object,
	#instVars : [
		'mnemonic',
		'symbolvalue'
	],
	#category : #'FSM-Core'
}

{ #category : #accessing }
FSMInputSymbol class >> mnemonic [
	^ mnemonic
]

{ #category : #sccessing }
FSMInputSymbol class >> mnemonic: aString [ 
	mnemonic:= aString
]

{ #category : #accessing }
FSMInputSymbol class >> symbolvalue [
	^ symbolvalue
]

{ #category : #accessing }
FSMInputSymbol class >> symbolvalue: aString [ 
	symbolvalue := aString 
]

{ #category : #'instance creation' }
FSMInputSymbol class >> withMnemonic: aMnemonic withValue: aValue [
	self mnemonic: aMnemonic; symbolvalue: aValue.
]

{ #category : #initialization }
FSMInputSymbol >> initialize [

	super initialize.
	mnemonic := ''.
	symbolvalue := ''
]
