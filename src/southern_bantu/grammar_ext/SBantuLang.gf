--1 Lang: a Test Module for the Resource Grammar

abstract SBantuLang =
  SBantuGrammar,
  Backward[ComplV2,ComplV3,ComplV2V],
  AdverbSBantu,
  NounSBantu,
  PhraseSBantu,
  RelativeSBantu,
  SentenceSBantu,
  StructuralSBantu,
  VerbSBantu
  ** {
  flags startcat=Phr ;
  } ;
