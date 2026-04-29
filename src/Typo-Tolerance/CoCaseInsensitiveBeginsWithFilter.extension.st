Extension { #name : 'CoCaseInsensitiveBeginsWithFilter' }

{ #category : '*Typo-Tolerance' }
CoCaseInsensitiveBeginsWithFilter >> accepts: aCandidate [

		^ (self prefixAcceptsContents: aCandidate contents)
		or: [ CoCompletionTolerance enabled
			and: [ self fuzzyAcceptsContents: aCandidate contents ] ]
]

{ #category : '*Typo-Tolerance' }
CoCaseInsensitiveBeginsWithFilter >> isCaseSensitive [

	^ false
]

{ #category : '*Typo-Tolerance' }
CoCaseInsensitiveBeginsWithFilter >> prefixAcceptsContents: aString [

	^ aString asLowercase beginsWith: completionString asLowercase
]
