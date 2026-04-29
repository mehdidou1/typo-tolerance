Extension { #name : 'CoCaseSensitiveBeginsWithFilter' }

{ #category : '*Typo-Tolerance' }
CoCaseSensitiveBeginsWithFilter >> accepts: aCandidate [

	^ (self prefixAcceptsContents: aCandidate contents)
		or: [ CoCompletionTolerance enabled
			and: [ self fuzzyAcceptsContents: aCandidate contents ] ]
]

{ #category : '*Typo-Tolerance' }
CoCaseSensitiveBeginsWithFilter >> isCaseSensitive [

	^ true
]

{ #category : '*Typo-Tolerance' }
CoCaseSensitiveBeginsWithFilter >> prefixAcceptsContents: aString [

	^ aString beginsWith: completionString
]
