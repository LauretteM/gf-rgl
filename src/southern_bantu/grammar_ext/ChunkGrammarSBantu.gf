-- Chunk: a chunk parsing version of the SBantu Resource Grammar

abstract ChunkGrammarSBantu =
  GrammarSBantu,
  PChunk,
  Symbol - [Symb]
  ** {
  flags startcat=Phr ;
  } ;
