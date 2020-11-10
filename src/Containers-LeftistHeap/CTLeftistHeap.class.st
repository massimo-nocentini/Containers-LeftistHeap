Class {
	#name : #CTLeftistHeap,
	#superclass : #Object,
	#instVars : [
		'representation'
	],
	#category : #'Containers-LeftistHeap'
}

{ #category : #creating }
CTLeftistHeap class >> empty [
	^ self basicNew
		  representation: CTBinaryTreeEmptyLeftistHeap new;
		  initialize;
		  yourself
]

{ #category : #removing }
CTLeftistHeap >> pop [
	^ representation root ignoreBlock: [ 
		  representation := representation pop ]
]

{ #category : #adding }
CTLeftistHeap >> push: anObject [
	representation := representation mergeBinaryTree:
		                  (CTBinaryTreeNodeLeftistHeap leaf: anObject)
]

{ #category : #accessing }
CTLeftistHeap >> representation [
	^ representation
]

{ #category : #accessing }
CTLeftistHeap >> representation: anObject [
	representation := anObject
]
