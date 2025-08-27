-- Chunk: a chunk parsing version of the SBantu Resource Grammar

abstract ChunkGrammarSBantu =
  GrammarSBantu,
  ChunkSBantu,
  Symbol - [Symb],
  SymbolSBantu
  ** {
  flags startcat=Phr ;
  } ;
