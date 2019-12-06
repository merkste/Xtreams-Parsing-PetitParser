'From VisualWorks® Personal Use Edition, 8.3 of 28. Juli 2017 on 6. Dezember 2019 at 10:56:16'!


CodeComponent create: #package named: 'Xtreams-Parsing-PetitParser'!"Package Xtreams-Parsing-PetitParser(1.3,stm)="!


Actor subclass: #PetitParserGenerator
	instanceVariableNames: 'definitions references parserClass start '
	classVariableNames: ''
	poolDictionaries: ''
	category: ''!

PetitParserGenerator class
	instanceVariableNames: ''!

PetitParserGenerator comment:
'I am a compiler from Xtreams'' PEG syntax to PetitParser parser classes.

I parse a PEG and add corresponding methods and variables to a given parser class.
Usually, the parser class is a subclass of PPCompositeParser.
My formal syntax definition can be found in PEG.Parser class>>grammarPEG.

To configure me with a class and start production rule use:
	class>>parser: aClass
	class>>parser: aClass start: aProductionName

To parse a PEG and generate code use:
	aClass := PEG.Parser parserPEG
				parse: ''Grammar''
				stream: aGrammerString
				actor: aPetitParserGenerator.

Instance Variables:
	definitions		<Dictionary>		production rules of the PEG
	parserClass	<Class>			compilation target class
	references		<(Set of: (String))> names of referenced productions
	start			<String>			name of the start production
'!

Actor subclass: #PetitParserParser
	instanceVariableNames: 'definitions '
	classVariableNames: ''
	poolDictionaries: 'PetitParser '
	category: ''!

PetitParserParser class
	instanceVariableNames: ''!

PetitParserParser comment:
'I am a parser from Xtreams'' PEG syntax to PetitParser parser combinators.

I parse a PEG and build a dictionary of productions and corresponding parsers.
My formal syntax definition can be found in PEG.Parser class>>grammarPEG.

To build an XML parser do:
	parser := PEG.Parser parserPEG
				parse: ''Grammar''
				stream: PEG.Parser grammarXML
				actor: PetitParserParser new.

Instance Variables:
	definitions		<Dictionary>		production rules of the PEG
'!

Actor subclass: #PEGActor
	instanceVariableNames: 'parser references useCache '
	classVariableNames: ''
	poolDictionaries: ''
	category: ''!

PEGActor class
	instanceVariableNames: ''!

PEGActor comment:
'I am a parser from PEG ASCII syntax to an Xtreams parser.

I parse a PEG and build a dictionary of evaluation blocks that parses a given PEG grammar.
My formal syntax definition can be found in PEGActor class>>grammarPEG.

To build a PEG parser parser use:
	parserParser := PEG.Parser parserPEG
				parse: ''Grammar''
				stream: PEGActor grammarPEG
				actor: ParserParser new.

To actually parse a PEG and build an Xtreams parser use:
	parserPEG := parserParser
				parse: ''Grammar''
				stream: aGrammerString
				actor: PEGActor new.

To bootstrap the parser parser use:
	parserParser := parserParser
				parse: ''Grammar''
				stream: PEGActor grammarPEG
				actor: PEGActor new.

Instance Variables:
	parser	<Parser>		description of parser
	references	<Dictionary>	description of references
	useCache	<Boolean>	description of useCache
'!

!PetitParserParser methodsFor: 'error handling' stamp: ' 6/12/19 10:56'!

DefinitionError: rest
	
	<action: 'DefinitonError'>
	!

NodeError: rest
	
	<action: 'NodeError'>
	!

SequenceError: rest
	
	<action: 'DefinitonError'>
	!

EscapeError: rest
	
	<action: 'EscapeError'>
	! !

!PetitParserParser methodsFor: 'modifiers' stamp: ' 6/12/19 10:56'!

NOT
	
	<action: 'NOT' arguments: #()>
	^#not!

AND
	
	<action: 'AND' arguments: #()>
	^#and! !

