Class {
	#name : 'BaselineOfTypoTolerance',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfTypoTolerance',
	#package : 'BaselineOfTypoTolerance'
}

{ #category : 'baselines' }
BaselineOfTypoTolerance >> baseline: spec [
	spec for: #common do: [
		spec postLoadDoIt: ##postload:package:..
			spec
				package: #'Typo-Tolerance';
				package: #'Typo-Tolerance-Tests' with: [ spec requires: #( 'Typo-Tolerance' ) ] ]
]

{ #category : 'baselines' }
BaselineOfTypoTolerance >> postload: loader package: packageSpec [

	Smalltalk globals
		at: #CoCompletionTolerance
		ifPresent: [ :completionTolerance | completionTolerance reset ]
]
