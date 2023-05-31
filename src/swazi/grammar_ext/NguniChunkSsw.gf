--# -path=.:../abstract:../common:../api:../prelude:../../nguni

concrete NguniChunkSsw of NguniChunk =
  NguniGrammarSsw,
  BackwardSsw[ComplV2,ComplV3,ComplV2V],
  NounExtSsw,
  PhraseExtSsw,
  RelativeExtSsw,
  SentenceExtSsw,
  StructuralExtSsw,
  VerbExtSsw,
  PChunkSsw,
  SymbolSsw - [Symb]
  ** {



} ;
