-- Chunk: a chunk parsing version of the SBantu Resource Grammar

abstract ChunkSBantu =
  ChunkGrammarSBantu,
  LexiconSBantu
  ** {
  flags startcat=Phr ;
  } ;
