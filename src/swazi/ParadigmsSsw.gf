--# -path=.:../abstract:../../prelude:../common

resource ParadigmsSsw = open
  (Predef=Predef),
  Prelude,
  -- MorphoSsw,
  ResSsw,
  CatSsw,
  CatSBantuSsw,
  ParamX
  in {

oper
  mkN = overload {
    mkN : (wifi : Str) -> N = \n -> lin N (regNoun n C5_6) ;   -- default case, useful for loan words
    mkN : (Mediterranean, Mediterranean : Str) -> N = \n,n2 -> lin N (mkELocN n C5_6) ;   -- default case, useful for loan words
    mkN : (ngane : Str) -> ClassGender -> N  = \n,c -> lin N (regNoun n c) ;   -- "thing" nouns
    mkN : (khaya, khaya : Str) -> ClassGender -> N  = \n,n2,c -> lin N (mkELocN n c) ;   -- "thing" nouns
    mkN : (nyaka,onyakeni,eminyakeni : Str) -> ClassGender -> N = \n,ls,lp,c -> lin N (semiRegNoun n ls lp c) ;
    mkN : (iso,amehlo,esweni,emehlweni : Str) -> ClassGender -> N = \ns,np,ls,lp,c -> lin N (mkNoun ns np ls lp ns c) ;
  } ;

  mkLN = overload {
    mkLN : (Mediterranean : Str) -> N = \n -> lin N (mkELocN n C5_6) ;   -- default case, useful for loan words
  } ;

  mkPN = overload {
    mkPN : (John : Str) -> N  = \n -> lin N (regNoun n C1a_2a) ;
    mkPN : (John : Str) -> ClassGender -> N  = \n,c -> lin N (regNoun n c) ;   -- "thing" nouns
    mkPN : (nyaka,onyakeni,eminyakeni : Str) -> ClassGender -> N = \n,ls,lp,c -> lin N (semiRegNoun n ls lp c) ;
    mkPN : (iso,amehlo,esweni,emehlweni : Str) -> ClassGender -> N = \ns,np,ls,lp,c -> lin N (mkNoun ns np ls lp ns c) ;
    } ;

  mkKwaPN = overload {
    mkKwaPN : (Swati : Str) -> ClassGender -> PN = \n,c -> lin PN (kwaProperName n c) ;
  } ;

  mkAdA = overload {
    mkAdA : (kakhulu : Str ) -> AdA = \a -> lin AdA (ss a) ;
  } ;

  mkA = overload {
    mkA : (kahle : Str) -> A = \a -> lin A (regAdj a) ; -- regular adjective
  } ;

  mkRelA = overload {
    mkRelA : (mnandi : Str) -> A = \a -> lin A (relAdj a) ; -- relative stem "adjective"
  } ;

  -- mkEnumA = overload {
  --   mkEnumA : (mbe : Str) -> A = \a -> lin A (enumAdj a) ; -- relative stem "adjective"
  -- } ;

  mkV = overload {
    mkV : (hamb : Str) -> V  = \hamb -> lin V (regVerb hamb) ;
    mkV : (th,thi : Str) -> V  = \th,thi -> lin V (th_Verb th thi) ;
    mkV : (guqubal,guqubala,guqubele : Str) -> V = \guqubal,guqubala,guqubele -> lin V (three_Verb guqubal guqubala guqubele) ;
    mkV : (dlal,dlala,dlalile,dlale : Str) -> V = \dlal,dlala,dlalile,dlale -> lin V (four_Verb dlal dlala dlalile dlale) ;
  } ;

  passV = overload {
    passV: Str -> V = \fakw -> lin V (passiveVerb fakw) ;
  } ;

  passV2 = overload {
    passV2: Str -> V2 = \fakw -> lin V2 (passiveVerb fakw) ;
  } ;

  mkV2 = overload {
    mkV2 : (hamb : Str) -> V2  = \hamb -> lin V2 (regVerb hamb) ;
    mkV2 : (th,thi : Str) -> V2  = \th,thi -> lin V2 (th_Verb th thi) ;
    mkV2 : (guqubal,guqubala,guqubele : Str) -> V2 = \guqubal,guqubala,guqubele -> lin V2 (three_Verb guqubal guqubala guqubele) ;
    mkV2 : (guqubal,guqubala,guqubele,guqubele_2 : Str) -> V2 = \guqubal,guqubala,guqubele,guqubele_2 -> lin V2 (four_Verb guqubal guqubala guqubele guqubele_2) ;
  } ;

  mkV3 = overload {
    mkV3 : (hamb : Str) -> V3  = \hamb -> lin V3 (regVerb hamb) ;
    mkV3 : (th,thi : Str) -> V3  = \th,thi -> lin V3 (th_Verb th thi) ;
    mkV3 : (guqubal,guqubala,guqubele : Str) -> V3 = \guqubal,guqubala,guqubele -> lin V3 (three_Verb guqubal guqubala guqubele) ;
    mkV3 : (guqubal,guqubala,guqubele,guqubele_2 : Str) -> V3 = \guqubal,guqubala,guqubele,guqubele_2 -> lin V3 (four_Verb guqubal guqubala guqubele guqubele_2) ;
  } ;

  mkV2V = overload {
    mkV2V : (hamb : Str) -> V2V  = \hamb -> lin V2V (regVerb hamb) ;
    mkV2V : (th,thi : Str) -> V2V  = \th,thi -> lin V2V (th_Verb th thi) ;
    mkV2V : (guqubal,guqubala,guqubele : Str) -> V2V = \guqubal,guqubala,guqubele -> lin V2V (three_Verb guqubal guqubala guqubele) ;
    mkV2V : (guqubal,guqubala,guqubele,guqubele_2 : Str) -> V2V = \guqubal,guqubala,guqubele,guqubele_2 -> lin V2V (four_Verb guqubal guqubala guqubele guqubele_2) ;
  } ;

  mkVA = overload {
    mkVA : (b : Str) -> VA  = \b -> lin VA (regVerb b) ;
  } ;

  mkVV = overload {
    mkVV : (f : Str) -> VV  = \f -> lin VV (regVerb f)
  } ;

  mkVS = overload {
    mkVS : (cel : Str) -> SType -> VS  = \cel,st -> lin VS ((regVerb cel) ** { s_type = st } ) ;
    mkVS : (az,azi : Str) -> SType -> VS  = \az,azi,st -> lin VS ((th_Verb az azi) ** { s_type = st } ) ;
  } ;

  mkVAux = overload {
    mkVAux : (hlale : Str) -> VAux  = \hlale -> lin VAux {
      s = hlale ;
      at = PartAux
    }
  } ;

  -- yourPl_Det = overload {
  --   yourPl_Det : Det = lin Det { s = "jou" ; n = Pl ; p = TPos } ;
  -- } ;
  --
  -- mkSgDet = overload {
  --   mkSgDet : Str -> Det = \s -> lin Det { s = s ; n = Sg ; p = TPos } ;
  -- } ;

  -- mkPlDet = overload {
  --   mkPlDet : Str -> Det = \s -> lin Det { s = s ; n = Pl ; qdef = Article Def } ;
  -- } ;

  -- -- mkVS = overload {
  -- --   mkVS : V -> VS = \weet -> lin VS { v = weet ; c = "dat" } ;
  -- -- } ;
  -- --
  -- -- mkVQ = overload {
  -- --   mkVQ : V -> VS = \wonder -> lin VS { v = wonder ; c = "of" } ;
  -- -- } ;

  mkAdv = overload {
    mkAdv : Str -> Adv = \adv -> lin Adv (regAdv adv) ;
    -- mkAdv : Str -> Aspect -> Adv = \adv,asp -> lin Adv (aspAdv adv asp) ;
  } ;

  mkIAdv = overload {
    mkIAdv : Str -> Bool -> IAdv = \adv,b -> lin IAdv { s = adv ; postIAdv = b } ;
    -- mkAdv : Str -> Aspect -> Adv = \adv,asp -> lin Adv (aspAdv adv asp) ;
  } ;

  -- mkPredet = overload {
  --   mkPredet : Str -> Predet = \predet -> lin Predet { s = predet ; p = TPos } ;
  -- } ;
} ;
