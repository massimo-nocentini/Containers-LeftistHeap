Extension { #name : #CTBinaryTreeNodeLeftistHeap }

{ #category : #'*Containers-LeftistHeap-Visualizations' }
CTBinaryTreeNodeLeftistHeap >> acceptSlotDescriptorsVisitor: aVisitor [

	^ aVisitor visitCTBinaryTreeElementLeftistHeap: self
]

{ #category : #'*Containers-LeftistHeap-Visualizations' }
CTBinaryTreeNodeLeftistHeap >> asShape [

	| valueShape indexShape |
	
	valueShape := super asShape.

	indexShape := RSLabel new
		              model: self rank;
		              text: '(' , self rank asString , ')';
		              fontSize: valueShape fontSize * Float silverRatio;
		              yourself.

	RSLocation new bottom right
		offset: indexShape textWidth + Float goldenRatio @ 0;
		move: indexShape on: valueShape.

	^ RSComposite new
		  model: self;
		  addShape: valueShape;
		  addShape: indexShape;
		  adjustToChildren;
		  draggable;
		  yourself
]
