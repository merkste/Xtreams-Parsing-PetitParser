<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® Personal Use Edition, 8.3 of 28. Juli 2017 on 6. Dezember 2019 at 10:56:28</time-stamp>


<component-created>
<name>Xtreams-Parsing-PetitParser</name> <type>package</type>
</component-created><!-- Package Xtreams-Parsing-PetitParser(1.3,stm)= -->


<component-property>
<name>Xtreams-Parsing-PetitParser</name> <type>package</type>
<property>prerequisiteParcels</property> <value>#(#('AT MetaNumerics' '') #('Base VisualWorks' '') #('PetitParser' '') #('Xtreams-Parsing' ''))</value>
</component-property>

<component-property>
<name>Xtreams-Parsing-PetitParser</name> <type>package</type>
<property>notice</property> <value>'MIT License

Copyright (c) 2019 Steffen Märcker

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
'</value>
</component-property>

<component-property>
<name>Xtreams-Parsing-PetitParser</name> <type>package</type>
<property>prerequisiteDescriptions</property> <value>#(#(#name 'AT MetaNumerics' #componentType #package) #(#name 'Base VisualWorks' #componentType #bundle) #(#name 'PetitParser' #componentType #package) #(#name 'Xtreams-Parsing' #componentType #package))</value>
</component-property>

<component-property>
<name>Xtreams-Parsing-PetitParser</name> <type>package</type>
<property>comment</property> <value>'This package provides a bridge from Xtreams-Parsing to PetitParser. Additionally, it includes support to generate an Xtreams parser from Bryan Ford''s original PEG ASCII syntax [1].

PEGActor
  Build an Xtreams parser from the PEG ASCII syntax.

PetitParserGenerator
  Compile a grammar in Xtreams'' PEG into a PetitParser class.

PetitParserParser
  Build a PetitParser of parser combinators from a grammar in Xtreams'' PEG.

[1] Bryan Ford.
	''Parsing Expression Grammars: A Recognition-based Syntactic Foundation''.
	POPL''04.
	http://doi.acm.org/10.1145/964001.964011 .
'</value>
</component-property>

<component-property>
<name>Xtreams-Parsing-PetitParser</name> <type>package</type>
<property>developmentPrerequisites</property> <value>#(#(#any 'AT MetaNumerics' '') #(#any 'Base VisualWorks' '') #(#any 'PetitParser' '') #(#any 'Xtreams-Parsing' ''))</value>
</component-property>

<class>
<name>PetitParserGenerator</name>
<environment>PEG</environment>
<super>PEG.Actor</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>definitions references parserClass start </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>Xtreams-Parsing-PetitParser</package>
</attributes>
</class>

<comment>
<class-id>PEG.PetitParserGenerator</class-id>
<body>I am a compiler from Xtreams' PEG syntax to PetitParser parser classes.I parse a PEG and add corresponding methods and variables to a given parser class.Usually, the parser class is a subclass of PPCompositeParser.My formal syntax definition can be found in PEG.Parser class&gt;&gt;grammarPEG.To configure me with a class and start production rule use:	class&gt;&gt;parser: aClass	class&gt;&gt;parser: aClass start: aProductionNameTo parse a PEG and generate code use:	aClass := PEG.Parser parserPEG				parse: 'Grammar'				stream: aGrammerString				actor: aPetitParserGenerator.Instance Variables:	definitions		&lt;Dictionary&gt;		production rules of the PEG	parserClass	&lt;Class&gt;			compilation target class	references		&lt;(Set of: (String))&gt; names of referenced productions	start			&lt;String&gt;			name of the start production</body>
</comment>

<class>
<name>PetitParserParser</name>
<environment>PEG</environment>
<super>PEG.Actor</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>definitions </inst-vars>
<class-inst-vars></class-inst-vars>
<imports>
			PetitParser.*
			</imports>
<category></category>
<attributes>
<package>Xtreams-Parsing-PetitParser</package>
</attributes>
</class>

<comment>
<class-id>PEG.PetitParserParser</class-id>
<body>I am a parser from Xtreams' PEG syntax to PetitParser parser combinators.I parse a PEG and build a dictionary of productions and corresponding parsers.My formal syntax definition can be found in PEG.Parser class&gt;&gt;grammarPEG.To build an XML parser do:	parser := PEG.Parser parserPEG				parse: 'Grammar'				stream: PEG.Parser grammarXML				actor: PetitParserParser new.Instance Variables:	definitions		&lt;Dictionary&gt;		production rules of the PEG</body>
</comment>

