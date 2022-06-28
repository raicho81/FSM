Class {
	#name : #FSMInputSymbol,
	#superclass : #Object,
	#instVars : [
		'mnemonic',
		'symbolvalue'
	],
	#category : #'FSM-Core'
}

{ #category : #sccessing }
FSMInputSymbol class >> mnemonic: aString [ 
	self shouldBeImplemented.
]

{ #category : #'instance creation' }
FSMInputSymbol class >> withMnemonic: aMnemonic withValue: aValue [
	self mnemonic: aMnemonic; value: aValue.
]

{ #category : #initialization }
FSMInputSymbol >> initialize [

	super initialize.
	mnemonic := ''.
	symbolvalue := ''
]
