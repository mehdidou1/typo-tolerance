Class {
	#name : 'CoFuzzyMatcherTest',
	#superclass : 'TestCase',
	#category : 'Typo-Tolerance-Tests',
	#package : 'Typo-Tolerance-Tests'
}

{ #category : 'testing' }
CoFuzzyMatcherTest >> testDamerauLevenshteinWhenIdentity [ [ 
	self assert: (CoFuzzyMatcher damerauLevenshteinDistanceBetween: 'abc' and: 'abc' maxDistance: 0) equals: 0
]
]

{ #category : 'testing' }
CoFuzzyMatcherTest >> testDamerauLevenshteinWhenSourceIsEmpty [ [
	self assert: (CoFuzzyMatcher damerauLevenshteinDistanceBetween: '0' and: 'foo' maxDistance: 3) equals: 3
]
]

{ #category : 'testing' }
CoFuzzyMatcherTest >> testDamerauLevenshteinWhenTargetAndSourceAreEmpty [ [
	self assert: (CoFuzzyMatcher damerauLevenshteinDistanceBetween: '' and: '' maxDistance: 0) equals: 0
]
]

{ #category : 'testing' }
CoFuzzyMatcherTest >> testDamerauLevenshteinWhenTargetIsEmpty [ [
	self assert: (CoFuzzyMatcher damerauLevenshteinDistanceBetween: 'foo' and: '' maxDistance: 3) equals: 3
]
]

{ #category : 'testing' }
CoFuzzyMatcherTest >> testDamerauLevenshteinWithCaseSensitivity [ [
	self assert: (CoFuzzyMatcher damerauLevenshteinDistanceBetween: 'foo' and: 'FOO' maxDistance: 4) equals: 3
]
]

{ #category : 'testing' }
CoFuzzyMatcherTest >> testDamerauLevenshteinWithSignleAdjacentTransposition [ [
	self assert: (CoFuzzyMatcher damerauLevenshteinDistanceBetween: 'ofo' and: 'foo' maxDistance: 1) equals: 1
]
]

{ #category : 'testing' }
CoFuzzyMatcherTest >> testDamerauLevenshteinWithSignleAdjacentTranspositionWithHighDistance [ [
	self assert: (CoFuzzyMatcher damerauLevenshteinDistanceBetween: 'ofo' and: 'foo' maxDistance: 10) equals: 1
]
]

{ #category : 'testing' }
CoFuzzyMatcherTest >> testDamerauLevenshteinWithSignleAdjacentTranspositionWithLowDistanceReturnsNil [ [
	self assert: (CoFuzzyMatcher damerauLevenshteinDistanceBetween: 'ofo' and: 'foo' maxDistance: 0) equals: nil
]
]

{ #category : 'testing' }
CoFuzzyMatcherTest >> testDamerauLevenshteinWithSignleDeletion [ [
	self assert: (CoFuzzyMatcher damerauLevenshteinDistanceBetween: 'foo' and: 'fo' maxDistance: 1) equals: 1
]
]

{ #category : 'testing' }
CoFuzzyMatcherTest >> testDamerauLevenshteinWithSignleDeletionWithHighDistance [ [
	self assert: (CoFuzzyMatcher damerauLevenshteinDistanceBetween: 'foo' and: 'fo' maxDistance: 5) equals: 1
]
]

{ #category : 'testing' }
CoFuzzyMatcherTest >> testDamerauLevenshteinWithSignleDeletionWithLowDistanceReurnsNil [ [
	self assert: (CoFuzzyMatcher damerauLevenshteinDistanceBetween: 'foo' and: 'f' maxDistance: 1) equals: nil
]
]

{ #category : 'testing' }
CoFuzzyMatcherTest >> testDamerauLevenshteinWithSignleInsertion [ [
	self assert: (CoFuzzyMatcher damerauLevenshteinDistanceBetween: 'fo' and: 'foo' maxDistance: 1) equals: 1
]
]

{ #category : 'testing' }
CoFuzzyMatcherTest >> testDamerauLevenshteinWithSignleInsertionWithLHighDistance [ [
	self assert: (CoFuzzyMatcher damerauLevenshteinDistanceBetween: 'fo' and: 'foo' maxDistance: 10) equals: 1
]
]

{ #category : 'testing' }
CoFuzzyMatcherTest >> testDamerauLevenshteinWithSignleInsertionWithLowDistanceReurnsNil [ [
	self assert: (CoFuzzyMatcher damerauLevenshteinDistanceBetween: 'f' and: 'foo' maxDistance: 1) equals: nil
]
]

{ #category : 'testing' }
CoFuzzyMatcherTest >> testDamerauLevenshteinWithSignleNonAdjacentTranspositionDifferenceThanOne [ [
	self deny: (CoFuzzyMatcher damerauLevenshteinDistanceBetween: 'bar' and: 'rab' maxDistance: 10) equals: 1
]
]

{ #category : 'testing' }
CoFuzzyMatcherTest >> testDamerauLevenshteinWithSignleSubstitution [ [
	self assert: (CoFuzzyMatcher damerauLevenshteinDistanceBetween: 'bar' and: 'baz' maxDistance: 1) equals: 1
]
]

{ #category : 'testing' }
CoFuzzyMatcherTest >> testDamerauLevenshteinWithSignleSubstitutionWithHighDistance [ [
	self assert: (CoFuzzyMatcher damerauLevenshteinDistanceBetween: 'bar' and: 'baz' maxDistance: 10) equals: 1
]
]

{ #category : 'testing' }
CoFuzzyMatcherTest >> testDamerauLevenshteinWithSignleSubstitutionWithLowDistanceReutnsNil [ [
	self assert: (CoFuzzyMatcher damerauLevenshteinDistanceBetween: 'bar' and: 'baz' maxDistance: 0) equals: nil
]
]

{ #category : 'testing' }
CoFuzzyMatcherTest >> testScoreForCandidatesWWhenTransposition [ [
	"distance = 1/5, max edits = 0.4 * 5 = 2, with one transposition "
	self assert: (CoFuzzyMatcher scoreForCandidate: 'hlelo' token:'hello'  caseSensitive: false tolerance: 0.2) equals: 0.2
]
]

{ #category : 'testing' }
CoFuzzyMatcherTest >> testScoreForCandidatesWhenExactMatch [ [ 
	self assert: (CoFuzzyMatcher scoreForCandidate: 'foo' token:'foo'  caseSensitive: false tolerance: 0.3) equals: 0
]
]

{ #category : 'testing' }
CoFuzzyMatcherTest >> testScoreForCandidatesWhenExactMatchWhenCaseSensitive [ [
	self assert: (CoFuzzyMatcher scoreForCandidate: 'FoO' token:'FoO'  caseSensitive: true tolerance: 0.3) equals: 0
]
]

{ #category : 'testing' }
CoFuzzyMatcherTest >> testScoreForCandidatesWhenOneInsertion [ [
	self assert: (CoFuzzyMatcher scoreForCandidate: 'helo' token:'hello'  caseSensitive: false tolerance: 0.4) equals: 0.2
]
]

{ #category : 'testing' }
CoFuzzyMatcherTest >> testScoreForCandidatesWhenOneSubstitution [ [
	self assert: (CoFuzzyMatcher scoreForCandidate: 'hello' token:'hallo'  caseSensitive: false tolerance: 0.4) equals: 0.2
]
]

{ #category : 'testing' }
CoFuzzyMatcherTest >> testScoreForCandidatesWhenOneSubstitutionWithLowToleranceReturnNil [ [
	
	self assert: (CoFuzzyMatcher scoreForCandidate: 'hello' token:'hallo'  caseSensitive: false tolerance: 0) equals: nil
]
]

{ #category : 'testing' }
CoFuzzyMatcherTest >> testScoreForCandidatesWhenTranspositionWithCaseSensitivity [ [
	"distance = 1/5, max edits = 0.4 * 5 = 2, with one transposition "
	self assert: (CoFuzzyMatcher scoreForCandidate: 'hLelo' token:'hello'  caseSensitive: true tolerance: 0.4) equals: 0.4
]
]

{ #category : 'testing' }
CoFuzzyMatcherTest >> testScoreForCandidatesWhenTranspositionWithFirstCaracterDoesNotMustShouldReturnNil [ [
	"distance = 1/5, max edits = 0.4 * 5 = 2, with one transposition "
	self assert: (CoFuzzyMatcher scoreForCandidate: 'Hello' token:'hello'  caseSensitive: true tolerance: 0.4) equals: nil
]
]

{ #category : 'testing' }
CoFuzzyMatcherTest >> testShouldTryFuzzyForWhenEmptyCandidate [ [
	self assert: (CoFuzzyMatcher shouldTryFuzzyFor: 'foo' candidate: '' tolerance: 0.4) equals: false
]
]

{ #category : 'testing' }
CoFuzzyMatcherTest >> testShouldTryFuzzyForWhenEmptyToken [ [
	self assert: (CoFuzzyMatcher shouldTryFuzzyFor: '' candidate: 'foo' tolerance: 0.4) equals: false
]
]

{ #category : 'testing' }
CoFuzzyMatcherTest >> testShouldTryFuzzyForWhenFirstCaracterMismatch [ [
	self assert: (CoFuzzyMatcher shouldTryFuzzyFor: 'At:put:ifAbsent:' candidate: 'at:put:IfAbsent:' tolerance: 0.4) equals: false
]
]

{ #category : 'testing' }
CoFuzzyMatcherTest >> testShouldTryFuzzyForWhenKeywordStructureIsDifferent [ [
	
	self assert: (CoFuzzyMatcher shouldTryFuzzyFor: 'at:put:ifAbsent:' candidate: 'at:putIfAbsent:' tolerance: 0.4) equals: false
]
]

{ #category : 'testing' }
CoFuzzyMatcherTest >> testShouldTryFuzzyForWhenKeywordStructureIsSimilar [ [

	self assert: (CoFuzzyMatcher shouldTryFuzzyFor: 'at:put:ifAbsent:' candidate: 'at:put:IfAbsent:' tolerance: 0.4) equals: true
]
]

{ #category : 'testing' }
CoFuzzyMatcherTest >> testShouldTryFuzzyForWhenLengthExceedsToleranceBound [ [
	"maxEdits = 0.4 * 32 ≈ 13.
	Length difference = 32 - 5 = 27.
	Since 27 > maxEdits, fuzzy matching should be rejected."
	self assert: (CoFuzzyMatcher shouldTryFuzzyFor: 'CoAST' candidate: 'CoASTHeuristicsResultSetBuilder' tolerance: 0.4) equals: false
]
]

{ #category : 'testing' }
CoFuzzyMatcherTest >> testShouldTryFuzzyForWhenTokenTooShort [ [
	"The minimum token size should be less than 2"
	self assert: (CoFuzzyMatcher shouldTryFuzzyFor: 'f' candidate: 'foo' tolerance: 0.4) equals: false
]
]