<class>
<name>PEGActor</name>
<environment>PEG</environment>
<super>PEG.Actor</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>parser references useCache </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>Xtreams-Parsing-PetitParser</package>
</attributes>
</class>

<comment>
<class-id>PEG.PEGActor</class-id>
<body>I am a parser from PEG ASCII syntax to an Xtreams parser.I parse a PEG and build a dictionary of evaluation blocks that parses a given PEG grammar.My formal syntax definition can be found in PEGActor class&gt;&gt;grammarPEG.To build a PEG parser parser use:	parserParser := PEG.Parser parserPEG				parse: 'Grammar'				stream: PEGActor grammarPEG				actor: ParserParser new.To actually parse a PEG and build an Xtreams parser use:	parserPEG := parserParser				parse: 'Grammar'				stream: aGrammerString				actor: PEGActor new.To bootstrap the parser parser use:	parserParser := parserParser				parse: 'Grammar'				stream: PEGActor grammarPEG				actor: PEGActor new.Instance Variables:	parser	&lt;Parser&gt;		description of parser	references	&lt;Dictionary&gt;	description of references	useCache	&lt;Boolean&gt;	description of useCache</body>
</comment>

<methods>
<class-id>PEG.PetitParserParser</class-id> <category>error handling</category>

<body package="Xtreams-Parsing-PetitParser">DefinitionError: rest	&lt;action: 'DefinitonError'&gt;</body>

<body package="Xtreams-Parsing-PetitParser">NodeError: rest	&lt;action: 'NodeError'&gt;</body>

<body package="Xtreams-Parsing-PetitParser">SequenceError: rest	&lt;action: 'DefinitonError'&gt;</body>

<body package="Xtreams-Parsing-PetitParser">EscapeError: rest	&lt;action: 'EscapeError'&gt;</body>
</methods>

<methods>
<class-id>PEG.PetitParserParser</class-id> <category>modifiers</category>

<body package="Xtreams-Parsing-PetitParser">NOT	&lt;action: 'NOT' arguments: #()&gt;	^#not</body>

<body package="Xtreams-Parsing-PetitParser">AND	&lt;action: 'AND' arguments: #()&gt;	^#and</body>
</methods>

<methods>
<class-id>PEG.PetitParserParser</class-id> <category>cardinality</category>

<body package="Xtreams-Parsing-PetitParser">CardinalityRangeMin: min	&lt;action: 'CardinalityRangeMin'&gt;	^[:parser | parser min: min]</body>

<body package="Xtreams-Parsing-PetitParser">CardinalityRange: min max: max	&lt;action: 'CardinalityRange' arguments: #(1 5)&gt;	^[:parser | parser min: min max: max]</body>

<body package="Xtreams-Parsing-PetitParser">CardinalityLoopMin: min test: test	&lt;action: 'CardinalityLoopMin' arguments: #(1 5)&gt;	^[:parser | (test not , parser times: min) , (parser starGreedy: test) , test]</body>

<body package="Xtreams-Parsing-PetitParser">STAR	&lt;action: 'STAR' arguments: #()&gt;	^#star</body>

<body package="Xtreams-Parsing-PetitParser">CardinalityLoop: test	&lt;action: 'CardinalityLoop'&gt;	^[:parser | (parser starGreedy: test) , test]</body>

<body package="Xtreams-Parsing-PetitParser">QUESTION	&lt;action: 'QUESTION' arguments: #()&gt;	^#optional</body>

<body package="Xtreams-Parsing-PetitParser">PLUS	&lt;action: 'PLUS' arguments: #()&gt;	^#plus</body>

<body package="Xtreams-Parsing-PetitParser">Cardinality: cardinality	&lt;action: 'Cardinality' arguments: #(3)&gt;	^cardinality</body>
</methods>

<methods>
<class-id>PEG.PetitParserParser</class-id> <category>lexical</category>

<body package="Xtreams-Parsing-PetitParser">Escape: backslash character: character hexes: hexes	&lt;action: 'Escape' arguments: #( 1 2 3 )&gt;	backslash = '\' ifTrue:		[character = $s ifTrue: [^Character space].		character = $t ifTrue: [^Character tab].		character = $n ifTrue: [^Character cr].		character = $r ifTrue: [^Character lf].		character = $x ifTrue: [^('16r', (String withAll: hexes)) asNumber asCharacter]].	^character</body>

