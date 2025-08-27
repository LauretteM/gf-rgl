concrete StructuralSBantuZul of StructuralSBantu = CatZul,CatSBantuZul ** open ResZul, Prelude, ParamX, ParadigmsZul in {

  lin

    -- adjective stems
    bad_A = regAdj "bi" ;
    big_A = regAdj "khulu" ;
    many_A = regAdj "ningi" ;
    old_A = regAdj "dala" ;
    beautiful_A = regAdj "hle" ;
    long_A = regAdj "de" ;
    ugly_A = regAdj "bana" ;
    small_A = regAdj "fuphi" ;
    how_much_A = regAdj "ngaki" ;
    other_A = enumAdj "nye" ;
    new_A = variants {} ;
    short_A = variants {} ;
    two_A = regAdj "bili" ;
    three_A = regAdj "thathu" ;
    four_A = regAdj "ne" ;
    five_A = regAdj "hlanu" ;
      
    -- relative stems
    black_R = relAdj "mnyama" ;
    red_R = relAdj "bomvu" ;
    few_R = relAdj "mbalwa" ;
    heavy_R = relAdj "nzima" ;
    honest_R = relAdj "qotho" ;
    nice_R = relAdj "mnandi" ;
    white_R = relAdj "mhlophe" ;
    green_R = variants {} ;
    dangerous_A = relAdj "nengozi" ;
    spotted_R = relAdj "mabalabala" ;
    painful_R = relAdj "buhlungu" ;

    black_R = relAdj "mnyama" ;
    few_R = relAdj "mbalwa" ;
    heavy_R = relAdj "nzima" ;
    honest_R = relAdj "qotho" ;
    nice_R = relAdj "mnandi" ;
    white_R = relAdj "mhlophe" ;
    green_R = variants {} ;
    dangerous_A = relAdj "nengozi" ;
    red_R = relAdj "bomvu" ;
    yellow_R = relAdj "liphuzi" ;
    thin_R = variants {} ;
    how_R = relAdj "njani" ;
    hard_R = relAdj "lukhuni" ;
    thick_R = relAdj "nohlonze" ;
    brown_R = relAdj "nsundu" ;
    grey_R = relAdj "mpungu" ;
    soft_R = relAdj "ntofontofo" ;
    raw_R = relAdj "luhlaza" ;
    crooked_R = variants {} ;
    so_big_R = variants {} ;
    spotted_R = relAdj "mabalabala" ;
    blue_R = relAdj "luhlaza" ;
    classical_R = variants {} ;

    different_Enum = enumAdj "mbe" ; -- zul: mbe; nso: -šele
    some_A = enumAdj "nye" ;
    which_Enum = enumAdj "phi" ; -- nso: -fe
    one_Enum = enumAdj "nye" ; -- nso: -tee
    cruel_Enum = variants {} ; -- nso: -šoro

    -- adverbs

    -- adverbs
    when_Adv = regAdv "nini" ;
    how_Adv = regAdv "njani" ;

    today_Adv = regAdv "namuhla" ;
    yesterday_Adv = regAdv "izolo" ;
    now_Adv = regAdv "manje" ;
    at_night_Adv = regAdv "ebusuku" ;
    tomorrow_Adv = regAdv "ngomuso" ; 
    tomorrow_2_Adv = regAdv "kusasa" ;
    in_winter_Adv = variants {} ; 
    evening_Adv = regAdv "kusihlwa" ; 
    really_Adv = regAdv "bala" ; 
    day_before_yesterday_Adv = regAdv "kuthangi" ;
    always_Adv = regAdv "njalo" ;
    long_ago_Adv = regAdv "kade" ;
    in_the_afternoon_Adv = regAdv "ntambama" ;
	  like_this_Adv = regAdv "njalo " ;
    only_Adv = regAdv "kuphela" ;
    quickly_Adv = regAdv "masinya" ;
    again_Adv = regAdv "kabusha" ;

    -- locative adverbs
    where_LocAdv = regLocAdv "kuphi" ;
    far_LocAdv = regLocAdv "kude" ;
    nearby_LocAdv = regLocAdv "eduze" ;
    across_LocAdv = variants {} ;
    at_the_back_LocAdv = regLocAdv "ngemuva" ;
    behind_LocAdv = regLocAdv "emuva" ;
    on_the_side_LocAdv = regLocAdv "ecaleni" ;
    on_the_outside_LocAdv = regLocAdv "ngaphandle" ;
    above_LocAdv = regLocAdv "ngaphezu" ;
    above_2_LocAdv = regLocAdv "ngaphezulu" ;
    inside_LocAdv = variants {} ;
    below_LocAdv = regLocAdv "ngaphansi" ;
    outside_LocAdv = regLocAdv "phandle" ;
    yonder_LocAdv = regLocAdv "laphaya" ;

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
    it16_Pron = variants {} ;
    it17_Pron = mkPron (Third C17 Sg) ;
    it18_Pron = variants {} ;

    yonder_Quant = {
      s = \\b,a => dem_pron!Dem3!a ;
      dist = Dem3
    } ;

    -- locative class nouns
    below_LocN = regLocN "phansi" ;
    place_LocN = variants {} ;
    above_LocN = regLocN "phezulu" ;
    behind_LocN = variants {} ;
    on_the_other_side_LocN = regLocN "phesheya" ;
    across_LocN = variants {} ;
    outside_LocN = regLocN "phandle" ;
    this_side_LocN = variants {} ;
    in_front_LocN = regLocN "phambili" ;
    ahead_LocN = regLocN "phambi" ;
    forever_LocN = regLocN "phakade" ;
    inside_LocN = regLocN "phakathi" ;
    on_top_LocN = regLocN "phezulu" ;
    central_LocN = variants {} ; -- gare
    elsewhere_LocN  = variants {} ;
    next_to_LocN  = variants {} ;
    under_LocN  = variants {} ;
    far_LocN  = variants {} ;
    near_LocN  = variants {} ;
    long_ago_LocN  = variants {} ;
    home_LocN  = variants {} ;
    ages_ago_LocN  = variants {} ;

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
            VFConsec _ => nonExist ;
            VFSubjunct _ => nonExist
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
            VFConsec _ => nonExist ;
            VFSubjunct _ => nonExist
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
            VFConsec _ => nonExist ;
            VFSubjunct _ => nonExist
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

    there_Loc = {
      s = table {
        MainCl => \\a,p,t => let
          vform = VFIndic MainCl p t ;
          pcp = ap_cop_pref vform a RelType ; -- u-
          cop_base = ADV_LAPHO
        in
          case vform of {
            VFIndic _ Neg PresTense => (kho_cop vform a) ++ cop_base;
            VFIndic _ _ _ => pcp ++ cop_base ;
            VFConsec _ => nonExist ;
            VFSubjunct _ => nonExist
          } ;
        RelCl => \\a,p,t => let
          vform = VFIndic RelCl p t ;
          rcp = (relConcCop vform a RC) ; -- o- / onge-
          pcp = ap_cop_pref vform a RelType ; -- [] / zoba
          cop_base = ADV_LAPHO -- lapha
        in
        case vform of {
          VFIndic _ Neg PresTense => (kho_cop vform a) ++ cop_base;
          VFIndic _ _ _ => rcp ++ pcp ++ cop_base ;
            VFConsec _ => nonExist ;
            VFSubjunct _ => nonExist
        }
      } ;
      imp_s = table {
        Sg => table {
          Pos => COP_YI++BIND++BA ++ ADV_LAPHO ;
          Neg => IMP_NEG_PREF_SG++BIND++BI ++ ADV_LAPHO
        } ;
        Pl => table {
          Pos => COP_YI++BIND++BA++BIND++PL_NI ++ ADV_LAPHO ;
          Neg => IMP_NEG_PREF_PL++BIND++BI ++ ADV_LAPHO
        }
      } ;
      inf_s = table {
        NFull => table {
          Pos => INF_PREF_FULL++BIND++BA ++ ADV_LAPHO ;
          Neg => INF_PREF_FULL++BIND++NEG_NGA++BI ++ ADV_LAPHO
        } ;
        NReduced | NPoss => table {
          Pos => INF_PREF_REDUCED++BIND++BA ++ ADV_LAPHO ;
          Neg => INF_PREF_REDUCED++BIND++NEG_NGA++BI ++ ADV_LAPHO
        } ;
        NLoc => table {
          Pos => LOC_KU++BIND++poss_pron_stem!(Third C15 Sg) ++INF_PREF_FULL++BIND++BA ++ ADV_LAPHO ;
          Neg => LOC_KU++BIND++poss_pron_stem!(Third C15 Sg) ++INF_PREF_FULL++BIND++NEG_NGA++BI ++ ADV_LAPHO
        }
      } ;
      consubj_s = \\m,a,p => let 
          vform = case m of {
            ConsecCl => VFConsec p ;
            SubjCl => VFSubjunct p 
          } ;
          pcp = ap_cop_pref vform a RelType ; -- u-
          cop_base = ADV_LAPHO
        in
          case vform of {
            VFIndic _ Neg PresTense => (kho_cop vform a) ++ cop_base;
            VFIndic _ _ _ => pcp ++ cop_base ;
            VFConsec _ => nonExist ;
            VFSubjunct _ => nonExist
          } 
    } ;

    at_which_IAdv np = {
      s = ADV_NGA ++BIND++ atwhichPhiPref!np.agr ++BIND++ ADV_PHI ++ (np.s!NFull) ;
      postIAdv = False
    } ;

    what_IAdv = {s = BIND++ADV_NI ; postIAdv = True } ;

    how_many_IAdj = regAdj "ngaki" ;

    

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
}
