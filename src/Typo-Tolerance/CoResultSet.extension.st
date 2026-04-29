Extension { #name : 'CoResultSet' }

{ #category : '*Typo-Tolerance' }
CoResultSet >> fetch: anInteger [

	| newResults |
	newResults := fetcher next: anInteger.
	results addAll: (filter sortEntries: newResults)
]

{ #category : '*Typo-Tolerance' }
CoResultSet >> fetchAll [

	results addAll: (filter sortEntries: fetcher upToEnd )
]