<body package="Xtreams-Parsing-PetitParser">NumLiteral: args	&lt;action: 'NumLiteral'&gt;	| digit digits number |	args = 'Infinity' ifTrue: [^Infinity positive].	args = '0' ifTrue: [^0].	digit := args first.	digits := args second.	number := String new writing.	number put: digit.	digits isEmpty ifFalse: [number write: digits].	^number contents asNumber</body>

<body package="Xtreams-Parsing-PetitParser">Identifier: first rest: rest	&lt;action: 'Identifier' arguments: #(1 2)&gt;	| stream |	stream := (String new: rest size + 1) writing.	stream put: first.	rest notEmpty ifTrue: [stream write: rest].	^stream contents</body>
</methods>

<methods>
<class-id>PEG.PetitParserParser</class-id> <category>terminals</category>

<body package="Xtreams-Parsing-PetitParser">DOT	&lt;action: 'DOT' arguments: #()&gt;	^#any asParser</body>

<body package="Xtreams-Parsing-PetitParser">Literal: characters	&lt;action: 'Literal' arguments: #(2)&gt;	^(String withAll: characters) asParser</body>

<body package="Xtreams-Parsing-PetitParser">Reference: identifier	&lt;action: 'Reference' arguments: #(1)&gt;	^definitions at: identifier ifAbsentPut: [PPUnresolvedParser new]</body>

<body package="Xtreams-Parsing-PetitParser">RangeSet: from to: to	&lt;action: 'RangeSet' arguments: #(2 4)&gt;	^to		ifNil: [[:char | char = from]]		ifNotNil: [[:char | char between: from and: to]]</body>

<body package="Xtreams-Parsing-PetitParser">Range: excluding sets: sets	&lt;action: 'Range' arguments: #(3 4)&gt;	| predicate |	predicate := sets isEmpty				ifTrue: [excluding ifNil: [[:char | false]] ifNotNil: [[:char | true]]]				ifFalse: 					[| pred |					pred := [:char | sets anySatisfy: [:range | range value: char]].					excluding ifNil: [pred] ifNotNil: [[:char | (pred value: char) not]]].	^PPPredicateObjectParser on: predicate message: 'char set expected'</body>
</methods>

<methods>
<class-id>PEG.PetitParserParser</class-id> <category>initialize-release</category>

<body package="Xtreams-Parsing-PetitParser">initialize	super initialize.	definitions := Dictionary new</body>
</methods>

<methods>
<class-id>PEG.PetitParserParser</class-id> <category>structural</category>

<body package="Xtreams-Parsing-PetitParser">Group: parser	&lt;action: 'Group' arguments: #(3)&gt;	^parser</body>

<body package="Xtreams-Parsing-PetitParser">Grammar: defs	&lt;action: 'Grammar' arguments: #(1)&gt;	^definitions</body>

<body package="Xtreams-Parsing-PetitParser">Expression: first rest: rest	&lt;action: 'Expression' arguments: #(1 2)&gt;	^rest inject: first into: [:par :alt | par / alt last]</body>

<body package="Xtreams-Parsing-PetitParser">Definition: identifier expression: parser	&lt;action: 'Definition' arguments: #(2 6)&gt;	(definitions includesKey: identifier)		ifTrue: 			[| par |			par := definitions at: identifier.			par isUnresolved				ifTrue: [par def: parser]				ifFalse: [self error: 'Redefinition of: ' , identifier]]		ifFalse: [definitions at: identifier put: parser].	^identifier -&gt; (definitions at: identifier)</body>

<body package="Xtreams-Parsing-PetitParser">Sequence: parsers	&lt;action: 'Sequence'&gt;	^parsers fold: [:seq :par | seq , par]</body>

<body package="Xtreams-Parsing-PetitParser">Node: primary modifier: modifier cardinality: cardinality	&lt;action: 'Node' arguments: #(2 1 3)&gt;	| parser |	parser := primary.	cardinality ifNotNil: [parser := cardinality value: parser].	modifier ifNotNil: [parser := modifier value: parser].	^parser</body>
</methods>


<methods>
<class-id>PEG.PetitParserGenerator class</class-id> <category>instance creation</category>

<body package="Xtreams-Parsing-PetitParser">parser: aClass	^self new parser: aClass start: 'Grammar'</body>