!PetitParserParser methodsFor: 'cardinality' stamp: ' 6/12/19 10:56'!

CardinalityRangeMin: min
	
	<action: 'CardinalityRangeMin'>
	^[:parser | parser min: min]!

CardinalityRange: min max: max
	
	<action: 'CardinalityRange' arguments: #(1 5)>
	^[:parser | parser min: min max: max]!

CardinalityLoopMin: min test: test
	
	<action: 'CardinalityLoopMin' arguments: #(1 5)>
	^[:parser | (test not , parser times: min) , (parser starGreedy: test) , test]!

STAR
	
	<action: 'STAR' arguments: #()>
	^#star!

CardinalityLoop: test
	
	<action: 'CardinalityLoop'>
	^[:parser | (parser starGreedy: test) , test]!

QUESTION
	
	<action: 'QUESTION' arguments: #()>
	^#optional!

PLUS
	
	<action: 'PLUS' arguments: #()>
	^#plus!

Cardinality: cardinality
	
	<action: 'Cardinality' arguments: #(3)>
	^cardinality! !

!PetitParserParser methodsFor: 'lexical' stamp: ' 6/12/19 10:56'!

Escape: backslash character: character hexes: hexes
	
	<action: 'Escape' arguments: #(1 2 3)>
	backslash = '\'
		ifTrue:
			[character = $s ifTrue: [^Character space].
			character = $t ifTrue: [^Character tab].
			character = $n ifTrue: [^Character cr].
			character = $r ifTrue: [^Character lf].
			character = $x
				ifTrue: [^('16r' , (String withAll: hexes)) asNumber asCharacter]].
	^character!

NumLiteral: args
	
	<action: 'NumLiteral'>
	| digit digits number |
	args = 'Infinity' ifTrue: [^Infinity positive].
	args = '0' ifTrue: [^0].
	digit := args first.
	digits := args second.
	number := String new writing.
	number put: digit.
	digits isEmpty ifFalse: [number write: digits].
	^number contents asNumber!

Identifier: first rest: rest
	
	<action: 'Identifier' arguments: #(1 2)>
	| stream |
	stream := (String new: rest size + 1) writing.
	stream put: first.
	rest notEmpty ifTrue: [stream write: rest].
	^stream contents! !

!PetitParserParser methodsFor: 'terminals' stamp: ' 6/12/19 10:56'!

DOT
	
	<action: 'DOT' arguments: #()>
	^#any asParser!

Literal: characters
	
	<action: 'Literal' arguments: #(2)>
	^(String withAll: characters) asParser!

Reference: identifier
	
	<action: 'Reference' arguments: #(1)>
	^definitions
		at: identifier
		ifAbsentPut: [PPUnresolvedParser new]!

RangeSet: from to: to
	
	<action: 'RangeSet' arguments: #(2 4)>
	^to
		ifNil: [[:char | char = from]]
		ifNotNil: [[:char | char between: from and: to]]!

Range: excluding sets: sets
	
	<action: 'Range' arguments: #(3 4)>
	| predicate |
	predicate := sets isEmpty
		ifTrue:
			[excluding
				ifNil: [[:char | false]]
				ifNotNil: [[:char | true]]]
		ifFalse:
			[| pred |
			pred := [:char | sets anySatisfy: [:range | range value: char]].
			excluding
				ifNil: [pred]
				ifNotNil: [[:char | (pred value: char) not]]].
	^PPPredicateObjectParser on: predicate message: 'char set expected'! !

!PetitParserParser methodsFor: 'initialize-release' stamp: ' 6/12/19 10:56'!

initialize
	
	super initialize.
	definitions := Dictionary new! !

!PetitParserParser methodsFor: 'structural' stamp: ' 6/12/19 10:56'!

Group: parser
	
	<action: 'Group' arguments: #(3)>
	^parser!

Grammar: defs
	
	<action: 'Grammar' arguments: #(1)>
	^definitions!

