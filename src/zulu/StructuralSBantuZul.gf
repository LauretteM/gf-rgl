concrete StructuralSBantuZul of StructuralSBantu = CatZul,CatSBantuZul ** open ResZul, Prelude, ParamX in {

  lin

    only_QuantPron = {
      s = table {
        Third C1_2 Sg => "yedwa" ;
        Third C1_2 Pl => "bodwa" ;
        Third C1a_2a Sg => "yedwa" ;
        Third C1a_2a Pl => "bodwa" ;
        Third C3_4 Sg  => "wodwa" ;
        Third C3_4 Pl => "yodwa" ;
        Third C5_6 Sg => "lodwa" ;
        Third C5_6 Pl => "odwa" ;
        Third C7_8 Sg => "sodwa" ;
        Third C7_8 Pl => "zodwa" ;
        Third C9_10 Sg => "yodwa" ;
        Third C9_10 Pl => "zodwa" ;
        Third C11_10 Sg => "lodwa" ;
        Third C11_10 Pl => "zodwa" ;
        Third C9_6 Sg => "yodwa" ;
        Third C9_6 Pl => "odwa" ;
        Third C14 _ => "bodwa" ;
        Third C15 _ => "kodwa" ;
        Third C17 _ => "kodwa" ;
        First Sg => "ngedwa" ;
        First Pl => "sodwa" ;
        Second Sg  => "wedwa" ;
        Second Pl => "nodwa"
      } ;
      lemma = "dwa"
    } ;
    all_QuantPron = {
      s = table {
        Third C1_2 Sg => "wonke" ;
        Third C1_2 Pl => "bonke" ;
        Third C1a_2a Sg => "wonke" ;
        Third C1a_2a Pl => "bonke" ;
        Third C3_4 Sg  => "wonke" ;
        Third C3_4 Pl => "yonke" ;
        Third C5_6 Sg => "lonke" ;
        Third C5_6 Pl => "onke" ;
        Third C7_8 Sg => "sonke" ;
        Third C7_8 Pl => "zonke" ;
        Third C9_10 Sg => "yonke" ;
        Third C9_10 Pl => "zonke" ;
        Third C11_10 Sg => "lonke" ;
        Third C11_10 Pl => "zonke" ;
        Third C9_6 Sg => "yonke" ;
        Third C9_6 Pl => "onke" ;
        Third C14 _ => "bonke" ;
        Third C15 _ => "konke" ;
        Third C17 _ => "konke" ;
        First Sg => "ngenke" ;
        First Pl => "sonke" ;
        Second Sg  => "wenke" ;
        Second Pl => "nonke"
      } ;
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

    inside_LocN = { s = "phakathi" ; empty = [] } ;
    below_LocN = { s = "phansi" ; empty = [] } ;
    on_the_other_side_LocN = { s = "phesheya" ; empty = [] } ;
    outside_LocN = { s = "phandle" ; empty = [] } ;
    in_front_LocN = { s = "phambili" ; empty = [] } ;
    ahead_LocN = { s = "phambi" ; empty = [] } ;
    forever_LocN = { s = "phakade" ; empty = [] } ;
    above_LocN = { s = "phezulu" ; empty = [] } ;
    on_top_LocN = { s = "phezulu" ; empty = [] } ;

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

    at_the_back_LocAdv = { s = "ngemuva" ; reqLocS = False } ;
    behind_LocAdv = { s = "emuva" ; reqLocS = False } ;
    on_the_side_LocAdv = { s = "ecaleni" ; reqLocS = False } ;
    above_LocAdv = { s = "ngaphezu" ; reqLocS = False } ;
    above_2_LocAdv = { s = "ngaphezulu" ; reqLocS = False } ;
    on_the_outside_LocAdv = { s = "ngaphandle" ; reqLocS = False } ;
    below_LocAdv = { s = "ngaphansi" ; reqLocS = False } ;

    much_Adv = { s = "kakhulu" ; reqLocS = False } ;

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

    and_then_Conj = {
      s = \\_ => "bese" ;
      fix = False
    } ;

    but_also_Conj = {
      s = \\ri => "kodwa" ++ withPref!ri ++BIND ;
      fix = True
    } ;

    in_comparison_with_Conj = {
      s = \\ri => "ku" ++BIND++ withPref!ri ++BIND ;
      fix = True
    } ;

    while_Conj = {
      s = \\_ => "kanti" ;
      fix = False
    } ;

    however_Conj = {
      s = \\_ => "kodwa" ;
      fix = False
    } ;

    where_ConjAdv = { s = "lapho" } ;

    how_IComp = { s = "njani" ; postIComp = False } ; -- -njani
    where_IComp = { s = "phi" ; postIComp = True } ; -- -phi
    how_much_IComp = { s = "ngakanani" ; postIComp = False } ; -- -ngakanani

    one_Enum = {
      s = \\_ => "nye" ;
      empty = [] ;
      t = EnumType
    } ;
}
