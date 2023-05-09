--# -path=.:../abstract:../common:../api:../prelude

concrete NguniChunkZul of NguniChunk =
  NguniGrammarZul,
  BackwardZul[ComplV2,ComplV3,ComplV2V],
  ExtraExtZul,
  NounExtZul,
  RelativeExtZul,
  VerbExtZul,
  PhraseExtZul,
  -- MonoLexZul,
  PChunkZul,
  SymbolZul - [Symb]
  -- TempZul
  -- ,ConstructionZul
  -- ,DocumentationZul --# notpresent
  -- ,MarkupZul - [stringMark]
  ** {



} ;