Expression: first rest: rest
	
	<action: 'Expression' arguments: #(1 2)>
	^rest
		inject: first
		into: [:par :alt | par / alt last]!

Definition: identifier expression: parser
	
	<action: 'Definition' arguments: #(2 6)>
	(definitions includesKey: identifier)
		ifTrue:
			[| par |
			par := definitions at: identifier.
			par isUnresolved
				ifTrue: [par def: parser]
				ifFalse: [self error: 'Redefinition of: ' , identifier]]
		ifFalse: [definitions at: identifier put: parser].
	^identifier -> (definitions at: identifier)!

Sequence: parsers
	
	<action: 'Sequence'>
	^parsers fold: [:seq :par | seq , par]!

Node: primary modifier: modifier cardinality: cardinality
	
	<action: 'Node' arguments: #(2 1 3)>
	| parser |
	parser := primary.
	cardinality ifNotNil: [parser := cardinality value: parser].
	modifier ifNotNil: [parser := modifier value: parser].
	^parser! !


!PetitParserGenerator class methodsFor: 'instance creation' stamp: ' 6/12/19 10:56'!

parser: aClass
	
	^self new parser: aClass start: 'Grammar'!

parser: aClass start: productionName
	
	^self new parser: aClass start: productionName! !


!PetitParserGenerator methodsFor: 'accessing' stamp: ' 6/12/19 10:56'!

parser: aClass start: productionName
	
	parserClass := aClass.
	start := productionName! !

!PetitParserGenerator methodsFor: 'error handling' stamp: ' 6/12/19 10:56'!

SequenceError: rest
	
	<action: 'DefinitonError'>
	!

EscapeError: rest
	
	<action: 'EscapeError'>
	!

DefinitionError: rest
	
	<action: 'DefinitonError'>
	!

NodeError: rest
	
	<action: 'NodeError'>
	! !

!PetitParserGenerator methodsFor: 'private' stamp: ' 6/12/19 10:56'!

parenthesize: parser
	
	^'(' , parser , ')'! !

!PetitParserGenerator methodsFor: 'modifiers' stamp: ' 6/12/19 10:56'!

NOT
	
	<action: 'NOT' arguments: #()>
	^[:par | par , ' not']!

AND
	
	<action: 'AND' arguments: #()>
	^[:par | par , ' and']! !

!PetitParserGenerator methodsFor: 'cardinality' stamp: ' 6/12/19 10:56'!

CardinalityLoopMin: min test: test
	
	<action: 'CardinalityLoopMin' arguments: #(1 5)>
	^[:parser | 
	| repeat star |
	repeat := self
		parenthesize:
			test , ' not ' , ' , ' , parser , ' times: ' , min storeString.
	star := self parenthesize: parser , ' starGreedy: ' , test.
	self parenthesize: repeat , ' , ' , star]!

STAR
	
	<action: 'STAR' arguments: #()>
	^[:parser | parser , ' star']!

CardinalityLoop: test
	
	<action: 'CardinalityLoop'>
	^[:parser | (self parenthesize: parser , ' starGreedy: ' , test) , ' , ' , test]!

QUESTION
	
	<action: 'QUESTION' arguments: #()>
	^[:par | par , ' optional']!

Cardinality: cardinality
	
	<action: 'Cardinality' arguments: #(3)>
	^cardinality!

PLUS
	
	<action: 'PLUS' arguments: #()>
	^[:par | par , ' plus']!

CardinalityRangeMin: min
	
	<action: 'CardinalityRangeMin'>
	^[:parser | self parenthesize: parser , ' times: ' , min storeString]!

CardinalityRange: min max: max
	
	<action: 'CardinalityRange' arguments: #(1 5)>
	^[:parser | 
	self
		parenthesize:
			parser , ' min: ' , min storeString , ' max: ' , max storeString]! !

!PetitParserGenerator methodsFor: 'lexical' stamp: ' 6/12/19 10:56'!

