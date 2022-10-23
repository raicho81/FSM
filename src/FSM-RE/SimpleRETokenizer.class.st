Class {
	#name : #SimpleRETokenizer,
	#superclass : #Object,
	#instVars : [
		're_string',
		'input_alphabet'
	],
	#category : #'FSM-RE-Base'
}

{ #category : #'instance creation' }
SimpleRETokenizer class >> with: re_str [

	| inst |
	inst := self new.
	inst re_string: re_str.
	^ inst
]

{ #category : #comparison }
SimpleRETokenizer >> = other [
	other ifNil: [ ^ false ].
	^ self re_string = other re_string.
]

{ #category : #initialization }
SimpleRETokenizer >> initialize [ 

	input_alphabet := FSMInputAlphabet new.
	re_string := ''.
	^ self
]

{ #category : #accessing }
SimpleRETokenizer >> input_alphabet [

	^ input_alphabet
]

{ #category : #accessing }
SimpleRETokenizer >> input_alphabet: anObject [

	input_alphabet := anObject
]

{ #category : #accessing }
SimpleRETokenizer >> re_string [

	^ re_string
]

{ #category : #accessing }
SimpleRETokenizer >> re_string: anObject [

	re_string := anObject
]

{ #category : #run }
SimpleRETokenizer >> tokenizeRun [

	| tokenized_symbol_sequence |
	tokenized_symbol_sequence := OrderedCollection new.
	re_string do: [ :each | 
		tokenized_symbol_sequence add:
			(FSMInputSymbol withMnemonic: each asString).
		false ].
	tokenized_symbol_sequence do: [ :each | input_alphabet addIfNotPresent: each ].
	^ tokenized_symbol_sequence
]
