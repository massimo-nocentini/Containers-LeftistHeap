Extension { #name : #Collection }

{ #category : #'*Containers-LeftistHeap' }
Collection >> asLeftistHeap [
	^ self asBinaryTree: CTLeftistHeap
]