NumLiteral: args
	
	<action: 'NumLiteral'>
	| digit digits number |
	args = 'Infinity' ifTrue: [^Infinity positive].
	args = '0' ifTrue: [^0].
	digit := args first.
	digits := args second.
	number := String new writing.
	number put: digit.
	digits isEmpty ifFalse: [number write: digits].
	^number contents asNumber!

Identifier: first rest: rest
	
	<action: 'Identifier' arguments: #(1 2)>
	| stream |
	stream := (String new: rest size + 1) writing.
	stream put: first.
	rest notEmpty ifTrue: [stream write: rest].
	^stream contents!

Escape: backslash character: character hexes: hexes
	
	<action: 'Escape' arguments: #(1 2 3)>
	backslash = '\'
		ifTrue:
			[character = $s ifTrue: [^Character space].
			character = $t ifTrue: [^Character tab].
			character = $n ifTrue: [^Character cr].
			character = $r ifTrue: [^Character lf].
			character = $x
				ifTrue: [^('16r' , (String withAll: hexes)) asNumber asCharacter]].
	^character! !

!PetitParserGenerator methodsFor: 'terminals' stamp: ' 6/12/19 10:56'!

Reference: identifier
	
	<action: 'Reference' arguments: #(1)>
	^references add: identifier!

RangeSet: min to: max
	
	<action: 'RangeSet' arguments: #(2 4)>
	| from |
	from := min storeString.
	^max
		ifNil: ['char = ' , from]
		ifNotNil:
			[| to |
			to := max storeString.
			self parenthesize: 'char between: ' , from , ' and: ' , to]!

Range: excluding sets: sets
	
	<action: 'Range' arguments: #(3 4)>
	| predicate |
	predicate := sets isEmpty
		ifTrue:
			[excluding
				ifNil: ['false']
				ifNotNil: ['true']]
		ifFalse:
			[| pred |
			pred := (sets fold: [:test :range | test , ' or: [' , range])
				,
					(String
						new: sets size - 1
						withAll: $]).
			excluding
				ifNil: [pred]
				ifNotNil: [(self parenthesize: pred) , ' not']].
	^'(PPPredicateObjectParser on: [:char | ' , predicate ,
			'] message: ''char set expected'')'!

DOT
	
	<action: 'DOT' arguments: #()>
	^'#any asParser'!

Literal: characters
	
	<action: 'Literal' arguments: #(2)>
	| literal |
	literal := String withAll: characters.
	^literal storeString , ' asParser'! !

!PetitParserGenerator methodsFor: 'initialize-release' stamp: ' 6/12/19 10:56'!

initialize
	
	super initialize.
	references := Set new.
	definitions := Dictionary new! !

!PetitParserGenerator methodsFor: 'structural' stamp: ' 6/12/19 10:56'!

Expression: first rest: rest
	
	<action: 'Expression' arguments: #(1 2)>
	^rest isEmpty
		ifTrue: [first]
		ifFalse:
			[self
				parenthesize:
					(rest
						inject: first
						into: [:par :alt | par , ' / ' , alt last])]!

Sequence: parsers
	
	<action: 'Sequence'>
	^parsers size = 1
		ifTrue: [parsers first]
		ifFalse:
			[self parenthesize: (parsers fold: [:seq :par | seq , ' , ' , par])]!

Definition: identifier expression: parser
	
	<action: 'Definition' arguments: #(2 6)>
	| method |
	definitions
		at: identifier
		ifPresent: [self error: 'Redefinition of: ' , identifier].
	method := (String new writeStream)
		nextPutAll: identifier;
		cr;
		cr;
		tab;
		nextPut: $^;
		space;
		nextPutAll: parser;
		contents.
	definitions at: identifier put: method.
	^identifier -> parser!

Node: primary modifier: modifier cardinality: cardinality
	
	<action: 'Node' arguments: #(2 1 3)>
	| parser |
	parser := primary.
	cardinality ifNotNil: [parser := cardinality value: parser].
	modifier ifNotNil: [parser := modifier value: parser].
	^parser!

