concrete StructuralExtSsw of StructuralExt = CatSsw,CatExtSsw ** open ResSsw, Prelude, ParamX in {

  lin

    only_QuantStem = {
      s = table {
        Third C1_2 Sg => "yedvwa" ;
        Third C1_2 Pl => "bodvwa" ;
        Third C1a_2a Sg => "yedvwa" ;
        Third C1a_2a Pl => "bodvwa" ;
        Third C3_4 Sg  => "wodvwa" ;
        Third C3_4 Pl => "yodvwa" ;
        Third C5_6 Sg => "lodvwa" ;
        Third C5_6 Pl => "odvwa" ;
        Third C7_8 Sg => "sodvwa" ;
        Third C7_8 Pl => "todvwa" ;
        Third C9_10 Sg => "yodvwa" ;
        Third C9_10 Pl => "todvwa" ;
        Third C11_10 Sg => "lodvwa" ;
        Third C11_10 Pl => "todvwa" ;
        Third C9_6 Sg => "yodvwa" ;
        Third C9_6 Pl => "odvwa" ;
        Third C14 _ => "bodvwa" ;
        Third C15 _ => "kodvwa" ;
        Third C17 _ => "kodvwa" ;
        First Sg => "ngedvwa" ;
        First Pl => "sodvwa" ;
        Second Sg  => "wedvwa" ;
        Second Pl => "nodvwa"
      }
    } ;
    all_QuantStem = {
      s = table {
        Third C1_2 Sg => "wonkhe" ;
        Third C1_2 Pl => "bonkhe" ;
        Third C1a_2a Sg => "wonkhe" ;
        Third C1a_2a Pl => "bonkhe" ;
        Third C3_4 Sg  => "wonkhe" ;
        Third C3_4 Pl => "yonkhe" ;
        Third C5_6 Sg => "lonkhe" ;
        Third C5_6 Pl => "onkhe" ;
        Third C7_8 Sg => "sonkhe" ;
        Third C7_8 Pl => "tonkhe" ;
        Third C9_10 Sg => "yonkhe" ;
        Third C9_10 Pl => "tonkhe" ;
        Third C11_10 Sg => "lonkhe" ;
        Third C11_10 Pl => "tonkhe" ;
        Third C9_6 Sg => "yonkhe" ;
        Third C9_6 Pl => "onkhe" ;
        Third C14 _ => "bonkhe" ;
        Third C15 _ => "konkhe" ;
        Third C17 _ => "konkhe" ;
        First Sg => "ngenkhe" ;
        First Pl => "sonkhe" ;
        Second Sg  => "wenkhe" ;
        Second Pl => "nonkhe"
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
    pheSswu_LocN = { s = "pheSswu" ; empty = [] } ;

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
    ngapheSswu_LocAdv = { s = "ngapheSswu" ; reqLocS = False } ;
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
