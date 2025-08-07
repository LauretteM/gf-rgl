concrete StructuralSBantuXho of StructuralSBantu = CatXho,CatSBantuXho ** open ResXho, Prelude, ParamX in {

  lin

    only_QuantPron = {
      s = only_QuantPron_table
    } ;
    all_QuantPron = {
      s = all_QuantPron_table
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

    with_Conj = {
      s = \\r => withPref!r ++BIND
    } ;

    with_ConjN = {
      s = \\r => withPref!r ++BIND ;
      fix = True
    } ;

    together_with_Conj = {
      s = \\ri => "kanye" ++ withPref!ri ++BIND
    } ;

    and_then_Conj = {
      s = \\_ => "bese"
    } ;

    but_also_Conj = {
      s = \\ri => "kodwa" ++ withPref!ri ++BIND
    } ;

    in_comparison_with_Conj = {
      s = \\ri => "ku" ++BIND++ withPref!ri ++BIND
    } ;

    while_Conj = {
      s = \\_ => "kanti" 
    } ;

    however_Conj = {
      s = \\_ => "kodwa" 
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
