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
<body>I am a compiler from Xtreams' PEG syntax to PetitParser parser classes.
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
<body>I am a parser from Xtreams' PEG syntax to PetitParser parser combinators.
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
<body>I am a parser from PEG ASCII syntax to an Xtreams parser.
</comment>

<methods>
<class-id>PEG.PetitParserParser</class-id> <category>error handling</category>

<body package="Xtreams-Parsing-PetitParser">DefinitionError: rest

<body package="Xtreams-Parsing-PetitParser">NodeError: rest

<body package="Xtreams-Parsing-PetitParser">SequenceError: rest

<body package="Xtreams-Parsing-PetitParser">EscapeError: rest
</methods>

<methods>
<class-id>PEG.PetitParserParser</class-id> <category>modifiers</category>

<body package="Xtreams-Parsing-PetitParser">NOT

<body package="Xtreams-Parsing-PetitParser">AND
</methods>

<methods>
<class-id>PEG.PetitParserParser</class-id> <category>cardinality</category>

<body package="Xtreams-Parsing-PetitParser">CardinalityRangeMin: min

<body package="Xtreams-Parsing-PetitParser">CardinalityRange: min max: max

<body package="Xtreams-Parsing-PetitParser">CardinalityLoopMin: min test: test

<body package="Xtreams-Parsing-PetitParser">STAR

<body package="Xtreams-Parsing-PetitParser">CardinalityLoop: test

<body package="Xtreams-Parsing-PetitParser">QUESTION

<body package="Xtreams-Parsing-PetitParser">PLUS

<body package="Xtreams-Parsing-PetitParser">Cardinality: cardinality
</methods>

<methods>
<class-id>PEG.PetitParserParser</class-id> <category>lexical</category>

<body package="Xtreams-Parsing-PetitParser">Escape: backslash character: character hexes: hexes

<body package="Xtreams-Parsing-PetitParser">NumLiteral: args

<body package="Xtreams-Parsing-PetitParser">Identifier: first rest: rest
</methods>

<methods>
<class-id>PEG.PetitParserParser</class-id> <category>terminals</category>

<body package="Xtreams-Parsing-PetitParser">DOT

<body package="Xtreams-Parsing-PetitParser">Literal: characters

<body package="Xtreams-Parsing-PetitParser">Reference: identifier

<body package="Xtreams-Parsing-PetitParser">RangeSet: from to: to

<body package="Xtreams-Parsing-PetitParser">Range: excluding sets: sets
</methods>

<methods>
<class-id>PEG.PetitParserParser</class-id> <category>initialize-release</category>

<body package="Xtreams-Parsing-PetitParser">initialize
</methods>

<methods>
<class-id>PEG.PetitParserParser</class-id> <category>structural</category>

<body package="Xtreams-Parsing-PetitParser">Group: parser

<body package="Xtreams-Parsing-PetitParser">Grammar: defs

<body package="Xtreams-Parsing-PetitParser">Expression: first rest: rest

<body package="Xtreams-Parsing-PetitParser">Definition: identifier expression: parser

<body package="Xtreams-Parsing-PetitParser">Sequence: parsers

<body package="Xtreams-Parsing-PetitParser">Node: primary modifier: modifier cardinality: cardinality
</methods>


<methods>
<class-id>PEG.PetitParserGenerator class</class-id> <category>instance creation</category>

<body package="Xtreams-Parsing-PetitParser">parser: aClass

<body package="Xtreams-Parsing-PetitParser">parser: aClass start: productionName
</methods>


<methods>
<class-id>PEG.PetitParserGenerator</class-id> <category>accessing</category>

<body package="Xtreams-Parsing-PetitParser">parser: aClass start: productionName
</methods>

<methods>
<class-id>PEG.PetitParserGenerator</class-id> <category>error handling</category>

<body package="Xtreams-Parsing-PetitParser">SequenceError: rest

<body package="Xtreams-Parsing-PetitParser">EscapeError: rest

<body package="Xtreams-Parsing-PetitParser">DefinitionError: rest

<body package="Xtreams-Parsing-PetitParser">NodeError: rest
</methods>

<methods>
<class-id>PEG.PetitParserGenerator</class-id> <category>private</category>

<body package="Xtreams-Parsing-PetitParser">parenthesize: parser
</methods>

<methods>
<class-id>PEG.PetitParserGenerator</class-id> <category>modifiers</category>

<body package="Xtreams-Parsing-PetitParser">NOT

<body package="Xtreams-Parsing-PetitParser">AND
</methods>

