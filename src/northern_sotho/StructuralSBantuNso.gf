concrete StructuralSBantuNso of StructuralSBantu = CatNso,CatSBantuNso ** open ResNso, Prelude, ParamX in {

  lin

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

    below_LocN = mkLocClassNoun "fase" C16 ;
    above_LocN = mkLocClassNoun "godimo" C17 ;
    behind_LocN = mkLocClassNoun "morago" C18 ;
    on_the_other_side_LocN = mkLocClassNoun "mošola" C18 ;
    -- ahead_LocN 
    -- forever_LocN 
    outside_LocN = mkLocClassNoun "ntle" C18 ;
    in_front_LocN = mkLocClassNoun "pele" C18 ;
    inside_LocN = mkLocClassNoun "teng" C18 ;
    on_top_LocN = mkLocClassNoun "godimo" C17 ;

    central_LocN = mkLocClassNoun "gare" C18 ;

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

    -- at_the_back_LocAdv : LocAdv ;
    -- behind_LocAdv : LocAdv ;
    -- on_the_side_LocAdv : LocAdv ;
    -- above_LocAdv : LocAdv ;
    -- above_2_LocAdv : LocAdv ;
    -- on_the_outside_LocAdv : LocAdv ;
    -- below_LocAdv : LocAdv ;

    much_Adv = {
      s = "kudu"
    } ;

    -- with_ConjN = { s = "le" } ;
    -- together_with_Conj : Conj ;
    and_then_Conj = { s = "" ; mood = ConsecMS } ;
    -- but_also_Conj : Conj ;
    -- in_comparison_with_Conj : Conj ;
    while_Conj = { s = "mola" ; mood = SitMS } ;
    however_Conj = { s = "eupša" ; mood = IndicMS } ;
    if_Conj = { s = "ge" ; mood = SitMS } ;
    so_that_Conj = { s = "gore" ; mood = SubjunctMS } ;
    but_Conj = { s = "fela" ; mood = IndicMS } ;

    -- where_ConjAdv : ConjAdv ;

    -- how_IComp : IComp ; -- -njani
    -- where_IComp : IComp ; -- -phi
    -- how_much_IComp : IComp ; -- -ngakanani

    -- -- enumerative stems
   -- some_A = mkA "nye" ;
   different_Enum = enum "šele" ;
   -- which_Enum = enum "&+ fe" ;
   one_Enum = enum "tee" ; 
   cruel_Enum = enum "šoro" ;

}