<body package="Xtreams-Parsing-PetitParser">parser: aClass start: productionName	^self new parser: aClass start: productionName</body>
</methods>


<methods>
<class-id>PEG.PetitParserGenerator</class-id> <category>accessing</category>

<body package="Xtreams-Parsing-PetitParser">parser: aClass start: productionName	parserClass := aClass.	start := productionName.</body>
</methods>

<methods>
<class-id>PEG.PetitParserGenerator</class-id> <category>error handling</category>

<body package="Xtreams-Parsing-PetitParser">SequenceError: rest	&lt;action: 'DefinitonError'&gt;</body>

<body package="Xtreams-Parsing-PetitParser">EscapeError: rest	&lt;action: 'EscapeError'&gt;</body>

<body package="Xtreams-Parsing-PetitParser">DefinitionError: rest	&lt;action: 'DefinitonError'&gt;</body>

<body package="Xtreams-Parsing-PetitParser">NodeError: rest	&lt;action: 'NodeError'&gt;</body>
</methods>

<methods>
<class-id>PEG.PetitParserGenerator</class-id> <category>private</category>

<body package="Xtreams-Parsing-PetitParser">parenthesize: parser	^'(' , parser , ')'</body>
</methods>

<methods>
<class-id>PEG.PetitParserGenerator</class-id> <category>modifiers</category>

<body package="Xtreams-Parsing-PetitParser">NOT	&lt;action: 'NOT' arguments: #()&gt;	^[:par | par , ' not']</body>

<body package="Xtreams-Parsing-PetitParser">AND	&lt;action: 'AND' arguments: #()&gt;	^[:par | par , ' and']</body>
</methods>

<methods>
<class-id>PEG.PetitParserGenerator</class-id> <category>cardinality</category>

<body package="Xtreams-Parsing-PetitParser">CardinalityLoopMin: min test: test	&lt;action: 'CardinalityLoopMin' arguments: #(1 5)&gt;	^	[:parser |	| repeat star |	repeat := self parenthesize: test , ' not ' , ' , ' , parser , ' times: ' , min storeString.	star := self parenthesize: parser , ' starGreedy: ' , test.	self parenthesize: repeat , ' , ' , star]</body>

<body package="Xtreams-Parsing-PetitParser">STAR	&lt;action: 'STAR' arguments: #()&gt;	^[:parser | parser , ' star']</body>

<body package="Xtreams-Parsing-PetitParser">CardinalityLoop: test	&lt;action: 'CardinalityLoop'&gt;	^[:parser | (self parenthesize: (parser , ' starGreedy: ' , test)) , ' , ' , test]</body>

<body package="Xtreams-Parsing-PetitParser">QUESTION	&lt;action: 'QUESTION' arguments: #()&gt;	^[:par | par , ' optional']</body>

<body package="Xtreams-Parsing-PetitParser">Cardinality: cardinality	&lt;action: 'Cardinality' arguments: #(3)&gt;	^cardinality</body>

<body package="Xtreams-Parsing-PetitParser">PLUS	&lt;action: 'PLUS' arguments: #()&gt;	^[:par | par , ' plus']</body>

<body package="Xtreams-Parsing-PetitParser">CardinalityRangeMin: min	&lt;action: 'CardinalityRangeMin'&gt;	^[:parser | self parenthesize: (parser , ' times: ' , min storeString)]</body>

<body package="Xtreams-Parsing-PetitParser">CardinalityRange: min max: max	&lt;action: 'CardinalityRange' arguments: #(1 5)&gt;	^[:parser | self parenthesize: (parser , ' min: ' , min storeString , ' max: ' , max storeString)]</body>
</methods>

<methods>
<class-id>PEG.PetitParserGenerator</class-id> <category>lexical</category>

<body package="Xtreams-Parsing-PetitParser">NumLiteral: args	&lt;action: 'NumLiteral'&gt;	| digit digits number |	args = 'Infinity' ifTrue: [^Infinity positive].	args = '0' ifTrue: [^0].	digit := args first.	digits := args second.	number := String new writing.	number put: digit.	digits isEmpty ifFalse: [number write: digits].	^number contents asNumber</body>

<body package="Xtreams-Parsing-PetitParser">Identifier: first rest: rest	&lt;action: 'Identifier' arguments: #(1 2)&gt;	| stream |	stream := (String new: rest size + 1) writing.	stream put: first.	rest notEmpty ifTrue: [stream write: rest].	^stream contents</body>

