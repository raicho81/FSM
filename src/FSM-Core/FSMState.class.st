Class {
	#name : #FSMState,
	#superclass : #Object,
	#instVars : [
		'mnemonic',
		'symbolvalue'
	],
	#category : #'FSM-Core'
}

{ #category : #initialization }
FSMState >> initialize [

	super initialize.
	mnemonic := nil.
	symbolvalue = nil
]
