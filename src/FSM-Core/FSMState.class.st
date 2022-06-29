Class {
	#name : #FSMState,
	#superclass : #Object,
	#instVars : [
		'mnemonic',
		'symbolvalue',
		'symbolvaue'
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

{ #category : #accessing }
FSMState >> symbolvalue [

	^ symbolvalue
]

{ #category : #accessing }
FSMState >> symbolvalue: aString [ 
	symbolvalue := aString
]