<body package="Xtreams-Parsing-PetitParser">Escape: backslash character: character hexes: hexes	&lt;action: 'Escape' arguments: #( 1 2 3 )&gt;	backslash = '\' ifTrue:		[character = $s ifTrue: [^Character space].		character = $t ifTrue: [^Character tab].		character = $n ifTrue: [^Character cr].		character = $r ifTrue: [^Character lf].		character = $x ifTrue: [^('16r', (String withAll: hexes)) asNumber asCharacter]].	^character</body>
</methods>

<methods>
<class-id>PEG.PetitParserGenerator</class-id> <category>terminals</category>

<body package="Xtreams-Parsing-PetitParser">Reference: identifier	&lt;action: 'Reference' arguments: #(1)&gt;	^references add: identifier</body>

<body package="Xtreams-Parsing-PetitParser">RangeSet: min to: max	&lt;action: 'RangeSet' arguments: #(2 4)&gt;	| from |	from := min storeString.	^max		ifNil: ['char = ' , from]		ifNotNil: 			[| to |			to := max storeString.			self parenthesize: 'char between: ' , from , ' and: ' , to]</body>

<body package="Xtreams-Parsing-PetitParser">Range: excluding sets: sets	&lt;action: 'Range' arguments: #(3 4)&gt;	| predicate |	predicate := sets isEmpty				ifTrue: [excluding ifNil: ['false'] ifNotNil: ['true']]				ifFalse: 					[| pred |					pred := (sets fold: [:test :range | test , ' or: [' , range])								, (String new: sets size - 1 withAll: $]).					excluding ifNil: [pred] ifNotNil: [(self parenthesize: pred) , ' not']].	^'(PPPredicateObjectParser on: [:char | ' , predicate	, '] message: ''char set expected'')'</body>

<body package="Xtreams-Parsing-PetitParser">DOT	&lt;action: 'DOT' arguments: #()&gt;	^'#any asParser'</body>

<body package="Xtreams-Parsing-PetitParser">Literal: characters	&lt;action: 'Literal' arguments: #(2)&gt;	| literal |	literal := String withAll: characters.	^literal storeString , ' asParser'</body>
</methods>

<methods>
<class-id>PEG.PetitParserGenerator</class-id> <category>initialize-release</category>

<body package="Xtreams-Parsing-PetitParser">initialize	super initialize.	references := Set new.	definitions := Dictionary new</body>
</methods>

<methods>
<class-id>PEG.PetitParserGenerator</class-id> <category>structural</category>

<body package="Xtreams-Parsing-PetitParser">Expression: first rest: rest	&lt;action: 'Expression' arguments: #(1 2)&gt;	^rest isEmpty		ifTrue: [first]		ifFalse: 			[self				parenthesize: (rest inject: first into: [:par :alt | par , ' / ' , alt last])]</body>

<body package="Xtreams-Parsing-PetitParser">Sequence: parsers	&lt;action: 'Sequence'&gt;	^parsers size = 1		ifTrue: [parsers first]		ifFalse: [self parenthesize: (parsers fold: [:seq :par | seq , ' , ' , par])]</body>

<body package="Xtreams-Parsing-PetitParser">Definition: identifier expression: parser	&lt;action: 'Definition' arguments: #(2 6)&gt;	| method |	definitions at: identifier		ifPresent: [self error: 'Redefinition of: ' , identifier].	method := (String new writeStream)				nextPutAll: identifier;				cr;				cr;				tab;				nextPut: $^;				space;				nextPutAll: parser;				contents.	definitions at: identifier put: method.	^identifier -&gt; parser</body>

<body package="Xtreams-Parsing-PetitParser">Node: primary modifier: modifier cardinality: cardinality	&lt;action: 'Node' arguments: #(2 1 3)&gt;	| parser |	parser := primary.	cardinality ifNotNil: [parser := cardinality value: parser].	modifier ifNotNil: [parser := modifier value: parser].	^parser</body>

<body package="Xtreams-Parsing-PetitParser">Group: parser	&lt;action: 'Group' arguments: #(3)&gt;	^parser</body>

<body package="Xtreams-Parsing-PetitParser">Grammar: defs	&lt;action: 'Grammar' arguments: #(1)&gt;	| methodStart |	references do: 			[:ref |			(definitions keys includes: ref)				ifFalse: [self error: 'Missing definition of ' , ref]].	definitions keysDo: [:variable | parserClass addInstVarName: variable].	definitions values		do: [:method | parserClass compile: method].	methodStart := (String new writeStream)				nextPutAll: 'start';				cr;				cr;				tab;				nextPut: $^;				nextPutAll: start;				contents.	parserClass compile: methodStart classified: 'accessing'.	^parserClass</body>
</methods>


