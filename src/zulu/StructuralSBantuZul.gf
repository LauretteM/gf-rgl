concrete StructuralSBantuZul of StructuralSBantu = CatZul,CatSBantuZul ** open ResZul, Prelude, ParamX, ParadigmsZul in {

  lin

    -- adjective stems
    bad_A = regAdj "bi" ;
    big_A = regAdj "khulu" ;
    -- many_A : A ; -- many
    -- old_A : A ; -- dala
    pretty_A = regAdj "hle" ;
    -- tall_A : A ; -- de
    -- ugly_A : A ; -- bana
    small_A = regAdj "fuphi" ;
    how_much_A = regAdj "ngaki" ;
    -- other_A : A ;
    two_A = regAdj "bili" ;
    three_A = regAdj "thathu" ;
    four_A = regAdj "ne" ;
    five_A = regAdj "hlanu" ;
      
    -- relative stems
    -- black_R : A ; -- mnyama
    red_R = relAdj "bomvu" ;
    -- few_R : A ; -- mbalwa
    -- heavy_R : A ; -- nzima
    honest_R = relAdj "qotho" ;
    -- tasty_R : A ; -- mnandi
    nice_R = relAdj "mnandi" ;
    -- white_R : A ; -- mhlophe
    -- green_R : A ;
    -- dangerous_A : A ;

    -- adverbs
    today_Adv = regAdv "namuhla" ;
    always_Adv = regAdv "njalo" ;
    -- yesterday_Adv : Adv ;
    -- well_Adv : Adv ;
    yesterday_Adv = regAdv "izolo" ;
    -- well_Adv : Adv ;
    now_Adv = regAdv "manje" ;
    when_Adv = regAdv "nini" ;

    only_QuantPron = {
      s = only_QuantPron_table ;
      lemma = "dwa"
    } ;
    all_QuantPron = {
      s = only_QuantPron_table ;
      lemma = "nke"
    } ;

    it3_Pron = mkPron (Third C3_4 Sg) ;
    they4_Pron = mkPron (Third C3_4 Pl) ;
    it5_Pron = mkPron (Third C5_6 Sg) ;
    they6_Pron = mkPron (Third C5_6 Pl) ;
    it7_Pron = mkPron (Third C7_8 Sg) ;
    they8_Pron = mkPron (Third C7_8 Pl) ;
    it9_Pron = mkPron (Third C9_10 Sg) ;
    they10_Pron = mkPron (Third C9_10 Pl) ;
    it11_Pron = mkPron (Third C11_10 Sg) ;
    it14_Pron = mkPron (Third C14 Sg) ;
    it15_Pron = mkPron (Third C15 Sg) ;
    it17_Pron = mkPron (Third C17 Sg) ;

    yonder_Quant = {
      s = \\b,a => dem_pron!Dem3!a ;
      dist = Dem3
    } ;

    inside_LocN = regLocN "phakathi" ;
    below_LocN = regLocN "phansi" ;
    on_the_other_side_LocN = regLocN "phesheya" ;
    outside_LocN = regLocN "phandle" ;
    in_front_LocN = regLocN "phambili" ;
    ahead_LocN = regLocN "phambi" ;
    forever_LocN = regLocN "phakade" ;
    above_LocN = regLocN "phezulu" ;
    on_top_LocN = regLocN "phezulu" ;

    here_Loc = {
      s = table {
        MainCl => \\a,p,t => let
          vform = VFIndic MainCl p t ;
          pcp = ap_cop_pref vform a RelType ; -- u-
          cop_base = ADV_LAPHA
        in
          case vform of {
            VFIndic _ Neg PresTense => (kho_cop vform a) ++ cop_base;
            VFIndic _ _ _ => pcp ++ cop_base ;
            VFConsec _ => nonExist ; -- "*consec" ;
            VFSubjunct _ => nonExist -- "*subjunct"
          } ;
        RelCl => \\a,p,t => let
          vform = VFIndic RelCl p t ;
          rcp = (relConcCop vform a RC) ; -- o- / onge-
          pcp = ap_cop_pref vform a RelType ; -- [] / zoba
          cop_base = ADV_LAPHA -- lapha
        in
        case vform of {
          VFIndic _ Neg PresTense => (kho_cop vform a) ++ cop_base;
          VFIndic _ _ _ => rcp ++ pcp ++ cop_base ;
            VFConsec _ => nonExist ; -- "*consec" ;
            VFSubjunct _ => nonExist -- "*subjunct"
        }
      } ;
      imp_s = table {
        Sg => table {
          Pos => COP_YI++BIND++BA ++ ADV_LAPHA ;
          Neg => IMP_NEG_PREF_SG++BIND++BI ++ ADV_LAPHA
        } ;
        Pl => table {
          Pos => COP_YI++BIND++BA++BIND++PL_NI ++ ADV_LAPHA ;
          Neg => IMP_NEG_PREF_PL++BIND++BI ++ ADV_LAPHA
        }
      } ;
      inf_s = table {
        NFull => table {
          Pos => INF_PREF_FULL++BIND++BA ++ ADV_LAPHA ;
          Neg => INF_PREF_FULL++BIND++NEG_NGA++BI ++ ADV_LAPHA
        } ;
        NReduced | NPoss => table {
          Pos => INF_PREF_REDUCED++BIND++BA ++ ADV_LAPHA ;
          Neg => INF_PREF_REDUCED++BIND++NEG_NGA++BI ++ ADV_LAPHA
        } ;
        NLoc => table {
          Pos => LOC_KU++BIND++poss_pron_stem!(Third C15 Sg) ++INF_PREF_FULL++BIND++BA ++ ADV_LAPHA ;
          Neg => LOC_KU++BIND++poss_pron_stem!(Third C15 Sg) ++INF_PREF_FULL++BIND++NEG_NGA++BI ++ ADV_LAPHA
        }
      } ;
      consubj_s = \\m,a,p => let 
          vform = case m of {
            ConsecCl => VFConsec p ;
            SubjCl => VFSubjunct p 
          } ;
          pcp = ap_cop_pref vform a RelType ; -- u-
          cop_base = ADV_LAPHA
        in
          case vform of {
            VFIndic _ Neg PresTense => (kho_cop vform a) ++ cop_base;
            VFIndic _ _ _ => pcp ++ cop_base ;
            VFConsec _ => nonExist ; --"*consec" ;
            VFSubjunct _ => nonExist -- "*subjunct"
          } 
    } ;

    is_present_Loc = {
      s = \\c,a,p,t => kho_cop (VFIndic c p t) a ;
      imp_s = table {
        Sg => table {
          Pos => COP_YI++BIND++BA ++ ADV_KHONA ;
          Neg => IMP_NEG_PREF_SG++BIND++BI ++ ADV_KHONA -- this is a guess
        } ;
        Pl => table {
          Pos => COP_YI++BIND++BA++BIND++PL_NI ++ ADV_KHONA ;
          Neg => IMP_NEG_PREF_PL++BIND++BI ++ ADV_KHONA
        }
      } ;
      inf_s = table {
        NFull => table {
          Pos => INF_PREF_FULL++BIND++BA ++ ADV_KHONA ;
          Neg => INF_PREF_FULL++BIND++NEG_NGA++BI ++ ADV_KHONA
        } ;
        NReduced | NPoss => table {
          Pos => INF_PREF_REDUCED++BIND++BA ++ ADV_KHONA ;
          Neg => INF_PREF_REDUCED++BIND++NEG_NGA++BI ++ ADV_KHONA
        } ;
        NLoc => table {
          Pos => LOC_KU++BIND++poss_pron_stem!(Third C15 Sg) ++INF_PREF_FULL++BIND++BA ++ ADV_KHONA ;
          Neg => LOC_KU++BIND++poss_pron_stem!(Third C15 Sg) ++INF_PREF_FULL++BIND++NEG_NGA++BI ++ ADV_KHONA
        }
      } ;
      consubj_s = \\m,a,p => let 
          vform = case m of {
            ConsecCl => VFConsec p ;
            SubjCl => VFSubjunct p 
          } 
        in
          kho_cop vform a
    } ;

    at_which_IAdv np = {
      s = ADV_NGA ++BIND++ atwhichPhiPref!np.agr ++BIND++ ADV_PHI ++ (np.s!NFull) ;
      postIAdv = False
    } ;

    what_IAdv = {s = BIND++ADV_NI ; postIAdv = True } ;

    how_many_IAdj = regAdj "ngaki" ;

    at_the_back_LocAdv = regLocAdv "ngemuva" ;
    behind_LocAdv = regLocAdv "emuva" ;
    on_the_side_LocAdv = regLocAdv "ecaleni" ;
    above_LocAdv = regLocAdv "ngaphezu" ;
    above_2_LocAdv = regLocAdv "ngaphezulu" ;
    on_the_outside_LocAdv = regLocAdv "ngaphandle" ;
    below_LocAdv = regLocAdv "ngaphansi" ;
    yonder_LocAdv = regLocAdv "laphaya" ;

    -- much_Adv = regAdv "kakhulu" ;

    with_ConjN = {
      s = \\r => withPref!r ++BIND ;
      fix = True
    } ;

    together_with_ConjN = {
      s = \\ri => "kanye" ++ withPref!ri ++BIND ;
      fix = True
    } ;

    but_also_ConjN = {
      s = \\ri => "kodwa" ++ withPref!ri ++BIND ;
      fix = True
    } ;

    with_Conj = {
      s = \\r => withPref!r ++BIND ;
      fix = True
    } ;

    and_then_Conj = regConjN "bese" ;

    but_also_Conj = {
      s = \\ri => "kodwa" ++ withPref!ri ++BIND ;
      fix = True
    } ;

    in_comparison_with_Conj = {
      s = \\ri => "ku" ++BIND++ withPref!ri ++BIND ;
      fix = True
    } ;

    while_Conj = regConjN "kanti" ;

    however_Conj = regConjN "kodwa" ;

    where_ConjAdv = { s = "lapho" } ;

    how_IComp = { s = "njani" ; postIComp = False } ; -- -njani
    where_IComp = { s = "phi" ; postIComp = True } ; -- -phi
    how_much_IComp = { s = "ngakanani" ; postIComp = False } ; -- -ngakanani

    different_Enum = enumAdj "mbe" ;
    some_A = regAdj "nye" ;
    one_Enum = enumAdj "nye" ;
}
