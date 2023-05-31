--# -path=.:../abstract:../common:prelude

concrete GrammarSsw of Grammar =
  NounSsw,
  VerbSsw,
  AdjectiveSsw,
  AdverbSsw,
  NumeralSsw,
  SentenceSsw,
  QuestionSsw,
  RelativeSsw,
  ConjunctionSsw,
  PhraseSsw,
  TextX - [Temp,Adv,IAdv],
  StructuralSsw,
  IdiomSsw,
  TenseX [PPos,PNeg] -- - [Temp,Adv]
  ** open ResSsw, Prelude in {

flags startcat = Phr ; unlexer = text ; lexer = text ;

} ;
