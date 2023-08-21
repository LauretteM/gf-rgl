concrete StructuralExtZul of StructuralExt = CatZul,CatExtZul ** open ResZul, Prelude, ParamX in {

  lin

    only_QuantStem = {
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
      }
    } ;
    all_QuantStem = {
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
      }
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

    phakathi_LocN = { s = "phakathi" ; empty = [] } ;
    phansi_LocN = { s = "phansi" ; empty = [] } ;
    phesheya_LocN = { s = "phesheya" ; empty = [] } ;
    phandle_LocN = { s = "phandle" ; empty = [] } ;
    phambili_LocN = { s = "phambili" ; empty = [] } ;
    phambi_LocN = { s = "phambi" ; empty = [] } ;
    phakade_LocN = { s = "phakade" ; empty = [] } ;
    phezulu_LocN = { s = "phezulu" ; empty = [] } ;
    phezu_LocN = { s = "phezulu" ; empty = [] } ;

    lapha_Loc = {
      s = table {
        MainCl => \\a,p,t => let
          vform = VFIndic MainCl p t ;
          pcp = ap_cop_pref vform a RelType ; -- u-
          cop_base = "lapha"
        in
          case vform of {
            VFIndic _ Neg PresTense => (kho_cop vform a) ++ cop_base;
            VFIndic _ _ _ => pcp ++ cop_base
          } ;
        RelCl => \\a,p,t => let
          vform = VFIndic RelCl p t ;
          rcp = (relConcCop vform a RC) ; -- o- / onge-
          pcp = ap_cop_pref vform a RelType ; -- [] / zoba
          cop_base = "lapha" -- lapha
        in
        case vform of {
          VFIndic _ Neg PresTense => (kho_cop vform a) ++ cop_base;
          VFIndic _ _ _ => rcp ++ pcp ++ cop_base
        }
      } ;
      imp_s = table {
        Sg => table {
          Pos => "yiba" ++ "lapha" ;
          Neg => "ungabi" ++ "lapha"
        } ;
        Pl => table {
          Pos => "yibani" ++ "lapha" ;
          Neg => "ningabi" ++ "lapha"
        }
      } ;
      inf_s = table {
        NFull => table {
          Pos => "ukuba" ++ "lapha" ;
          Neg => "ukungabi" ++ "lapha"
        } ;
        NReduced | NPoss => table {
          Pos => "kuba" ++ "lapha" ;
          Neg => "kungabi" ++ "lapha"
        } ;
        NLoc => table {
          Pos => "ku"++BIND++poss_pron_stem!(Third C15 Sg) ++"ukuba" ++ "lapha" ;
          Neg => "ku"++BIND++poss_pron_stem!(Third C15 Sg) ++"ukungabi" ++ "lapha"
        }
      }
    } ;

    khona_Loc = {
      s = \\c,a,p,t => kho_cop (VFIndic c p t) a ;
      imp_s = table {
        Sg => table {
          Pos => "yiba" ++ "khona" ;
          Neg => "ungabi" ++ "khona" -- this is a guess
        } ;
        Pl => table {
          Pos => "yibani" ++ "khona" ;
          Neg => "ningabi" ++ "khona"
        }
      } ;
      inf_s = table {
        NFull => table {
          Pos => "ukuba" ++ "khona" ;
          Neg => "ukungabi" ++ "khona"
        } ;
        NReduced | NPoss => table {
          Pos => "kuba" ++ "khona" ;
          Neg => "kungabi" ++ "khona"
        } ;
        NLoc => table {
          Pos => "ku"++BIND++poss_pron_stem!(Third C15 Sg) ++"ukuba" ++ "khona" ;
          Neg => "ku"++BIND++poss_pron_stem!(Third C15 Sg) ++"ukungabi" ++ "khona"
        }
      }
    } ;

    at_which_IAdv np = {
      s = "nga" ++BIND++ atwhichPhiPref!np.agr ++BIND++ "phi" ++ (np.s!NFull) ;
      postIAdv = False
    } ;

    what_IAdv = {s = BIND++"ni" ; postIAdv = True } ;

    how_many_IAdj = regAdj "ngaki" ;

    ngemuva_LocAdv = { s = "ngemuva" ; reqLocS = False } ;
    emuva_LocAdv = { s = "emuva" ; reqLocS = False } ;
    ecaleni_LocAdv = { s = "ecaleni" ; reqLocS = False } ;
    ngaphezu_LocAdv = { s = "ngaphezu" ; reqLocS = False } ;
    ngaphezulu_LocAdv = { s = "ngaphezulu" ; reqLocS = False } ;
    ngaphandle_LocAdv = { s = "ngaphandle" ; reqLocS = False } ;
    ngaphansi_LocAdv = { s = "ngaphansi" ; reqLocS = False } ;

    much_Adv = { s = "kakhulu" ; reqLocS = False } ;

    with_Conj = {
      s = withPref ;
      fix = True
    } ;

    where_ConjN = { s = "lapho" } ;

    how_IComp = { s = "njani" ; postIComp = False } ; -- -njani
    where_IComp = { s = "phi" ; postIComp = True } ; -- -phi
    how_much_IComp = { s = "ngakanani" ; postIComp = False } ; -- -ngakanani
}
