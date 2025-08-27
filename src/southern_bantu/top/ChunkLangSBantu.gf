-- ChunkLang: a chunk parsing version of the SBantu Resource Grammar

abstract ChunkLangSBantu =
  ChunkGrammarSBantu,
  LexiconSBantu
  ** {
  flags startcat=Phr ;
  } ;
