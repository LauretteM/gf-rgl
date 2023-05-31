--1 Lang: a Test Module for the Resource Grammar

abstract NguniLang =
  NguniGrammar,
  Backward[ComplV2,ComplV3,ComplV2V],
  AdverbExt,
  NounExt,
  PhraseExt,
  RelativeExt,
  SentenceExt,
  StructuralExt,
  VerbExt
  ** {
  flags startcat=Phr ;
  } ;
