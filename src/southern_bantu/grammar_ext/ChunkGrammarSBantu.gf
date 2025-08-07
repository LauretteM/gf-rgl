--1 Lang: a Test Module for the Resource Grammar

abstract ChunkGrammarSBantu =
  GrammarSBantu,
  -- AdverbSBantu,
  -- Backward[ComplV2,ComplV3,ComplV2V],
  -- NounSBantu,
  -- PhraseSBantu,
  -- RelativeSBantu,
  -- SentenceSBantu,
  -- StructuralSBantu,
  -- VerbSBantu,
  PChunk,
  Symbol - [Symb]
  ** {
  flags startcat=Phr ;
  } ;
