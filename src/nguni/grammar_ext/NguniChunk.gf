--1 Lang: a Test Module for the Resource Grammar

abstract NguniChunk =
  NguniGrammar,
  AdverbExt,
  Backward[ComplV2,ComplV3,ComplV2V],
  NounExt,
  PhraseExt,
  RelativeExt,
  SentenceExt,
  StructuralExt,
  VerbExt,
  PChunk,
  Symbol - [Symb]
  ** {
  flags startcat=Phr ;
  } ;
