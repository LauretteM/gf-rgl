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
    mkN : (ngwana, bana : Str) -> ClassGender -> N  = \stemsg,stempl,c -> lin N (mkNounIrreg stemsg stempl c) ;
    mkN : (gare : Str) -> ClassGender -> NType -> N  = \n,c,t -> lin N (mkNounTyped n c t) ;
    mkN : (ngwana, bana : Str) -> ClassGender -> NType -> N  = \stemsg,stempl,c,nt -> lin N (mkNounFull stemsg stempl c nt) ;
    mkN : (leporogo,leporogong,maporogo,maporogong : Str) -> ClassGender -> N = \abssg,locsg,abspl,locpl,cg -> lin N (mkNounExplicit abssg locsg abspl locpl cg) ;
    mkN : (leporogo,leporogong,maporogo,maporogong : Str) -> ClassGender -> NType -> N = \abssg,locsg,abspl,locpl,cg,nt -> lin N (mkNounWC abssg locsg abspl locpl cg nt) ;
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
    mkV2 : (bal,badile : Str) -> V2  = \bal,badile -> lin V2 (mkVerbExplicit bal badile) ;
  } ;

  mkV3 = overload {
    mkV3 : (cook : Str) -> V3  = \cook -> lin V3 (mkVerb cook) ;
    mkV3 : (f,file : Str) -> V3  = \f,file -> lin V3 (mkVerbExplicit f file) ;
  } ;

  mkV2V = overload {
    mkV2V : (somis : Str) -> V2V  = \somis -> lin V2V (mkVerb somis) ;
    mkV2V : (somis,somisitse : Str) -> V2V  = \somis,somisitse -> lin V2V (mkVerbExplicit somis somisitse) ;
  } ;

  mkVV = overload {
    mkVV : (nyak : Str) -> VV  = \nyak -> lin VV (mkVerb nyak) ;
    mkVV : (lek,lekile : Str) -> VV  = \lek,lekile -> lin VV (mkVerbExplicit lek lekile) ;
  } ;

  mkVS = overload {
    mkVS : (bon : Str) -> VS  = \bon -> lin VS (mkVerb bon) ** { mood = SubjunctMS } ;
    mkVS : (bal,badile : Str) -> VS = \bal,badile -> lin VS (mkVerbExplicit bal badile) ** { mood = SubjunctMS } ;    
    mkVS : (bon : Str) -> MoodS -> VS  = \bon,mood -> lin VS (mkVerb bon) ** { mood = mood } ; -- TODO: feed mood to a new mkSVerb oper
    mkVS : (re,itse : Str) -> MoodS -> VS = \re,itse,mood -> lin VS (mkVerbIrregular re itse) ** { mood =  mood } ; -- TODO: feed mood to a new mkIrregSVerb oper
    -- mkVS : (re, itše : Str) -> MoodS -> VS = \re,itše,mood -> lin VS (mkVerbIrregular re itše mood) ; -- TODO: feed mood to a new mkVerbIrregular oper
  } ;

  mkAdv = overload {
    mkAdv : Str -> Adv = \adv -> lin Adv (ss adv) ;
  } ;

} ;
