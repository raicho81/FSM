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
			nextPutAll: k key;
			nextPutAll: '->';
			nextPutAll: k value;
			nextPutAll: '->';
			nextPutAll: (self at: k);
			nextPutAll: '|' ]
]
