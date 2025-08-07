concrete StructuralSBantuNso of StructuralSBantu = CatNso,CatSBantuNso ** open ResNso, ParadigmsNso, Prelude, ParamX in {

  lin

    -- -- adjective stems
    bad_A = mkA "be" ;
    big_A = mkA "golo" ;
    many_A = mkA "ntši" ;
    old_A = mkA "tala" ;
    beautiful_A = mkA "botse" ;
    long_A = mkA "telele" ;
    ugly_A = mkA "be" ;
    small_A = mkA "nyane" ;
    how_much_A = mkA "kae" ;
    other_A = mkA "ngwe" ;
    -- male_A = mkA "tona" ; -- not in abstract
    two_A = mkA "bedi" ;
    three_A = mkA "raro" ;
    four_A = mkA "ne" ;
    five_A = mkA "hlano" ;
    new_A = mkA "fsa" ; -- sha
    short_A = mkA "kopana" ; --fishane
    many_A = mkA "ntši" ; -- ningi
             
    -- -- relative stems
    black_R = mkA "so" ;
    few_R = mkA "nyane" ;
    -- heavy_R : A ; -- nzima
    -- honest_R : A ; -- qotho
    tasty_R = mkA "bose" ;
    nice_R = mkA "bose" ;
    white_R = mkA "šweu" ;
    green_R = mkA "talamerogo" ;
    dangerous_A = mkA "kotsi" ;
    red_R = mkA "hubedu" ; -- bomvu
    yellow_R = mkA "serolane" ; -- phuzi
    thin_R = mkA "sese" ; 
    how_R = mkA "bjang" ; --njani?
    hard_R = mkA "thata" ;
    thick_R = mkA "koto" ; 
    brown_R = mkA "sootho" ; -- nsundu
    grey_R = mkA "sehla" ;
    soft_R = mkA "boleta" ; -- ntofontofo
    raw_R = mkA "tala" ;
    crooked_R = mkA "kgopo" ;
    so_big_R = mkA "kaaka" ;
    -- how_big_R = mkA "kaakang" ;
    -- how_many_R = mkA "kae" ;
    spotted_R = mkA "mebalabala" ;
    blue_R = mkA "tala" ;
    classical_R = mkA "klasiki" ;

    -- -- enumerative stems
    -- some_A = mkA "nye" ;
    different_Enum = enum "šele" ;
    which_Enum = enum "&+ fe" ;
    one_Enum = enum "tee" ; 
    cruel_Enum = enum "šoro" ;

    -- -- adverbs
    when_Adv = { s = "neng" } ;
    
    how_Adv = { s = "bjang" } ;

    today_Adv = { s = "lehono" } ;
    yesterday_Adv = { s = "maabane" } ;
    -- well_Adv = { s = "gabotse" } ;
    now_Adv = { s = "bjale"} ;
    -- much_Adv = { s = "kudu" } ; 
    night_Adv = { s = "bošego" } ; 
    tomorrow_Adv = { s = "bosasa" } ; 
    tomorrow_2_Adv = { s = "gosasa" } ;
    winter_Adv = { s = "marega" } ; 
    evening_Adv = { s = "mantšiboa" } ; 
    really_Adv = { s = "ruri" } ; 
    -- often_Adv = { s = "gantši" } ;
    -- especially_Adv = { s = "gagolo" } ;
    -- thrice_Adv = { s = "gararo" } ;
    -- somewhat_Adv = { s = "gannyane" } ;
    -- badly_Adv = { s = "gampe" } ;
    painful_Adv = { s = "gabohloko" } ;
    ten_times_Adv = { s = "galesome" } ;
    once_Adv = { s = "kgatee" } ;
    so_Adv = { s = "bjalo" } ;
    day_before_yesterday_Adv = { s = "maloba" } ;
    just_Adv = { s = "fela" } ;
    simultaneously_Adv = { s = "gotee" } ;
    always_Adv = {s = "ka mehla" } ;
    long_ago_Adv = {s = "kgale" } ;
    -- twice_Adv = {s = "gabedi" } ;
    in_the_afternoon_Adv = { s = "ka mathapama" } ;
	  like_this_Adv = { s = "bjalo" } ;
    only_Adv = { s = "fela" } ;
    quickly_Adv = { s = "ka pela" } ;
    always_Adv = { s = "ka mehla" } ;
    again_Adv = { s = "gape" } ;
    
    -- here_Adv = { s = "mo" } ; -- mo
    -- here2_Adv = { s = "fa" } ; -- fa
    -- there_Adv = { s = "moo" } ; -- moo
    -- there2_Adv = { s = "fao" } ; -- fao
    -- yonder_Adv = { s = "mola" } ; -- mola
    -- yonder2_Adv = { s = "fale" } ; -- fale
    -- here3_Adv = { s = "gona" } ; -- gona
    -- outside_Adv = { s = "ntle" } ;
     
    -- locative adverbs
    where_LocAdv = { s = "kae" } ;
    far_LocAdv = {s = "kgole" } ;
    nearby_LocAdv = {s = "kgauswi" } ;
    across_LocAdv = { s = "putla" } ;
    at_the_back_LocAdv = { s = "morago" } ;
    -- behind_LocAdv : LocAdv ;
    -- on_the_side_LocAdv : LocAdv m
    above_LocAdv = { s = "godimo" } ;
    -- above_2_LocAdv : LocAdv ;
    -- on_the_outside_LocAdv : LocAdv ;
    below_LocAdv  = { s = "fase" } ;
    down_LocAdv = { s = "fase" } ;
    inside_LocAdv = { s = "ka gare ga" } ;
    outside_LocAdv = { s = "ntle" } ;
    yonder_LocAdv = { s = "kua" } ;

    -- locative class nouns
    below_LocN = mkLocClassNoun "fase" C16 ;
    place_LocN = mkLocClassNoun "felo" C16 ;
    above_LocN = mkLocClassNoun "godimo" C17 ;
    on_top_LocN = mkLocClassNoun "godimo" C17 ;
    elsewhere_LocN = mkLocClassNoun "gongwe" C17 ;
    behind_LocN = mkLocClassNoun "morago" C18 ;
    on_the_other_side_LocN = mkLocClassNoun "moše" C18 ;
    across_LocN = mkLocClassNoun "mošola" C18 ;
    this_side_LocN = mkLocClassNoun "mošono" C18 ;
        outside_LocN = mkLocClassNoun "ntle" C18 ;
    in_front_LocN = mkLocClassNoun "pele" C18 ;
    inside_LocN = mkLocClassNoun "teng" C18 ;
    central_LocN = mkLocClassNoun "gare" C18 ;
    next_to_LocN = mkLocClassNoun "hleng" C18 ;
    under_LocN = mkLocClassNoun "tlase" C18 ;
    far_LocN = mkLocClassNoun "kgole" C18 ;
    near_LocN = mkLocClassNoun "kgauswi" C18 ;
    long_ago_LocN = mkLocClassNoun "kgale" C18 ;
    home_LocN = mkLocClassNoun "gae" C18 ;
    -- ahead_LocN 
    -- forever_LocN 
    -- this_side_LocN : LocN ; 
    ages_ago_LocN = mkLocClassNoun "kgalekgale" C18 ;
    
    all_QuantPron = { s = all_quantpron } ;

    it3_Pron = mkPron "wona" "wona" (Third C3_4 Sg) ;
    they4_Pron = mkPron "yona" "yona" (Third C3_4 Pl) ;
    it5_Pron = mkPron "lona" "lona" (Third C5_6 Sg) ;
    they6_Pron = mkPron "ona" "ona" (Third C5_6 Pl) ;
    it7_Pron = mkPron "sona" "sona" (Third C7_8 Sg) ;
    they8_Pron = mkPron "tšona" "tšona" (Third C7_8 Pl) ;
    it9_Pron = mkPron "yona" "yona" (Third C9_10 Sg) ;
    they10_Pron = mkPron "tšona" "tšona" (Third C9_10 Pl) ;
    it11_Pron = {
      s = \\f => nonExist ; a = (Third C15 Sg) ; empty = nonExist ; proDrop = False
    } ;
    it14_Pron = mkPron "bjona" "bjona" (Third C14 Sg) ;
    it15_Pron = mkPron "gona" "gona" (Third C15 Sg) ;
    it16_Pron = mkPron "gona" "gona" (Third C16 Sg) ;
    it17_Pron = mkPron "gona" "gona" (Third C17 Sg) ;
    it18_Pron = mkPron "gona" "gona" (Third C18 Sg) ;
    -- Wat van die ga en N klasse hier?
    
    yonder_Quant = {
      s = \\a => dem_pron!Dem3!a ;
      dist = Dem3
    } ;

    -- conjunctions
    with_ConjN = { s = "le" } ;
    or_ConjN = { s = "goba" } ;
    -- together_with_Conj : Conj ;
    and_then_Conj = { s = "" ; mood = ConsecMS } ;
    -- but_also_Conj : Conj ;
    -- in_comparison_with_Conj : Conj ;
    while_Conj = { s = "mola" ; mood = SitMS } ;
    however_Conj = { s = "eupša" ; mood = IndicMS } ;
    if_Conj = { s = "ge" ; mood = SitMS } ;
    so_that_Conj = { s = "gore" ; mood = SubjunctMS } ;
    but_Conj = { s = "fela" ; mood = IndicMS } ;
    then_Conj = { s ="ebile" ; mood = IndicMS } ;
    because_Conj = { s = "ka gobane" ; mood = SitMS } ;
    because_2_Conj = { s = "gobane" ; mood = SitMS } ;
    whereas_Conj = { s = "kganthe" ; mood = SitMS } ;

    
    {-Loc = {
      s : TensedCl => Agr => Polarity => BasicTense => Str ; 
      inf_s : Polarity => Str  ;
      imp_s : Number => Polarity => Str ;
      consubj_s : UntensedCl => Agr => Polarity => Str
    } ;
    -}
    is_present_Loc = { -- gona, abs pron of the locative classes.
        s = table {
            IndicCl => \\a,p,t => let
                vform = VFTensed IndicCl p t ;
                cop = descr_cop vform a ;
                compl = "gona" ;
              in cop ++ compl ;

            RelCl => \\a,p,t => let
                vform = VFTensed RelCl p t ;
                cop = descr_cop vform a ;
                compl = "gona" ;
              in cop ++ compl ;

            SitCl => \\a,p,t => let
                vform = VFTensed SitCl p t ;
                cop = descr_cop vform a ;
                compl = "gona" ;
              in cop ++ compl
        } ;
        inf_s = table {
            Pos => "go" ++ "ba" ++ "gona" ;
            Neg => "go" ++ "se" ++ "be" ++ "gona"
        } ;
        imp_s = table {
            Sg => table {
                Pos => "eba" ++ "gona" ;           
                Neg => "se" ++ "be" ++ "gona" 
            } ;
            Pl => table {
                Pos => "ebang" ++ "gona" ;           
                Neg => "se" ++ "beng" ++ "gona"   
           } 
        } ;
        consubj_s = table {
          SubjunctCl => \\a,p => let
              vform = VFUntensed SubjunctCl p ;
              cop = descr_cop vform a ; 
              compl = "gona" ;
          in cop ++ compl ;
          
          ConsecCl => \\a,p => let
              vform = VFUntensed ConsecCl p ;
              cop = descr_cop vform a ; 
              compl = "gona" ;
          in cop ++ compl 
      } ;
    } ;

    -- here_Loc : Loc ;
    -- here_Loc = is_present_Loc ++ "mo" ;
     here_Loc = { -- gona PLUS mo, Dem 1 of the locative classes.
        s = table {
            IndicCl => \\a,p,t => let
                vform = VFTensed IndicCl p t ;
                cop = descr_cop vform a ;
                compl = "gona" ;
              in cop ++ compl ++ "mo" ;

            RelCl => \\a,p,t => let
                vform = VFTensed RelCl p t ;
                cop = descr_cop vform a ;
                compl = "gona" ;
              in cop ++ compl ++ "mo" ;

            SitCl => \\a,p,t => let
                vform = VFTensed SitCl p t ;
                cop = descr_cop vform a ;
                compl = "gona" ;
              in cop ++ compl ++ "mo"
        } ;
        inf_s = table {
            Pos => "go" ++ "ba" ++ "gona" ++ "mo" ;
            Neg => "go" ++ "se" ++ "be" ++ "gona" ++ "mo"
        } ;
        imp_s = table {
            Sg => table {
                Pos => "eba" ++ "gona" ++ "mo" ;           
                Neg => "se" ++ "be" ++ "gona" ++ "mo" 
            } ;
            Pl => table {
                Pos => "ebang" ++ "gona" ++ "mo" ;           
                Neg => "se" ++ "beng" ++ "gona" ++ "mo"  
           } 
        } ;
        consubj_s = table {
          SubjunctCl => \\a,p => let
              vform = VFUntensed SubjunctCl p ;
              cop = descr_cop vform a ; 
              compl = "gona" ;
          in cop ++ compl ++ "mo" ;
          
          ConsecCl => \\a,p => let
              vform = VFUntensed ConsecCl p ;
              cop = descr_cop vform a ; 
              compl = "gona" ;
          in cop ++ compl ++ "mo"
      } ;
    } ;  

    -- there_Loc : Loc ;
    -- there_Loc = is_present_Loc ++ "moo" ;
    there_Loc = { -- gona PLUS moo, Dem 2 of the locative classes.
        s = table {
            IndicCl => \\a,p,t => let
                vform = VFTensed IndicCl p t ;
                cop = descr_cop vform a ;
                compl = "gona" ;
              in cop ++ compl ++ "moo" ;

            RelCl => \\a,p,t => let
                vform = VFTensed RelCl p t ;
                cop = descr_cop vform a ;
                compl = "gona" ;
              in cop ++ compl ++ "moo" ;

            SitCl => \\a,p,t => let
                vform = VFTensed SitCl p t ;
                cop = descr_cop vform a ;
                compl = "gona" ;
              in cop ++ compl ++ "moo"
        } ;
        inf_s = table {
            Pos => "go" ++ "ba" ++ "gona" ++ "moo" ;
            Neg => "go" ++ "se" ++ "be" ++ "gona" ++ "moo"
        } ;
        imp_s = table {
            Sg => table {
                Pos => "eba" ++ "gona" ++ "moo" ;           
                Neg => "se" ++ "be" ++ "gona" ++ "moo" 
            } ;
            Pl => table {
                Pos => "ebang" ++ "gona" ++ "moo" ;           
                Neg => "se" ++ "beng" ++ "gona" ++ "moo"  
           } 
        } ;
        consubj_s = table {
          SubjunctCl => \\a,p => let
              vform = VFUntensed SubjunctCl p ;
              cop = descr_cop vform a ; 
              compl = "gona" ;
          in cop ++ compl ++ "moo" ;
          
          ConsecCl => \\a,p => let
              vform = VFUntensed ConsecCl p ;
              cop = descr_cop vform a ; 
              compl = "gona" ;
          in cop ++ compl ++ "moo"
      } ;
    } ;  

    -- at_which_IAdv : NP -> IAdv ;
    -- what_IAdv : IAdv ;
    -- how_many_IAdj : IAdj ;
    -- where_ConjAdv : ConjAdv ;

    -- how_IComp : IComp ; -- -njani
    -- where_IComp : IComp ; -- -phi
    -- how_much_IComp : IComp ; -- -ngakanani

   

}
