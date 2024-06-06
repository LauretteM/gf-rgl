--# -path=.:../abstract:../common:../prelude

concrete SymbolNso of Symbol = CatNso ** open Prelude, ResNso in {

lincat

  Symb = { s : Str } ;

lin
  MkSymb s = s ;

}
