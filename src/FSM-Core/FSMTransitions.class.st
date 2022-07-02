"
FSMTransitions - Dictionary holding the state transitions of the FSM.
"
Class {
	#name : #FSMTransitions,
	#superclass : #Dictionary,
	#category : #'FSM-Core'
}

{ #category : #printing }
FSMTransitions >> printOn: aStream [

	self keysDo: [ :k | 
		aStream
			nextPutAll: '|';
			nextPutAll: k asString;
			nextPutAll: '->';
		   nextPutAll: (self at: k) asString;
			nextPutAll: '|' ]
]
