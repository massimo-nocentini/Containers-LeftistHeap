"
A CTLeftistHeapTest is a test class for testing the behavior of CTLeftistHeap
"
Class {
	#name : #CTLeftistHeapTest,
	#superclass : #TestCase,
	#traits : 'TIceImagesExporting',
	#classTraits : 'TIceImagesExporting classTrait',
	#category : #'Containers-LeftistHeap-Tests'
}

{ #category : #utilities }
CTLeftistHeapTest >> exportLeftistHeap: anHeap filename: filename [
	^ self
		export: anHeap
		filename: filename
		selector: #gtInspectorTreeUsingCanvas:
]

{ #category : #utilities }
CTLeftistHeapTest >> exportLeftistHeap: anHeap path: aPath [
	^ self exportLeftistHeap: anHeap filename: aPath fullName
]

{ #category : #utilities }
CTLeftistHeapTest >> imagesPath [
	^ self iceWorkingDirectory / 'images' / 'leftist-heaps'
]

{ #category : #tests }
CTLeftistHeapTest >> testAsLeftistHeap [
	| interval random heap t1 t2 |
	random := Random seed: 11.
	interval := (1 to: 200000) collect: [ :i | random nextInt: i ].
	t1 := [ interval asOrderedCollection asLeftishHeap ] timeToRun.
	t2 := [ heap := interval asLeftishHeap ] timeToRun.
	self assert: t2 < t1.

	"If we like we can export it too."
	self exportLeftistHeap: heap path: self imagesPath / 'big'
]

{ #category : #tests }
CTLeftistHeapTest >> testEmpty [
	<gtExample>
	^ self
		  exportLeftistHeap: LeftistHeap empty
		  path: self imagesPath / 'empty'
]

{ #category : #tests }
CTLeftistHeapTest >> testReversed [
	<gtExample>
	^ (1 to: 40) reversed
		  inject: LeftistHeap empty
		  into: [ :anHeap :each | 
			  self
				  exportLeftistHeap: (anHeap add: each)
				  path: self imagesPath / 'reversed' ]
]

{ #category : #tests }
CTLeftistHeapTest >> testShuffled [
	<gtExample>
	^ (1 to: 40) shuffled
		  inject: LeftistHeap empty
		  into: [ :anHeap :each | 
			  self
				  exportLeftistHeap: (anHeap add: each)
				  path: self imagesPath / 'shuffled' ]
]

{ #category : #tests }
CTLeftistHeapTest >> testSorted [
	<gtExample>
	^ (1 to: 40) inject: LeftistHeap empty into: [ :anHeap :each | 
		  self
			  exportLeftistHeap: (anHeap add: each)
			  path: self imagesPath / 'sorted' ]
]

{ #category : #tests }
CTLeftistHeapTest >> testWikipedia [
	<gtExample>
	| elements finalHeap popping count |
	elements := #( 4 8 10 9 1 3 5 6 11 ).

	"First build the complete leftist heap."
	finalHeap := (elements withIndexCollect: #->)
		             inject: LeftistHeap empty
		             into: [ :anHeap :assoc | 
			             self
				             exportLeftistHeap: (anHeap add: assoc key)
				             path:
				             self imagesPath
				             / ('wikipedia-add-{1}' format: { assoc value }) ].

	"The go backward and empty it."
	popping := finalHeap.
	count := elements size.
	[ popping isEmpty ] whileFalse: [ 
		count := count - 1.
		popping := self
			           exportLeftistHeap: popping pop
			           path:
			           self imagesPath
			           / ('wikipedia-pop-{1}' format: { count }) ].

	"We draw also the heap obtained by bisect folding."
	self
		exportLeftistHeap: elements asLeftishHeap
		path: self imagesPath / 'wikipedia-bisect'.

	"Finally, return the full heap."
	^ finalHeap
]
