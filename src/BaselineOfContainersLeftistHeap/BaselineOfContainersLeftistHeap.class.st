"
I am the baseline of `Containers-LeftistHeap`: I load the packages `Containers-LeftistHeap`, `Containers-LeftistHeap-Visualizations` and `Containers-LeftistHeap-Tests`, and the projects `Containers-Essentials` and `Containers-BinaryTreeAbstract` that they require.

```smalltalk
[ Metacello new
	baseline: 'ContainersLeftistHeap';
	githubUser: 'massimo-nocentini'
		project: 'Containers-LeftistHeap'
		commitish: 'master'
		path: 'src';
	load ]
		on: MCMergeOrLoadWarning
		do: [ :warning | warning load ]
```
"
Class {
	#name : #BaselineOfContainersLeftistHeap,
	#superclass : #BaselineOf,
	#category : #BaselineOfContainersLeftistHeap
}

{ #category : #baselines }
BaselineOfContainersLeftistHeap >> baseline: spec [

	<baseline>
	spec for: #common do: [ "Externals."
		spec
			baseline: 'ContainersEssentials'
			with: [ spec repository: 'github://massimo-nocentini/Containers-Essentials:master' ].

		spec
			baseline: 'ContainersBinaryTreeAbstract'
			with: [ spec repository: 'github://massimo-nocentini/Containers-BinaryTreeAbstract:master/src' ].

		"Packages"
		spec
			package: 'Containers-LeftistHeap'
			with: [ spec requires: #( 'ContainersEssentials' 'ContainersBinaryTreeAbstract' ) ];
			package: 'Containers-LeftistHeap-Visualizations'
			with: [ spec requires: #( 'Containers-LeftistHeap' ) ];
			package: 'Containers-LeftistHeap-Tests'
			with: [ spec requires: #( 'Containers-LeftistHeap' ) ] ]
]
