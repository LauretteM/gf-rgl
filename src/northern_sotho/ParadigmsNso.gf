--# -path=.:../abstract:../../prelude:../common

resource ParadigmsNso = open
  (Predef=Predef),
  Prelude,
  ResNso,
  CatNso,
  CatSBantuNso,
  ParamX
  in {

oper
  mkN = overload {
    mkN : (motho : Str) -> ClassGender -> N  = \n,c -> lin N (mkNoun n c) ;
    mkN : (ngwana, bana : Str) -> ClassGender -> N  = \stemsg,stempl,c -> lin N (mkIrregNoun stemsg stempl c) ;
    mkN : (gare : Str) -> ClassGender -> NType -> N  = \n,c,t -> lin N (mkTypedNoun n c t) ;
    mkN : (ngwana, bana : Str) -> ClassGender -> NType -> N  = \stemsg,stempl,c,nt -> lin N (mkNounWC stemsg stempl c nt) ;
    mkN : (leporogo,leporogong,maporogo,maporogong : Str) -> ClassGender -> N = \abssg,locsg,abspl,locpl,cg -> lin N (mkNounExplicit abssg locsg abspl locpl cg) ;
  } ;

  mkAdA = overload {
    mkAdA : (kakhulu : Str ) -> AdA = \a -> lin AdA (ss a) ;
  } ;

  mkA = overload {
    mkA : (golo : Str) -> A = \a -> lin A (regAdj a) ; -- regular adjective
  } ;

  mkV = overload {
    mkV : (sepel : Str) -> V  = \sepel -> lin V (mkVerb sepel) ;
    mkV : (sepel,sepetse : Str) -> V  = \sepel,sepetse -> lin V (mkVerbExplicit sepel sepetse) ;
  } ;

  mkV2 = overload {
    mkV2 : (rat : Str) -> V2  = \rat -> lin V2 (mkVerb rat) ;
    mkV2 : (bal,badile : Str) -> V  = \bal,badile -> lin V (mkVerbExplicit bal badile) ;
  } ;

  mkV3 = overload {
    mkV3 : (cook : Str) -> V3  = \cook -> lin V3 (mkVerb cook) ;
  } ;

  mkV2V = overload {
    mkV2V : (somis : Str) -> V2V  = \somis -> lin V2V (mkVerb somis) ;
  } ;

  mkVV = overload {
    mkVV : (nyak : Str) -> VV  = \nyak -> lin VV (mkVerb nyak) ;
  } ;

  mkVS = overload {
    mkVS : (bon : Str) -> VS  = \bon -> lin VS (mkVerb bon) ** { mood = SubjunctMS } ;
    mkVS : (bon : Str) -> MoodS -> VS  = \bon,mood -> lin VS (mkVerb bon) ** { mood = mood } ; -- TODO: feed mood to a new mkSVerb oper
    -- mkVS : (r, re : Str) -> MoodS -> VS = \r,re,mood -> lin VS (mkIrregSVerb r re mood) ; -- TODO: feed mood to a new mkIrregSVerb oper
  } ;

  mkAdv = overload {
    mkAdv : Str -> Adv = \adv -> lin Adv (ss adv) ;
  } ;

} ;
