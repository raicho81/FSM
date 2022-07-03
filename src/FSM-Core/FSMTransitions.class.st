"
FSMTransitions - Dictionary holding the state transitions of the FSM.
"
Class {
	#name : #FSMTransitions,
	#superclass : #Dictionary,
	#category : #'FSM-Core-Base'
}

{ #category : #printing }
FSMTransitions >> printOn: aStream [

	self keysDo: [ :k | 
		aStream
			nextPutAll: '|';
			nextPutAll: k key asString;
			nextPutAll: '->';
			nextPutAll: k value asString;
			nextPutAll: '->';
			nextPutAll: (self at: k) asString;
			nextPutAll: '|' ]
]
