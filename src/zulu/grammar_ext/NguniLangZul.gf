--# -path=.:../abstract:../common:../api:../prelude

concrete NguniLangZul of NguniLang =
  NguniGrammarZul,
  BackwardZul[ComplV2,ComplV3,ComplV2V],
  ExtraExtZul,
  NounExtZul,
  RelativeExtZul,
  VerbExtZul,
  PhraseExtZul
  -- MonoLexZul,
  -- ChunkZul,
  -- SymbolZul - [Symb],
  -- TempZul
  -- ,ConstructionZul
  -- ,DocumentationZul --# notpresent
  -- ,MarkupZul - [stringMark]
  ** {



} ;