Group: parser
	
	<action: 'Group' arguments: #(3)>
	^parser!

Grammar: defs
	
	<action: 'Grammar' arguments: #(1)>
	| methodStart |
	references
		do:
			[:ref | 
			(definitions keys includes: ref)
				ifFalse: [self error: 'Missing definition of ' , ref]].
	definitions keysDo: [:variable | parserClass addInstVarName: variable].
	definitions values do: [:method | parserClass compile: method].
	methodStart := (String new writeStream)
		nextPutAll: 'start';
		cr;
		cr;
		tab;
		nextPut: $^;
		nextPutAll: start;
		contents.
	parserClass compile: methodStart classified: 'accessing'.
	^parserClass! !


!PEGActor class methodsFor: 'instance creation' stamp: ' 6/12/19 10:56'!

grammarPEG
	"PEG formally describing its own ASCII syntax [1].
	Definitions of Primary, and Char adapted to parsing needs.

	[1] Bryan Ford.
	'Parsing Expression Grammars: A Recognition-based Syntactic Foundation'.
	POPL'04.
	http://doi.acm.org/10.1145/964001.964011 ."
	
	^'
# Hierarchical syntax
Grammar	<- Spacing Definition+ EndOfFile
Definition	<- Identifier LEFTARROW Expression
Expression	<- Sequence (SLASH Sequence)*
Sequence	<- Prefix*
Prefix		<- (AND / NOT)? Suffix
Suffix		<- Primary (QUESTION / STAR / PLUS)?
Primary		<- Reference
			  / Parenthesised
			  / Literal / Class / DOT
Reference	<- Identifier !!LEFTARROW
Parenthesised <- OPEN Expression CLOSE

# Lexical syntax
Identifier		<- IdentStart IdentCont* Spacing
IdentStart	<- [a-zA-Z_]
IdentCont	<- IdentStart / [0-9]

