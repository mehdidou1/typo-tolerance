"
I store the runtime settings for fuzzy completion, such as the allowed typo rate and the minimum token size.


"
Class {
	#name : 'CoCompletionTolerance',
	#superclass : 'Object',
	#classInstVars : [
		'minimumTokenSize',
		'rate'
	],
	#category : 'Typo-Tolerance',
	#package : 'Typo-Tolerance'
}

{ #category : 'as yet unclassified' }
CoCompletionTolerance class >> defaultMinimumTokenSize [

	^ 2
]

{ #category : 'as yet unclassified' }
CoCompletionTolerance class >> defaultRate [

	^ 0.6
]

{ #category : 'accessing' }
CoCompletionTolerance class >> enabled [

	^ self rate > 0.0
]

{ #category : 'class initialization' }
CoCompletionTolerance class >> initialize [

	self reset
]

{ #category : 'accessing' }
CoCompletionTolerance class >> minimumTokenSize [

	^ minimumTokenSize ifNil: [ self defaultMinimumTokenSize ]
]

{ #category : 'accessing' }
CoCompletionTolerance class >> minimumTokenSize: anInteger [

	minimumTokenSize := (anInteger ifNil: [ self defaultMinimumTokenSize ]) max: 1
]

{ #category : 'accessing' }
CoCompletionTolerance class >> rate [

	^ rate ifNil: [ rate := self defaultRate ]
]

{ #category : 'accessing' }
CoCompletionTolerance class >> rate: aNumber [

	| value |
	value := (aNumber ifNil: [ self defaultRate ]) asFloat.
	rate := (value max: 0.0) min: 1.0
]

{ #category : 'class initialization' }
CoCompletionTolerance class >> reset [

	<script>
	rate := self defaultRate.
	minimumTokenSize := self defaultMinimumTokenSize 
]
