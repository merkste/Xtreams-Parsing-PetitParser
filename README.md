# Xtreams-Parsing-PetitParser
Bridge from Xtreams-Parsing to PetitParser

This package provides a bridge from Xtreams-Parsing to PetitParser. Additionally, it includes support to generate an Xtreams parser from Bryan Ford's original PEG ASCII syntax [1].

# Contents
* `PEGActor`  
Build an Xtreams parser from the PEG ASCII syntax.

* `PetitParserGenerator`  
Compile a grammar in Xtreams' PEG into a PetitParser class.

* `PetitParserParser`  
Build a PetitParser of parser combinators from a grammar in Xtreams' PEG.

# Example
## Xtreams PEG to PetitParser Class
```Smalltalk
"To parse a PEG and generate code use:“
aClass :=
   PEG.Parser parserPEG
      parse: 'Grammar'
      stream: aGrammerString
      actor:
        (PetitParserGenerator
           class: TargetClass
           start: 'Grammar').
```
## Xtreams PEG to PetitParser Parser
```Smalltalk
"To build an XML parser do:"
parser :=
  PEG.Parser parserPEG
     parse: 'Grammar'
     stream: PEG.Parser grammarXML
      actor: PetitParserParser new.
```
## Bryan Ford's PEG to Xtreams
```Smalltalk
"To bootstrap a PEG parser parser use:“
parserParser :=
   PEG.Parser parserPEG
      parse: 'Grammar'
      stream: PEGActor grammarPEG
      actor: ParserParser new.

"To parse a PEG and build an Xtreams parser use:"
parserPEG :=
   parserParser
      parse: 'Grammar'
      stream: aGrammerString
      actor: PEGActor new.

"To bootstrap the parser parser use:"
parserParser :=
   parserParser
      parse: 'Grammar'
      stream: PEGActor grammarPEG
      actor: PEGActor new
```

# Literature
[1] Bryan Ford.
  'Parsing Expression Grammars: A Recognition-based Syntactic Foundation'.
  POPL'04.
  [http://doi.acm.org/10.1145/964001.964011](http://doi.acm.org/10.1145/964001.964011) .
