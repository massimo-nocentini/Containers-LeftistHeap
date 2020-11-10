Extension { #name : #CTLeftistHeap }

{ #category : #'*Containers-LeftistHeap-Visualizations' }
CTLeftistHeap >> gtInspectorTreeUsingCanvas: aCanvas [
	^ representation edges asLinkedList asTree
		  gtInspectorGraphViewIn: aCanvas
		  vertexBlock: [ :aVertex | 
			  | text content |
			  content := aVertex content.
			  text := String streamContents: [ :s | 
				          content value
					          ifNil: [ s nextPut: $• ]
					          ifNotNil: [ :v | v printOn: s ].
				          s
					          nextPut: $₍;
					          nextPutAll: content rank asString subscript;
					          nextPut: $₎ ].
			  RSLabel new
				  text: text;
				  color: Color black;
				  yourself ]
]

{ #category : #'*Containers-LeftistHeap-Visualizations' }
CTLeftistHeap >> gtInspectorTreesViewIn: composite [
	<gtInspectorPresentationOrder: 20>
	^ composite roassal3
		  title: 'Tree';
		  initializeCanvas: [ self gtInspectorTreeUsingCanvas: RSCanvas new ];
		  yourself
]
