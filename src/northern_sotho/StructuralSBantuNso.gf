concrete StructuralSBantuNso of StructuralSBantu = CatNso,CatSBantuNso ** open ResNso, Prelude, ParamX in {

  lin

    all_QuantPron = { s = all_quantpron } ;

    it3_Pron = mkPron "wona" "wona" (Third C3_4 Sg) ;
    it5_Pron = mkPron "lona" "lona" (Third C5_6 Sg) ;
    it7_Pron = mkPron "sona" "sona" (Third C7_8 Sg) ;
    it9_Pron = mkPron "yona" "yona" (Third C9_10 Sg) ;
    it14_Pron = mkPron "bjona" "bjona" (Third C14 Sg) ;
    it15_Pron = mkPron "gona" "gona" (Third C15 Sg) ;
    it16_Pron = mkPron "gona" "gona" (Third C16 Sg) ;
    it17_Pron = mkPron "gona" "gona" (Third C17 Sg) ;
    it18_Pron = mkPron "gona" "gona" (Third C18 Sg) ;
    they4_Pron = mkPron "yona" "yona" (Third C3_4 Pl) ;
    they6_Pron = mkPron "ona" "ona" (Third C5_6 Pl) ;
    they8_Pron = mkPron "tšona" "tšona" (Third C7_8 Pl) ;
    they10_Pron = mkPron "tšona" "tšona" (Third C9_10 Pl) ;

    yonder_Quant = {
      s = \\a => dem_pron!Dem3!a ;
      dist = Dem3
    } ;

    -- inside_LocN 
    below_LocN = mkLocClassNoun "fase" C16 ;
    -- on_the_other_side_LocN 
    -- outside_LocN 
    -- in_front_LocN 
    -- ahead_LocN 
    -- forever_LocN 
    above_LocN = mkLocClassNoun "godimo" C17 ;
    -- on_top_LocN 
    behind_LocN = mkLocClassNoun "morago" C18 ;

    if_Conj = { s = "ge" ; mood = SitMS } ;
    so_that_Conj = { s = "gore" ; mood = SubjunctMS } ;
    but_Conj = { s = "fela" ; mood = IndicMS } ;
    and_then_Conj = { s = "" ; mood = ConsecMS } ;

}
