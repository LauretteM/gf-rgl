--# -path=.:../abstract:../../prelude:../common

resource ParadigmsNso = open
  (Predef=Predef),
  Prelude,
  ResNso,
  CatNso,
  CatExtNso,
  ParamX
  in {

oper
  mkN = overload {
    mkN : (motho : Str) -> ClassGender -> N  = \n,c -> lin N (mkNoun n c) ;
    mkN : (gale : Str) -> ClassGender -> NType -> N  = \n,c,t -> lin N (mkNounWC n c t) ;
  } ;

  mkAdA = overload {
    mkAdA : (kakhulu : Str ) -> AdA = \a -> lin AdA (ss a) ;
  } ;

  mkA = overload {
    mkA : (golo : Str) -> A = \a -> lin A (regAdj a) ; -- regular adjective
  } ;

  mkV = overload {
    mkV : (sepel : Str) -> V  = \sepel -> lin V (mkVerb sepel) ;
  } ;

  mkV2 = overload {
    mkV2 : (rat : Str) -> V2  = \rat -> lin V2 (mkVerb rat) ;
  } ;

  mkV2V = overload {
    mkV2V : (somis : Str) -> V2V  = \somis -> lin V2V (mkVerb somis) ;
  } ;

  mkVV = overload {
    mkVV : (nyak : Str) -> VV  = \nyak -> lin VV (mkVerb nyak) ;
  } ;

  mkVS = overload {
    mkVS : (bon : Str) -> MoodS -> VS  = \bon,mood -> lin VS (mkVerb bon) ; -- TODO: feed mood to a new mkSVerb oper
    -- mkVS : (r, re : Str) -> MoodS -> VS = \r,re,mood -> lin VS (mkIrregSVerb r re mood) ; -- TODO: feed mood to a new mkIrregSVerb oper
  } ;

  mkAdv = overload {
    mkAdv : Str -> Adv = \adv -> lin Adv (ss adv) ;
  } ;

} ;
