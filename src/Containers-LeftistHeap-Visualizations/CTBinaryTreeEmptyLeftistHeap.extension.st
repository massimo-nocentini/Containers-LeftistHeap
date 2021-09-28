Extension { #name : #CTBinaryTreeEmptyLeftistHeap }

{ #category : #'*Containers-LeftistHeap-Visualizations' }
CTBinaryTreeEmptyLeftistHeap >> acceptSlotDescriptorsVisitor: aVisitor [

	^ aVisitor visitCTBinaryTreeElementLeftistHeap: self
]
