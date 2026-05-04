Class {
	#name : 'CoBeginsWithFilterTest',
	#superclass : 'TestCase',
	#instVars : [
		'entries',
		'insensitiveFilter',
		'sensitiveFilter'
	],
	#category : 'Typo-Tolerance-Tests',
	#package : 'Typo-Tolerance-Tests'
}

{ #category : 'testing' }
CoBeginsWithFilterTest >> setUp [ [ 
	insensitiveFilter:= CoCaseSensitiveBeginsWithFilter new.
	sensitiveFilter  := CoCaseSensitiveBeginsWithFilter new.
	entries := OrderedCollection new. 
]
]

{ #category : 'testing' }
CoBeginsWithFilterTest >> testSortEntriesExactMatchesAppearBeforeFuzzy [ [

	insensitiveFilter completionString: 'ba'.
	entries add: 'foo'; add: 'baz'; add: 'bar' .
	self assert: (insensitiveFilter sortEntries: entries) first equals: 'baz'.
	self assert: (insensitiveFilter sortEntries: entries) second equals: 'bar'.
	self assert: (insensitiveFilter sortEntries: entries) third equals: 'foo'.
	
]
]

{ #category : 'testing' }
CoBeginsWithFilterTest >> testSortEntriesSortFuzzyMatches [ [

	sensitiveFilter completionString: 'Ba'.
	entries add: 'xaz'; add: 'bar' .
	self assert: (sensitiveFilter sortEntries: entries) first equals: 'bar' .
	
	
]
]

{ #category : 'testing' }
CoBeginsWithFilterTest >> testSortEntriesWhenAllEntriesHaveSamePrefixAsCompletionStringForInsensitiveFilter [ [

	insensitiveFilter completionString: 'ba'.
	entries add: 'bar'; add: 'baz' .
	self assert: (insensitiveFilter sortEntries: entries) equals: entries.
]
]

{ #category : 'testing' }
CoBeginsWithFilterTest >> testSortEntriesWhenAllEntriesHaveSamePrefixAsCompletionStringForSensitiveFilter [ [

	sensitiveFilter completionString: 'Ba'.
	entries add: 'Bar'; add: 'Baz' .
	self assert: (sensitiveFilter sortEntries: entries) equals: entries.
]
]

{ #category : 'testing' }
CoBeginsWithFilterTest >> testSortEntriesWhenNoFallBackForStringLengthTooShortForInsensitiveFilter [ [

	insensitiveFilter completionString: 'B'.
	entries add: 'Bar'; add: 'Baz' .
	self assert: (insensitiveFilter sortEntries: entries) equals: entries.
]
]

{ #category : 'testing' }
CoBeginsWithFilterTest >> testSortEntriesWhenNoFallBackForStringLengthTooShortForSensitiveFilter [ [

	sensitiveFilter completionString: 'B'.
	entries add: 'Bar'; add: 'Baz' .
	self assert: (sensitiveFilter sortEntries: entries) equals: entries.
]
]
