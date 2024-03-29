Class {
	#name : #SimpleRETokenizerTest,
	#superclass : #TestCase,
	#category : #'FSM-Tests-Base'
}

{ #category : #tests }
SimpleRETokenizerTest >> testComparisonsOK [

	| inst1 inst2 |
	inst1 := SimpleRETokenizer new.
	inst2 := SimpleRETokenizer new.
	self assert: inst1 equals: inst2.
]

{ #category : #tests }
SimpleRETokenizerTest >> testInitializationIsOk [ 
			
	| inst |
	inst := SimpleRETokenizer new.
	self assert: inst notNil.
	self assert: inst input_alphabet notNil.
	self assert: inst input_alphabet equals: FSMInputAlphabet new.
	self assert: inst re_string equals: ''.
]

{ #category : #tests }
SimpleRETokenizerTest >> testWorking [

	| inst tokens test_tokens |
	test_tokens :=
	OrderedCollection withAll: { 
		FSMInputSymbol withMnemonic: 'a'.
		FSMInputSymbol withMnemonic: 'b'.
		FSMInputSymbol withMnemonic: 'c'.
		FSMInputSymbol withMnemonic: '*'.
		FSMInputSymbol withMnemonic: 'd'.
		FSMInputSymbol withMnemonic: '+'.
	}.
	inst := SimpleRETokenizer with: 'abc*d+'.
	tokens := inst tokenizeRun.
	self assert: (tokens size) equals: 6.
	self assert: test_tokens equals: tokens.
]
