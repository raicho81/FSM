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
	self assert: inst re_string equals: nil.
]

{ #category : #tests }
SimpleRETokenizerTest >> testWorking [

	| inst tokens |
	inst := SimpleRETokenizer with: 'abc*d+'.
	tokens := inst tokenizeRun.
	self assert: (tokens size) equals: 6
]
