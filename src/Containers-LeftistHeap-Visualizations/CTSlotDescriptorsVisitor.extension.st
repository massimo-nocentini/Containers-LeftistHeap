Extension { #name : #CTSlotDescriptorsVisitor }

{ #category : #'*Containers-LeftistHeap-Visualizations' }
CTSlotDescriptorsVisitor >> visitCTBinaryTreeElementLeftistHeap: aTreeElement [

	| descriptors |
	descriptors := (self visitCTDoubleValueLink: aTreeElement)
		               asOrderedCollection.

	descriptors
		add: (self newSlotDescriptorSelector: #rank)
		afterIndex: 1.

	^ descriptors
]