Literal		<- [''] (!![''] Char)* [''] Spacing
			  / ["] (!!["] Char)* ["] Spacing
Class		<- ''['' (!!'']'' Range)* '']'' Spacing
Range		<- Char (''-'' Char)?
Char		<- ''\\'' [nrt''"\[\]\\]
			  / ''\\'' [0-2][0-7][0-7]
			  / ''\\'' [0-7][0-7]?
			  / !!''\\'' .

LEFTARROW	<- ''<-'' Spacing
SLASH		<- ''/'' Spacing
AND		<- ''&'' Spacing
NOT		<- ''!!'' Spacing
QUESTION	<- ''?'' Spacing
STAR		<- ''*'' Spacing
PLUS		<- ''+'' Spacing
OPEN		<- ''('' Spacing
CLOSE		<- '')'' Spacing
DOT		<- ''.'' Spacing

Spacing		<- (Space / Comment)*
Comment	<- ''#'' (!!EndOfLine .)* EndOfLine
Space		<- '' '' / ''\t'' / EndOfLine
EndOfLine	<- ''\r\n'' / ''\n'' / ''\r''
EndOfFile	<- !!.'! !


!PEGActor methodsFor: 'initialize-release' stamp: ' 6/12/19 10:56'!

useCache
	
	useCache := true!

initialize
	
	super initialize.
	useCache := false.
	parser := Parser new.
	references := Dictionary new!

dontUseCache
	
	useCache := false! !

!PEGActor methodsFor: 'lexical symbols' stamp: ' 6/12/19 10:56'!

PLUS
	
	<action: 'PLUS' arguments: #()>
	^[:expression | 
	[parser
		repeat: expression
		min: 1
		optional: Infinity positive]]!

NOT
	
	<action: 'NOT' arguments: #()>
	^[:expression | [parser not: expression]]!

AND
	
	<action: 'AND' arguments: #()>
	^[:expression | [parser explore: expression]]!

STAR
	
	<action: 'STAR' arguments: #()>
	^[:expression | 
	[parser
		repeat: expression
		min: 0
		optional: Infinity positive]]!

DOT
	
	<action: 'DOT' arguments: #()>
	^[parser anything]!

QUESTION
	
	<action: 'QUESTION' arguments: #()>
	^[:expression | [parser optional: expression]]! !

!PEGActor methodsFor: 'private' stamp: ' 6/12/19 10:56'!

escape: characters
	
	| character |
	character := characters second.	"whitespace"
	character = $n ifTrue: [^Character cr].
	character = $r ifTrue: [^Character lf].
	character = $t ifTrue: [^Character tab].	"octal code"
	character isDigit
		ifTrue:
			[| code |
			code := characters reject: [:c | c isNil or: [c isCollection]].
			('8r' , (String withAll: code)) asNumber asCharacter].	"literal character"
	^character! !

!PEGActor methodsFor: 'lexical' stamp: ' 6/12/19 10:56'!

Range: args
	
	<action: 'Range'>
	| from to |
	from := args first.
	to := args second
		ifNil: [from]
		ifNotNil: [:s | s second].
	^Interval
		from: from asInteger
		to: to asInteger!

Class: args
	
	<action: 'Class'>
	| sets |
	sets := args second collect: #second.
	^sets isEmpty
		ifTrue: [[parser not: self DOT]]
		ifFalse: [[parser including: sets]]!

Identifier: args
	
	<action: 'Identifier'>
	| first rest stream |
	first := args first.
	rest := args second.
	stream := (String new: rest size + 1) writing.
	stream put: first.
	rest notEmpty ifTrue: [stream write: rest].
	^stream contents!

Literal: args
	
	<action: 'Literal'>
	| characters literal stream |
	characters := args second.
	stream := (String new: characters size) writing.
	characters do: [:each | stream put: each second].
	literal := stream contents.
	parser bufferSize: literal size.
	^[parser literal: literal]!

Char: args
	
	<action: 'Char'>
	| character |
	character := args second.
	args first = '\' ifTrue: [self escape: args].
	^character! !

!PEGActor methodsFor: 'hierarchical' stamp: ' 6/12/19 10:56'!

Suffix: args
	
	<action: 'Suffix'>
	| primary cardinality |
	primary := args first.
	cardinality := args second.
	^cardinality
		ifNil: [primary]
		ifNotNil: [cardinality value: primary]!

Prefix: args
	
	<action: 'Prefix'>
	| modifier suffix |
	modifier := args first.
	suffix := args second.
	^modifier
		ifNil: [suffix]
		ifNotNil: [modifier value: suffix]!

Expression: args
	
	<action: 'Expression'>
	| first rest sequences |
	first := args first.
	rest := args second.
	rest isEmpty ifTrue: [^first].
	sequences := (Array with: first) , (rest collect: [:each | each last]).
	^[parser any: sequences]!

Parenthesised: args
	
	<action: 'Parenthesised'>
	^args second!

Reference: args
	
	<action: 'Reference'>
	^references
		at: args first
		ifAbsentPut: [Object new]!

Grammar: args
	
	<action: 'Grammar'>
	| definitions defines |
	definitions := args second.
	defines := Dictionary new.
	defines addAll: definitions.
	references
		keysAndValuesDo: [:name :dummy | dummy become: (defines at: name)].
	parser grammar addAll: references.
	defines
		keysAndValuesDo:
			[:name :definition | 
			definition class == Object
				ifFalse: [parser grammar at: name put: definition]].
	^parser!

Definition: args
	
	<action: 'Definition'>
	| identifier expression cache |
	identifier := args first.
	expression := args third.
	useCache
		ifFalse:
			[^identifier -> [parser definition: expression name: identifier]].
	parser caches add: (cache := Dictionary new).
	^identifier
		-> [parser definition: expression name: identifier cache: cache]!

Sequence: nodes
	
	<action: 'Sequence'>
	nodes size = 1 ifTrue: [^nodes first].
	^[parser all: nodes]! !