<methods>
<class-id>PEG.PEGActor class</class-id> <category>instance creation</category>

<body package="Xtreams-Parsing-PetitParser">grammarPEG	"PEG formally describing its own ASCII syntax [1].	Definitions of Primary, and Char adapted to parsing needs.	[1] Bryan Ford.	'Parsing Expression Grammars: A Recognition-based Syntactic Foundation'.	POPL'04.	http://doi.acm.org/10.1145/964001.964011 ."	^'# Hierarchical syntaxGrammar	&lt;- Spacing Definition+ EndOfFileDefinition	&lt;- Identifier LEFTARROW ExpressionExpression	&lt;- Sequence (SLASH Sequence)*Sequence	&lt;- Prefix*Prefix		&lt;- (AND / NOT)? SuffixSuffix		&lt;- Primary (QUESTION / STAR / PLUS)?Primary		&lt;- Reference			  / Parenthesised			  / Literal / Class / DOTReference	&lt;- Identifier !LEFTARROWParenthesised &lt;- OPEN Expression CLOSE# Lexical syntaxIdentifier		&lt;- IdentStart IdentCont* SpacingIdentStart	&lt;- [a-zA-Z_]IdentCont	&lt;- IdentStart / [0-9]Literal		&lt;- [''] (![''] Char)* [''] Spacing			  / ["] (!["] Char)* ["] SpacingClass		&lt;- ''['' (!'']'' Range)* '']'' SpacingRange		&lt;- Char (''-'' Char)?Char		&lt;- ''\\'' [nrt''"\[\]\\]			  / ''\\'' [0-2][0-7][0-7]			  / ''\\'' [0-7][0-7]?			  / !''\\'' .LEFTARROW	&lt;- ''&lt;-'' SpacingSLASH		&lt;- ''/'' SpacingAND		&lt;- ''&amp;'' SpacingNOT		&lt;- ''!'' SpacingQUESTION	&lt;- ''?'' SpacingSTAR		&lt;- ''*'' SpacingPLUS		&lt;- ''+'' SpacingOPEN		&lt;- ''('' SpacingCLOSE		&lt;- '')'' SpacingDOT		&lt;- ''.'' SpacingSpacing		&lt;- (Space / Comment)*Comment	&lt;- ''#'' (!EndOfLine .)* EndOfLineSpace		&lt;- '' '' / ''\t'' / EndOfLineEndOfLine	&lt;- ''\r\n'' / ''\n'' / ''\r''EndOfFile	&lt;- !.'</body>
</methods>


<methods>
<class-id>PEG.PEGActor</class-id> <category>initialize-release</category>

<body package="Xtreams-Parsing-PetitParser">useCache	useCache := true</body>

<body package="Xtreams-Parsing-PetitParser">initialize	super initialize.	useCache := false.	parser := PEG.Parser new.	references := Dictionary new</body>

<body package="Xtreams-Parsing-PetitParser">dontUseCache	useCache := false</body>
</methods>

<methods>
<class-id>PEG.PEGActor</class-id> <category>lexical symbols</category>

<body package="Xtreams-Parsing-PetitParser">PLUS	&lt;action: 'PLUS' arguments: #()&gt;	^	[:expression |		[parser		repeat: expression		min: 1		optional: Infinity positive]]</body>

<body package="Xtreams-Parsing-PetitParser">NOT	&lt;action: 'NOT' arguments: #()&gt;	^[:expression | [parser not: expression]]</body>

<body package="Xtreams-Parsing-PetitParser">AND	&lt;action: 'AND' arguments: #()&gt;	^[:expression | [parser explore: expression]]</body>

<body package="Xtreams-Parsing-PetitParser">STAR	&lt;action: 'STAR' arguments: #()&gt;	^	[:expression |		[parser		repeat: expression		min: 0		optional: Infinity positive]]</body>

<body package="Xtreams-Parsing-PetitParser">DOT	&lt;action: 'DOT' arguments: #()&gt;	^[parser anything]</body>

<body package="Xtreams-Parsing-PetitParser">QUESTION	&lt;action: 'QUESTION' arguments: #()&gt;	^[:expression | [parser optional: expression]]</body>
</methods>

