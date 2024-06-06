--# -path=.:../abstract:../common:../api:../prelude

concrete SBantuChunkZul of SBantuChunk =
  SBantuGrammarZul,
  AdverbExtZul,
  BackwardZul[ComplV2,ComplV3,ComplV2V],
  NounExtZul,
  PhraseExtZul,
  RelativeExtZul,
  SentenceExtZul,
  StructuralExtZul,
  VerbExtZul,
  PChunkZul,
  SymbolZul - [Symb]
  ** {



} ;
