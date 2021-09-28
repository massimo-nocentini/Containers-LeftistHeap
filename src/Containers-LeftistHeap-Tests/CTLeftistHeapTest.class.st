"
A CTLeftistHeapTest is a test class for testing the behavior of CTLeftistHeap
"
Class {
	#name : #CTLeftistHeapTest,
	#superclass : #CTBinaryTreeAbstractTest,
	#category : #'Containers-LeftistHeap-Tests'
}

{ #category : #tests }
CTLeftistHeapTest >> tree: aCollection [

	^ aCollection asLeftistHeap
]