<methods>
<class-id>PEG.PEGActor</class-id> <category>private</category>

<body package="Xtreams-Parsing-PetitParser">escape: characters	| character |	character :=   characters second.	"whitespace"	character = $n ifTrue: [^Character cr].	character = $r ifTrue: [^Character lf].	character = $t   ifTrue: [^Character tab].	"octal code"	character isDigit		ifTrue: 			[| code |			  code := characters reject: [:c | c isNil or: [c isCollection]].			('8r' , (String withAll: code)) asNumber asCharacter].	"literal character"	^character</body>
</methods>

<methods>
<class-id>PEG.PEGActor</class-id> <category>lexical</category>

<body package="Xtreams-Parsing-PetitParser">Range: args	&lt;action: 'Range'&gt;	| from to |	from := args first.	to := args second ifNil: [from] ifNotNil: [:s | s second].	^Interval from: from asInteger to: to asInteger</body>

<body package="Xtreams-Parsing-PetitParser">Class: args	&lt;action: 'Class'&gt;	| sets |	sets := args second collect: #second.	^sets isEmpty		ifTrue: [[parser not: self DOT]]		ifFalse: [[parser including: sets]]</body>

<body package="Xtreams-Parsing-PetitParser">Identifier: args	&lt;action: 'Identifier'&gt;	| first rest stream |	first := args first.	rest := args second.	stream := (String new: rest size + 1) writing.	stream put: first.	rest notEmpty ifTrue: [stream write: rest].	^stream contents</body>

<body package="Xtreams-Parsing-PetitParser">Literal: args	&lt;action: 'Literal'&gt;	| characters literal stream |	characters := args second.	stream := (String new: characters size) writing.	characters do: [:each | stream put: each second].	literal := stream contents.	parser bufferSize: literal size.	^[parser literal: literal]</body>

<body package="Xtreams-Parsing-PetitParser">Char: args	&lt;action: 'Char'&gt;	| character |	character := args second.	args first = '\'		ifTrue: 			[self escape: args].	^character</body>
</methods>

<methods>
<class-id>PEG.PEGActor</class-id> <category>hierarchical</category>

<body package="Xtreams-Parsing-PetitParser">Suffix: args	&lt;action: 'Suffix'&gt;	| primary cardinality |	primary := args first.	cardinality := args second.	^cardinality ifNil: [primary] ifNotNil: [cardinality value: primary]</body>

<body package="Xtreams-Parsing-PetitParser">Prefix: args	&lt;action: 'Prefix'&gt;	| modifier suffix |	modifier := args first.	suffix := args second.	^modifier ifNil: [suffix] ifNotNil: [modifier value: suffix].</body>

<body package="Xtreams-Parsing-PetitParser">Expression: args	&lt;action: 'Expression'&gt;	| first rest sequences |	first := args first.	rest := args second.	rest isEmpty ifTrue: [^first].	sequences := (Array with: first), (rest collect: [:each | each last]).	^[parser any: sequences]</body>

<body package="Xtreams-Parsing-PetitParser">Parenthesised: args	&lt;action: 'Parenthesised'&gt;	^args second</body>

<body package="Xtreams-Parsing-PetitParser">Reference: args	&lt;action: 'Reference'&gt;	^references at: args first ifAbsentPut: [Object new]</body>

<body package="Xtreams-Parsing-PetitParser">Grammar: args	&lt;action: 'Grammar'&gt;	| definitions defines |	definitions := args second.	defines := Dictionary new.	defines addAll: definitions.	references keysAndValuesDo: [:name :dummy | dummy become: (defines at: name)].	parser grammar addAll: references.	defines keysAndValuesDo: [:name :definition | definition class == Object ifFalse: [parser grammar at: name put: definition]].	^parser</body>

<body package="Xtreams-Parsing-PetitParser">Definition: args	&lt;action: 'Definition'&gt;	| identifier expression cache |	identifier := args first.	expression := args third.	useCache ifFalse: [ ^identifier -&gt; [parser definition: expression name: identifier] ].	parser caches add: (cache := Dictionary new).	^identifier -&gt; [parser definition: expression name: identifier cache: cache]</body>

<body package="Xtreams-Parsing-PetitParser">Sequence: nodes	&lt;action: 'Sequence'&gt;	nodes size = 1 ifTrue: [^nodes first].	^[parser all: nodes]</body>
</methods>



</st-source>
