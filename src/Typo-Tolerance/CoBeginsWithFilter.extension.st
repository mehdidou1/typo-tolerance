Extension { #name : 'CoBeginsWithFilter' }

{ #category : '*Typo-Tolerance' }
CoBeginsWithFilter >> fuzzyAcceptsContents: aString [

	^ (self fuzzyScoreForContents: aString) isNotNil
]

{ #category : '*Typo-Tolerance' }
CoBeginsWithFilter >> fuzzyScoreForContents: aString [

	^ CoFuzzyMatcher
		scoreForCandidate: aString
		token: completionString
		caseSensitive: self isCaseSensitive
		tolerance: CoCompletionTolerance rate
]

{ #category : '*Typo-Tolerance' }
CoBeginsWithFilter >> isCaseSensitive [

	self subclassResponsibility
]

{ #category : '*Typo-Tolerance' }
CoBeginsWithFilter >> prefixAcceptsContents: aString [

	self subclassResponsibility
]

{ #category : '*Typo-Tolerance' }
CoBeginsWithFilter >> requiresFallbackEnumeration [

	^ CoCompletionTolerance enabled
		and: [ completionString size >= CoCompletionTolerance minimumTokenSize ]
]

{ #category : '*Typo-Tolerance' }
CoBeginsWithFilter >> sortEntries: aCollection [

	| exact fuzzy |
	self requiresFallbackEnumeration ifFalse: [ ^ aCollection ].

	exact := OrderedCollection new.
	fuzzy := OrderedCollection new.

	aCollection do: [ :each |
		(self prefixAcceptsContents: each contents)
			ifTrue: [ exact add: each ]
			ifFalse: [ fuzzy add: each ] ].

	fuzzy isEmpty ifTrue: [ ^ aCollection ].

	fuzzy sort: [ :a :b |
		| scoreA scoreB |
		scoreA := self fuzzyScoreForContents: a contents.
		scoreB := self fuzzyScoreForContents: b contents.
		scoreA = scoreB
			ifTrue: [ a contents <= b contents ]
			ifFalse: [ scoreA < scoreB ] ].

	^ OrderedCollection new
		addAll: exact;
		addAll: fuzzy;
		yourself
]