<methods>
<class-id>PEG.PetitParserGenerator</class-id> <category>cardinality</category>

<body package="Xtreams-Parsing-PetitParser">CardinalityLoopMin: min test: test

<body package="Xtreams-Parsing-PetitParser">STAR

<body package="Xtreams-Parsing-PetitParser">CardinalityLoop: test

<body package="Xtreams-Parsing-PetitParser">QUESTION

<body package="Xtreams-Parsing-PetitParser">Cardinality: cardinality

<body package="Xtreams-Parsing-PetitParser">PLUS

<body package="Xtreams-Parsing-PetitParser">CardinalityRangeMin: min

<body package="Xtreams-Parsing-PetitParser">CardinalityRange: min max: max
</methods>

<methods>
<class-id>PEG.PetitParserGenerator</class-id> <category>lexical</category>

<body package="Xtreams-Parsing-PetitParser">NumLiteral: args

<body package="Xtreams-Parsing-PetitParser">Identifier: first rest: rest

<body package="Xtreams-Parsing-PetitParser">Escape: backslash character: character hexes: hexes
</methods>

<methods>
<class-id>PEG.PetitParserGenerator</class-id> <category>terminals</category>

<body package="Xtreams-Parsing-PetitParser">Reference: identifier

<body package="Xtreams-Parsing-PetitParser">RangeSet: min to: max

<body package="Xtreams-Parsing-PetitParser">Range: excluding sets: sets

<body package="Xtreams-Parsing-PetitParser">DOT

<body package="Xtreams-Parsing-PetitParser">Literal: characters
</methods>

<methods>
<class-id>PEG.PetitParserGenerator</class-id> <category>initialize-release</category>

<body package="Xtreams-Parsing-PetitParser">initialize
</methods>

<methods>
<class-id>PEG.PetitParserGenerator</class-id> <category>structural</category>

<body package="Xtreams-Parsing-PetitParser">Expression: first rest: rest

<body package="Xtreams-Parsing-PetitParser">Sequence: parsers

<body package="Xtreams-Parsing-PetitParser">Definition: identifier expression: parser

<body package="Xtreams-Parsing-PetitParser">Node: primary modifier: modifier cardinality: cardinality

<body package="Xtreams-Parsing-PetitParser">Group: parser

<body package="Xtreams-Parsing-PetitParser">Grammar: defs
</methods>


<methods>
<class-id>PEG.PEGActor class</class-id> <category>instance creation</category>

<body package="Xtreams-Parsing-PetitParser">grammarPEG
</methods>


<methods>
<class-id>PEG.PEGActor</class-id> <category>initialize-release</category>

<body package="Xtreams-Parsing-PetitParser">useCache

<body package="Xtreams-Parsing-PetitParser">initialize

<body package="Xtreams-Parsing-PetitParser">dontUseCache
</methods>

<methods>
<class-id>PEG.PEGActor</class-id> <category>lexical symbols</category>

<body package="Xtreams-Parsing-PetitParser">PLUS

<body package="Xtreams-Parsing-PetitParser">NOT

<body package="Xtreams-Parsing-PetitParser">AND

<body package="Xtreams-Parsing-PetitParser">STAR

<body package="Xtreams-Parsing-PetitParser">DOT

<body package="Xtreams-Parsing-PetitParser">QUESTION
</methods>

<methods>
<class-id>PEG.PEGActor</class-id> <category>private</category>

<body package="Xtreams-Parsing-PetitParser">escape: characters
</methods>

<methods>
<class-id>PEG.PEGActor</class-id> <category>lexical</category>

<body package="Xtreams-Parsing-PetitParser">Range: args

<body package="Xtreams-Parsing-PetitParser">Class: args

<body package="Xtreams-Parsing-PetitParser">Identifier: args

<body package="Xtreams-Parsing-PetitParser">Literal: args

<body package="Xtreams-Parsing-PetitParser">Char: args
</methods>

<methods>
<class-id>PEG.PEGActor</class-id> <category>hierarchical</category>

<body package="Xtreams-Parsing-PetitParser">Suffix: args

<body package="Xtreams-Parsing-PetitParser">Prefix: args

<body package="Xtreams-Parsing-PetitParser">Expression: args

<body package="Xtreams-Parsing-PetitParser">Parenthesised: args

<body package="Xtreams-Parsing-PetitParser">Reference: args

<body package="Xtreams-Parsing-PetitParser">Grammar: args

<body package="Xtreams-Parsing-PetitParser">Definition: args

<body package="Xtreams-Parsing-PetitParser">Sequence: nodes
</methods>



</st-source>