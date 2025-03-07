concrete VerbSBantuXho of VerbSBantu = CatXho,CatSBantuXho ** open ResXho, Prelude, ParamX in {

  lin

    CopAP ap = {
      s = case ap.t of {
        AdjType => table {
          MainCl => \\a,p,t,s,l => let
            vform = VFIndic MainCl p t ;
            pcp = ap_cop_pref vform a AdjType ; -- u- / uzoba / ube- / waye- / wayenge-
            adjpref =  adjPref a vform ; -- m-
            cop_base = ap.s!(aformN a) -- khulu
          in
            pcp ++ adjpref ++ cop_base ;
          RelCl => \\a,p,t,s,l => let
            vform = VFIndic RelCl p t ;
            rcp = (adjConcCop vform a RC) ; -- o-
            pcp = ap_cop_pref vform a AdjType ; -- [] / -nge- / zoba / -be- / -benge- -waye- / -wayenge-
            adjpref =  adjPref a vform ; -- m-
            cop_base = ap.s!(aformN a) -- khulu
          in
            rcp ++ pcp ++ adjpref ++ cop_base
        } ;
        RelType => table {
          MainCl => \\a,p,t,s,l => let
            vform = VFIndic MainCl p t ;
            pcp = ap_cop_pref vform a RelType ; -- u-
            cop_base = ap.s!AF1 -- qotho
          in
            pcp ++ cop_base ;
          RelCl => \\a,p,t,s,l => let
            vform = VFIndic RelCl p t ;
            rcp = (relConcCop vform a RC) ; -- o-
            pcp = ap_cop_pref vform a RelType ; -- [] / -nge- / zoba / -benge-
            cop_base = ap.s!AF1 -- qotho
          in
            rcp ++ pcp ++ cop_base
        } ;
        EnumType => table {
          MainCl => \\a,p,t,s,l => let
            vform = VFIndic MainCl p t ;
            pcp = ap_cop_pref vform a EnumType ; -- u-
            cop_base = ap.s!AF1 -- qotho
          in
            pcp ++ cop_base ;
          RelCl => \\a,p,t,s,l => let
            vform = VFIndic RelCl p t ;
            rcp = (enumConc p a) ; -- o-
            pcp = ap_cop_pref vform a EnumType ; -- [] / -nge- / zoba / -benge-
            cop_base = ap.s!AF1 -- qotho
          in
            rcp ++ pcp ++ cop_base
        }
      } ;
      imp_s = table {
        Sg => let
          agr = (Second Sg)
        in table {
          Pos => COP_YI++BIND++BA ++ ap.s!AF1 ;
          Neg => IMP_NEG_PREF_SG++BIND++BI ++ ap.s!AF1
        } ;
        Pl => let
          agr = (Second Pl)
        in table {
          Pos => COP_YI++BIND++BA++BIND++PL_NI ++ ap.s!AF1 ;
          Neg => IMP_NEG_PREF_PL++BIND++BI ++ ap.s!AF1
        }
      } ;
      inf_s = table {
        NFull => table {
          Pos => INF_PREF_FULL++BIND++BA ++ ap.s!AF1 ;
          Neg => INF_PREF_FULL++BIND++NEG_NGA++BI ++ ap.s!AF1
        } ;
        NReduced | NPoss => table {
          Pos => INF_PREF_REDUCED++BIND++BA ++ ap.s!AF1 ;
          Neg => INF_PREF_REDUCED++BIND++NEG_NGA++BI ++ ap.s!AF1
        } ;
        NLoc => table {
          Pos => LOC_KU++BIND++poss_pron_stem!(Third C15 Sg) ++INF_PREF_FULL++BIND++BA ++ ap.s!AF1 ;
          Neg => LOC_KU++BIND++poss_pron_stem!(Third C15 Sg) ++INF_PREF_FULL++BIND++NEG_NGA++BI ++ ap.s!AF1
        }
      } ;
      consubj_s = \\m,a,p => let 
          vform = case m of {
            ConsecCl => VFConsec p ;
            SubjCl => VFSubjunct p 
          } ;
            pcp = ap_cop_pref vform a AdjType ; -- u- / uzoba / ube- / waye- / wayenge-
            adjpref =  case ap.t of {
              AdjType => adjPref a vform ; -- m-
              RelType | EnumType => []
            } ;
            cop_base = ap.s!(aformN a) -- khulu
          in
            pcp ++ adjpref ++ cop_base ;
      comp, iadv, advs = [] ;
      hasComp = True ;
      r = RC ; -- should not be used
      syl = SylMult ;
      vptype = CopDescr
    } ;

    CopNP np = {
      s = table {
        MainCl => \\a,p,t,s,l => let
          vform = VFIndic MainCl p t ;
          pcp = (id_pre_cop_pref vform a) ; -- u- / uzoba / akazukuba
          cp = (id_cop_pref np.agr) ; -- ng-
          cop_base = case np.isPron of {
            False => np.s!NFull ; -- umfundi 
            True => case np.proDrop of {
              True => nonExist ;
              False => np.s!NReduced
            }
          }
        in
          pcp ++ cp ++ cop_base ;
        RelCl => \\a,p,t,s,l => let
          vform = VFIndic RelCl p t ;
          rcp = (relConcCop vform a RC) ; -- o-
          pcp = (id_pre_cop_pref vform a) ; -- [] / zoba / zukuba
          cp = (id_cop_pref np.agr) ; -- ng-
          cop_base = case np.isPron of {
            False => np.s!NFull ; -- umfundi 
            True => case np.proDrop of {
              True => nonExist ;
              False => np.s!NReduced
            }
          }
        in
          rcp ++ pcp ++ cp ++ cop_base
      } ;
      imp_s = table {
        Sg => table {
          Pos => COP_YI++BIND++BA ++ (id_cop_pref np.agr) ++ np.s!NFull ;
          Neg => IMP_NEG_PREF_SG++BIND++BI ++ (id_cop_pref np.agr) ++ np.s!NFull
        } ;
        Pl => table {
          Pos => COP_YI++BIND++BA++BIND++PL_NI ++ (id_cop_pref np.agr) ++ np.s!NFull ;
          Neg => IMP_NEG_PREF_PL++BIND++BI ++ (id_cop_pref np.agr) ++ np.s!NFull
        }
      } ;
      inf_s = table {
          NFull => table {
            Pos => INF_PREF_FULL++BIND++BA ++ np.s!NFull ;
            Neg => INF_PREF_FULL++BIND++NEG_NGA++BI ++ np.s!NFull
          } ;
          NReduced | NPoss => table {
            Pos => INF_PREF_REDUCED++BIND++BA ++ np.s!NFull ;
            Neg => INF_PREF_REDUCED++BIND++NEG_NGA++BI ++ np.s!NFull
          } ;
          NLoc => table {
            Pos => LOC_KU++BIND++poss_pron_stem!(Third C15 Sg) ++INF_PREF_FULL++BIND++BA ++ np.s!NFull ;
            Neg => LOC_KU++BIND++poss_pron_stem!(Third C15 Sg) ++INF_PREF_FULL++BIND++NEG_NGA++BI ++ np.s!NFull
          }
      } ;
      consubj_s = \\m,a,p => let 
          vform = case m of {
            ConsecCl => VFConsec p ;
            SubjCl => VFSubjunct p 
          } ;
            pcp = (id_pre_cop_pref vform a) ; -- u- / uzoba / akazukuba
          cp = (id_cop_pref np.agr) ; -- ng-
          cop_base = case np.isPron of {
            False => np.s!NFull ; -- umfundi 
            True => nonExist -- "*" ++ np.s!NFull
          } 
        in
          pcp ++ cp ++ cop_base ;
      comp, iadv, advs = [] ;
      hasComp = np.heavy ;
      r = RC ; -- should not be used
      syl = SylMult ;
      vptype = CopIdent
    } ;

    CopNPAssoc np = {
      s = table {
        MainCl => \\a,p,t,s,l => let
          vform = VFIndic MainCl p t ;
          pcp = (assoc_pre_cop_pref vform a) ; -- u- / uzoba
          cp = (assoc_cop_pref p np.agr) ; -- ne-
          cop_base = np.s!NReduced -- moto
        in
          pcp ++ cp ++ cop_base ;
        RelCl => \\a,p,t,s,l => let
          vform = VFIndic RelCl p t ;
          rcp = (relConcCop vform a RC) ; -- o-
          pcp = (assoc_pre_cop_pref vform a) ; -- [] / zoba
          cp = (assoc_cop_pref p np.agr) ; -- ne
          cop_base = np.s!NReduced -- moto
        in
          rcp ++ pcp ++ cp ++ cop_base
      } ;
      imp_s = let
        cop = (assoc_cop_pref Pos np.agr) ++ np.s!NReduced
      in table {
        Sg => table {
          Pos => COP_YI++BIND++BA ++ cop ;
          Neg => IMP_NEG_PREF_SG++BIND++BI ++ cop
        } ;
        Pl => table {
          Pos => COP_YI++BIND++BA++BIND++PL_NI ++ cop ;
          Neg => IMP_NEG_PREF_PL++BIND++BI ++ cop
        }
      } ;
      inf_s = table {
          NFull => table {
            Pos => INF_PREF_FULL++BIND++BA ++ (assoc_cop_pref Pos np.agr) ++ np.s!NReduced ;
            Neg => INF_PREF_FULL++BIND++NEG_NGA++BI ++ (assoc_cop_pref Pos np.agr) ++ np.s!NReduced
          } ;
          NReduced | NPoss => table {
            Pos => INF_PREF_REDUCED++BIND++BA ++ (assoc_cop_pref Pos np.agr) ++ np.s!NReduced ;
            Neg => INF_PREF_REDUCED++BIND++NEG_NGA++BI ++ (assoc_cop_pref Pos np.agr) ++ np.s!NReduced
          } ;
          NLoc => table {
            Pos => LOC_KU++BIND++poss_pron_stem!(Third C15 Sg) ++INF_PREF_FULL++BIND++BA ++ (assoc_cop_pref Pos np.agr) ++ np.s!NReduced ;
            Neg => LOC_KU++BIND++poss_pron_stem!(Third C15 Sg) ++INF_PREF_FULL++BIND++NEG_NGA++BI ++ (assoc_cop_pref Pos np.agr) ++ np.s!NReduced
          }
      } ;
      consubj_s = \\m,a,p => let 
          vform = case m of {
            ConsecCl => VFConsec p ;
            SubjCl => VFSubjunct p 
          } ;
          pcp = (assoc_pre_cop_pref vform a) ; -- u- / uzoba
          cp = (assoc_cop_pref p np.agr) ; -- ne-
          cop_base = np.s!NReduced -- moto
        in
          pcp ++ cp ++ cop_base ;
      comp, iadv, advs = [] ;
      hasComp = np.heavy ;
      r = RC ; -- should not be used
      syl = SylMult ;
      vptype = CopAssoc
    } ;

    CopNPEq np = {
      s = table {
        MainCl => \\a,p,t,s,l => let
          vform = VFIndic MainCl p t ;
          pcp = (assoc_pre_cop_pref vform a) ; -- u- / uzoba
          cp = (eq_cop_pref p np.agr) ; -- ne-
          cop_base = np.s!NReduced -- moto
        in
          pcp ++ cp ++ cop_base ;
        RelCl => \\a,p,t,s,l => let
          vform = VFIndic RelCl p t ;
          rcp = (relConcCop vform a RC) ; -- o-
          pcp = (assoc_pre_cop_pref vform a) ; -- [] / zoba
          cp = (eq_cop_pref p np.agr) ; -- ne
          cop_base = np.s!NReduced -- moto
        in
          rcp ++ pcp ++ cp ++ cop_base
      } ;
      imp_s = let
        cop = (eq_cop_pref Pos np.agr) ++ np.s!NReduced
      in table {
        Sg => table {
          Pos => COP_YI++BIND++BA ++ cop ;
          Neg => IMP_NEG_PREF_SG++BIND++BI ++ cop
        } ;
        Pl => table {
          Pos => COP_YI++BIND++BA++BIND++PL_NI ++ cop ;
          Neg => IMP_NEG_PREF_PL++BIND++BI ++ cop
        }
      } ;
      inf_s = table {
          NFull => table {
            Pos => INF_PREF_FULL++BIND++BA ++ (eq_cop_pref Pos np.agr) ++ np.s!NReduced ;
            Neg => INF_PREF_FULL++BIND++NEG_NGA++BI ++ (eq_cop_pref Pos np.agr) ++ np.s!NReduced
          } ;
          NReduced | NPoss => table {
            Pos => INF_PREF_REDUCED++BIND++BA ++ (eq_cop_pref Pos np.agr) ++ np.s!NReduced ;
            Neg => INF_PREF_REDUCED++BIND++NEG_NGA++BI ++ (eq_cop_pref Pos np.agr) ++ np.s!NReduced
          } ;
          NLoc => table {
            Pos => LOC_KU++BIND++poss_pron_stem!(Third C15 Sg) ++INF_PREF_FULL++BIND++BA ++ (assoc_cop_pref Pos np.agr) ++ np.s!NReduced ;
            Neg => LOC_KU++BIND++poss_pron_stem!(Third C15 Sg) ++INF_PREF_FULL++BIND++NEG_NGA++BI ++ (assoc_cop_pref Pos np.agr) ++ np.s!NReduced
          }
      } ;
      consubj_s = \\m,a,p => let 
          vform = case m of {
            ConsecCl => VFConsec p ;
            SubjCl => VFSubjunct p 
          } ;
          pcp = (assoc_pre_cop_pref vform a) ; -- u- / uzoba
          cp = (eq_cop_pref p np.agr) ; -- ne-
          cop_base = np.s!NReduced -- moto
        in
          pcp ++ cp ++ cop_base ;
      comp, iadv, advs = [] ;
      hasComp = np.heavy ;
      r = RC ; -- should not be used
      syl = SylMult ;
      vptype = CopAssoc
    } ;

    CopNPEqSize np = {
      s = table {
        MainCl => \\a,p,t,s,l => let
          vform = VFIndic MainCl p t ;
          pcp = (assoc_pre_cop_pref vform a) ; -- u- / uzoba
          cp = (eq_size_cop_pref p np.agr) ; -- ne-
          cop_base = np.s!NReduced -- moto
        in
          pcp ++ cp ++ cop_base ;
        RelCl => \\a,p,t,s,l => let
          vform = VFIndic RelCl p t ;
          rcp = (relConcCop vform a RC) ; -- o-
          pcp = (assoc_pre_cop_pref vform a) ; -- [] / zoba
          cp = (eq_size_cop_pref p np.agr) ; -- ne
          cop_base = np.s!NReduced -- moto
        in
          rcp ++ pcp ++ cp ++ cop_base
      } ;
      imp_s = let
        cop = (eq_size_cop_pref Pos np.agr) ++ np.s!NReduced
      in table {
        Sg => table {
          Pos => COP_YI++BIND++BA ++ cop ;
          Neg => IMP_NEG_PREF_SG++BIND++BI ++ cop
        } ;
        Pl => table {
          Pos => COP_YI++BIND++BA++BIND++PL_NI ++ cop ;
          Neg => IMP_NEG_PREF_PL++BIND++BI ++ cop
        }
      } ;
      inf_s = table {
          NFull => table {
            Pos => INF_PREF_FULL++BIND++BA ++ (eq_size_cop_pref Pos np.agr) ++ np.s!NReduced ;
            Neg => INF_PREF_FULL++BIND++NEG_NGA++BI ++ (eq_size_cop_pref Pos np.agr) ++ np.s!NReduced
          } ;
          NReduced | NPoss => table {
            Pos => INF_PREF_REDUCED++BIND++BA ++ (eq_size_cop_pref Pos np.agr) ++ np.s!NReduced ;
            Neg => INF_PREF_REDUCED++BIND++NEG_NGA++BI ++ (eq_size_cop_pref Pos np.agr) ++ np.s!NReduced
          } ;
          NLoc => table {
            Pos => LOC_KU++BIND++poss_pron_stem!(Third C15 Sg) ++INF_PREF_FULL++BIND++BA ++ (assoc_cop_pref Pos np.agr) ++ np.s!NReduced ;
            Neg => LOC_KU++BIND++poss_pron_stem!(Third C15 Sg) ++INF_PREF_FULL++BIND++NEG_NGA++BI ++ (assoc_cop_pref Pos np.agr) ++ np.s!NReduced
          }
      } ;
      consubj_s = \\m,a,p => let 
          vform = case m of {
            ConsecCl => VFConsec p ;
            SubjCl => VFSubjunct p 
          } ;
          pcp = (assoc_pre_cop_pref vform a) ; -- u- / uzoba
          cp = (eq_size_cop_pref p np.agr) ; -- ne-
          cop_base = np.s!NReduced -- moto
        in
          pcp ++ cp ++ cop_base ;
      comp, iadv, advs = [] ;
      hasComp = np.heavy ;
      r = RC ; -- should not be used
      syl = SylMult ;
      vptype = CopAssoc
    } ;

    UseVStative v = {
      s = \\c,a,p,t,s,l => let
          vform = VFIndic c p t ;
          vpref = verb_prefix_stative vform a v.r v.syl ;
          r = v.s!(rform_stative vform) ;
          yo = case l of {
            True => relSuf vform s ;
            False => []
          }
        in vpref ++ r ++ yo ;
      imp_s = table {
        Sg => table {
          Pos => case v.syl of {
            SylMono => nonExist ; -- "*" ++ "yi"++BIND++v.s!R_a ;
            SylMult => nonExist -- "*" ++ v.s!R_a
          } ;
          Neg => nonExist --"*" ++ IMP_NEG_PREF_SG ++BIND++ v.s!R_i
        } ;
        Pl => table {
          Pos => case v.syl of {
            SylMono => nonExist ; --"*" ++ "yi"++BIND++v.s!R_a ++BIND++"ni" ;
            SylMult => nonExist --"*" ++ v.s!R_a ++BIND++"ni"
          } ;
          Neg => nonExist --"*" ++ IMP_NEG_PREF_PL ++BIND++ v.s!R_i
        }
      } ;
      inf_s = table {
        NFull => table {
          Pos => INF_PREF_FULL ++BIND++ v.s!R_ile ;
          Neg => INF_PREF_FULL ++BIND++ NEG_NGA ++BIND++ v.s!R_i
        } ;
        NReduced | NPoss => table {
          Pos => INF_PREF_REDUCED ++BIND++ v.s!R_ile ;
          Neg => INF_PREF_REDUCED ++BIND++ NEG_NGA ++BIND++ v.s!R_i
        } ;
        NLoc => table {
          Pos => LOC_E ++BIND++ INF_PREF_REDUCED++BIND++v.s!R_e ++BIND++ ADV_NI ;
          Neg => LOC_E ++BIND++ INF_PREF_REDUCED++BIND++NEG_NGA++BIND++v.s!R_e ++BIND++ ADV_NI
        }
      } ;
      consubj_s = \\m,a,p => let 
          vform = case m of {
            ConsecCl => VFConsec p ;
            SubjCl => VFSubjunct p 
          } ;
          vpref = verb_prefix_stative vform a v.r v.syl ;
          r = v.s!(rform vform False)
        in vpref ++ r ;
      iadv, advs, comp = [] ;
      hasComp = False ;
      r = v.r ;
      syl = v.syl ;
      vptype = NoComp
    } ;

    ComplV2Nonspec v2 np = let
      oc = objConc np.agr v2.r v2.syl ;
      longform = case np.heavy of {
        True => False ;
        False => True
      }
    in {
      s = table {
        MainCl => \\a,p,t,s,l => let
          vform = VFIndic MainCl p t ;
          vpref_no_oc = verb_prefix_no_oc vform l v2.r a s v2.syl ;
          vpref_with_oc = verb_prefix_with_oc vform l v2.r a s v2.syl ;
          r = v2.s!(rform (VFIndic MainCl p t) longform) ;
          obj = case p of {
            Pos => np.s!NFull ;
            Neg => np.s!NReduced
          } ;
        in case np.proDrop of {
          True => vpref_with_oc ++ oc ++ r ++ obj ;
          False => vpref_no_oc ++ r ++ obj
        } ;
        RelCl => \\a,p,t,s,l => let
          vform = (VFIndic RelCl p t) ;
          vpref_no_oc = verb_prefix_no_oc vform l v2.r a s v2.syl ;
          vpref_with_oc = verb_prefix_with_oc vform l v2.r a s v2.syl ;
          r = v2.s!(rform vform longform) ;
          obj = case p of {
            Pos => np.s!NFull ;
            Neg => np.s!NReduced
          } ;
        in case np.proDrop of {
          True => vpref_with_oc ++ oc ++ r ++ obj ;
          False => vpref_no_oc ++ r ++ obj
        }
      } ;
      imp_s = let
        obj_full = np.s!NFull ;
        obj_red = np.s!NReduced
      in table {
        Sg => table {
          Pos => case np.proDrop of {
            True => oc ++ v2.s!R_e ++ obj_full ;
            False => v2.s!R_a ++ obj_full
          } ;
          Neg => case np.proDrop of {
            True => IMP_NEG_PREF_SG ++BIND++ oc ++ v2.s!R_i ++ obj_red ;
            False => IMP_NEG_PREF_SG ++BIND++ v2.s!R_i ++ obj_red
          }
        } ;
        Pl => table {
          Pos => case np.proDrop of {
            True => oc ++ v2.s!R_e ++BIND++PL_NI ++ obj_full ;
            False => v2.s!R_a ++BIND++PL_NI ++ obj_full
          } ;
          Neg => case np.proDrop of {
            True => IMP_NEG_PREF_PL ++BIND++ oc ++ v2.s!R_i ++ obj_red ;
            False => IMP_NEG_PREF_PL ++BIND++ v2.s!R_i ++ obj_red
          }
        }
      } ;
      inf_s = let
        inf_oc = case np.proDrop of {
          True => oc ;
          False => []
        } ;
        obj_full = np.s!NFull ;
        obj_red = np.s!NReduced
      in
      table {
        NFull => table {
          Pos => INF_PREF_FULL ++BIND++ inf_oc ++ v2.s!R_a ++ obj_full ;
          Neg => INF_PREF_FULL ++BIND++ NEG_NGA ++BIND++ inf_oc ++ v2.s!R_i ++ obj_red
        } ;
        NReduced | NPoss => table {
          Pos => INF_PREF_REDUCED ++BIND++ inf_oc ++ v2.s!R_a ++ obj_full ;
          Neg => INF_PREF_REDUCED ++BIND++ NEG_NGA ++BIND++ inf_oc ++ v2.s!R_i ++ obj_red
        } ;
        NLoc => table {
          Pos => LOC_KU++BIND++poss_pron_stem!(Third C15 Sg) ++ INF_PREF_FULL++BIND++inf_oc ++ v2.s!R_a ++ obj_full ;
          Neg => LOC_KU++BIND++poss_pron_stem!(Third C15 Sg) ++ INF_PREF_FULL++BIND++NEG_NGA++BIND++inf_oc ++ v2.s!R_a ++ obj_red
        }
      } ;
      consubj_s = \\m,a,p => let 
          vform = case m of {
            ConsecCl => VFConsec p ;
            SubjCl => VFSubjunct p 
          } ;
          vpref_no_oc = verb_prefix_no_oc vform False v2.r a Null v2.syl ;
          vpref_with_oc = verb_prefix_with_oc vform False v2.r a Null v2.syl ;
          r = v2.s!(rform vform False) ;
          obj = case p of {
            Pos => np.s!NFull ;
            Neg => np.s!NReduced
          } ;
        in case np.proDrop of {
          True => vpref_with_oc ++ oc ++ r ++ obj ;
          False => vpref_no_oc ++ r ++ obj
        } ;
      iadv, advs, comp = [] ;
      ap_comp = \\_ => [] ;
      hasComp = np.heavy ;
      r = v2.r ;
      syl = v2.syl ;
      vptype = VNPCompl
    } ;

    CopLocative loc = {
      s = \\c,a,p,t,s,l => loc.s!c!a!p!t ;
      imp_s = loc.imp_s ;
      inf_s = loc.inf_s ;
      consubj_s = loc.consubj_s ;
      comp,advs,iadv = [] ;
      hasComp = True ;
      r = RC ;
      syl = SylMult ;
      vptype = CopLoc
    } ;

    UseVRefl v2 = let
      longform = True ;
    in {
      s = table {
        MainCl => \\a,p,t,s,l => let
          vform = (VFIndic MainCl p t) ;
          vpref_with_oc = verb_prefix_with_oc vform True v2.r a s v2.syl ;
          r = v2.s!(rform (VFIndic MainCl p t) l) ; -- bona / boni
        in
          vpref_with_oc ++ REFL_PRON ++BIND ++ r  ;
        RelCl => \\a,p,t,s,l => let
          vform = (VFIndic RelCl p t) ;
          vpref_with_oc = verb_prefix_with_oc vform True v2.r a s v2.syl ;
          r = v2.s!(rform vform l) ; -- bona / boni
          suf = case l of {
            True => relSuf vform s ;
            False => []
          } ;
        in
          vpref_with_oc ++ REFL_PRON ++BIND ++ r ++ suf 
      } ;
      imp_s = table {
        Sg => table {
          Pos => REFL_PRON ++BIND ++ v2.s!R_e  ;
          Neg => IMP_NEG_PREF_SG ++BIND++ REFL_PRON ++BIND ++ v2.s!R_i 
        } ;
        Pl => table {
          Pos => REFL_PRON ++BIND ++ v2.s!R_e ++BIND++PL_NI  ;
          Neg => IMP_NEG_PREF_PL ++BIND++ REFL_PRON ++BIND ++ v2.s!R_i 
        }
      } ;
      inf_s = table {
        NFull => table {
          Pos => INF_PREF_FULL ++BIND++ REFL_PRON ++BIND ++ v2.s!R_a  ;
          Neg => INF_PREF_FULL ++BIND++ NEG_NGA ++BIND++ REFL_PRON ++BIND ++ v2.s!R_i 
        } ;
        NReduced | NPoss => table {
          Pos => INF_PREF_REDUCED ++BIND++ REFL_PRON ++BIND ++ v2.s!R_a  ;
          Neg => INF_PREF_REDUCED ++BIND++ NEG_NGA ++BIND++ REFL_PRON ++BIND ++ v2.s!R_i 
        } ;
        NLoc => table {
          Pos => INF_PREF_REDUCED++BIND++poss_pron_stem!(Third C15 Sg) ++ INF_PREF_FULL++BIND++REFL_PRON ++BIND ++ v2.s!R_a ;
          Neg => INF_PREF_REDUCED++BIND++poss_pron_stem!(Third C15 Sg) ++ INF_PREF_FULL++BIND++NEG_NGA++BIND++REFL_PRON ++BIND ++ v2.s!R_a 
        }
      } ;
      consubj_s = \\m,a,p => let 
          vform = case m of {
            ConsecCl => VFConsec p ;
            SubjCl => VFSubjunct p 
          } ;
          vpref_no_oc = verb_prefix_no_oc vform False v2.r a Null v2.syl ;
          vpref_with_oc = verb_prefix_with_oc vform False v2.r a Null v2.syl ;
          r = v2.s!(rform vform False) ; -- bona / boni
        in
          vpref_with_oc ++ REFL_PRON ++BIND ++ r ;
      iadv, advs, comp = [] ;
      ap_comp = \\_ => [] ;
      hasComp = False ;
      r = v2.r ;
      syl = v2.syl ;
      vptype = VNPCompl
    } ;

    ComplV2Light v2 np = let
      oc = objConc np.agr v2.r v2.syl ;
      longform = case np.heavy of {
        True => False ;
        False => True
      } ;
      obj = np.s!NFull
    in {
      s = table {
        MainCl => \\a,p,t,s,l => let
          vform = (VFIndic MainCl p t) ;
          vpref_with_oc = verb_prefix_with_oc vform l v2.r a s v2.syl ;
          r = v2.s!(rform (VFIndic MainCl p t) l) ; -- bona / boni
        in vpref_with_oc ++ oc ++ r ++ obj ;
        RelCl => \\a,p,t,s,l => let
          vform = (VFIndic RelCl p t) ;
          vpref_with_oc = verb_prefix_with_oc vform l v2.r a s v2.syl ;
          oc = objConc np.agr v2.r v2.syl ; -- [] / m -
          longform = case np.heavy of {
            True => False ;
            False => True
          } ;
          r = v2.s!(rform vform l) ; -- bona / boni
          suf = case l of {
            True => relSuf vform s ;
            False => []
          } ;
        in vpref_with_oc ++ oc ++ r ++ suf ++ obj 
      } ;
      imp_s = table {
        Sg => table {
          Pos => oc ++ v2.s!R_e ++ obj ;
          Neg => IMP_NEG_PREF_SG ++BIND++ oc ++ v2.s!R_i ++ obj 
        } ;
        Pl => table {
          Pos => oc ++ v2.s!R_e ++BIND++PL_NI ++ obj ;
          Neg => IMP_NEG_PREF_PL ++BIND++ oc ++ v2.s!R_i ++ obj
        }
      } ;
      inf_s = let
        inf_oc = oc 
      in
      table {
        NFull => table {
          Pos => INF_PREF_FULL ++BIND++ inf_oc ++ v2.s!R_a ++ obj ;
          Neg => INF_PREF_FULL ++BIND++ NEG_NGA ++BIND++ inf_oc ++ v2.s!R_i ++ obj
        } ;
        NReduced | NPoss => table {
          Pos => INF_PREF_REDUCED ++BIND++ inf_oc ++ v2.s!R_a ++ obj ;
          Neg => INF_PREF_REDUCED ++BIND++ NEG_NGA ++BIND++ inf_oc ++ v2.s!R_i ++ obj
        } ;
        NLoc => table {
          Pos => INF_PREF_REDUCED++BIND++poss_pron_stem!(Third C15 Sg) ++ INF_PREF_FULL++BIND++inf_oc ++ v2.s!R_a ++ obj ;
          Neg => INF_PREF_REDUCED++BIND++poss_pron_stem!(Third C15 Sg) ++ INF_PREF_FULL++BIND++NEG_NGA++BIND++inf_oc ++ v2.s!R_a ++ obj
        }
      } ;
      consubj_s = \\m,a,p => let 
          vform = case m of {
            ConsecCl => VFConsec p ;
            SubjCl => VFSubjunct p 
          } ;
          vpref_with_oc = verb_prefix_with_oc vform False v2.r a Null v2.syl ;
          r = v2.s!(rform vform False) ; -- bona / boni
        in vpref_with_oc ++ oc ++ r ++ obj ;
      iadv, advs, comp = [] ;
      ap_comp = \\_ => [] ;
      hasComp = False ;
      r = v2.r ;
      syl = v2.syl ;
      vptype = VNPCompl
    } ;

    ComplV2Refl v2 np = let
      longform = case np.heavy of {
        True => False ;
        False => True
      } ;
      obj = np.s!NFull
    in {
      s = table {
        MainCl => \\a,p,t,s,l => let
          vform = (VFIndic MainCl p t) ;
          vpref_with_oc = verb_prefix_with_oc vform l v2.r a s v2.syl ;
          r = v2.s!(rform (VFIndic MainCl p t) l) ; -- bona / boni
        in
          vpref_with_oc ++ REFL_PRON ++BIND ++ r ++ obj ;
        RelCl => \\a,p,t,s,l => let
          vform = (VFIndic RelCl p t) ;
          vpref_with_oc = verb_prefix_with_oc vform l v2.r a s v2.syl ;
          r = v2.s!(rform vform l) ; -- bona / boni
          suf = case l of {
            True => relSuf vform s ;
            False => []
          } ;
        in
          vpref_with_oc ++ REFL_PRON ++BIND ++ r ++ suf ++ obj
      } ;
      imp_s = table {
        Sg => table {
          Pos => REFL_PRON ++BIND ++ v2.s!R_e ++ obj ;
          Neg => IMP_NEG_PREF_SG ++BIND++ REFL_PRON ++BIND ++ v2.s!R_i ++ obj
        } ;
        Pl => table {
          Pos => REFL_PRON ++BIND ++ v2.s!R_e ++BIND++PL_NI ++ obj ;
          Neg => IMP_NEG_PREF_PL ++BIND++ REFL_PRON ++BIND ++ v2.s!R_i ++ obj
        }
      } ;
      inf_s = table {
        NFull => table {
          Pos => INF_PREF_FULL ++BIND++ REFL_PRON ++BIND ++ v2.s!R_a ++ obj ;
          Neg => INF_PREF_FULL ++BIND++ NEG_NGA ++BIND++ REFL_PRON ++BIND ++ v2.s!R_i ++ obj
        } ;
        NReduced | NPoss => table {
          Pos => INF_PREF_REDUCED ++BIND++ REFL_PRON ++BIND ++ v2.s!R_a ++ obj ;
          Neg => INF_PREF_REDUCED ++BIND++ NEG_NGA ++BIND++ REFL_PRON ++BIND ++ v2.s!R_i ++ obj
        } ;
        NLoc => table {
          Pos => INF_PREF_REDUCED++BIND++poss_pron_stem!(Third C15 Sg) ++ INF_PREF_FULL++BIND++REFL_PRON ++BIND ++ v2.s!R_a ++ obj ;
          Neg => INF_PREF_REDUCED++BIND++poss_pron_stem!(Third C15 Sg) ++ INF_PREF_FULL++BIND++NEG_NGA++BIND++REFL_PRON ++BIND ++ v2.s!R_a ++ obj
        }
      } ;
      consubj_s = \\m,a,p => let 
          vform = case m of {
            ConsecCl => VFConsec p ;
            SubjCl => VFSubjunct p 
          } ;
          vpref_no_oc = verb_prefix_no_oc vform False v2.r a Null v2.syl ;
          vpref_with_oc = verb_prefix_with_oc vform False v2.r a Null v2.syl ;
          r = v2.s!(rform vform False) ; -- bona / boni
        in
          vpref_with_oc ++ REFL_PRON ++BIND ++ r ++ obj ;
      iadv, advs, comp = [] ;
      ap_comp = \\_ => [] ;
      hasComp = np.heavy ;
      r = v2.r ;
      syl = v2.syl ;
      vptype = VNPCompl
    } ;

    AdvVPLight vp adv = vp ** {
      advs = vp.advs ++ adv.s ;
      hasComp = False
    } ;

    CopPoss np = {
      s = table {
        MainCl => \\a,p,t,s,l => let
          vform = VFIndic MainCl p t ;
          pcp = (id_pre_cop_pref vform a) ; -- u- / uzoba / akazukuba
          cop_base = poss_concord_agr!(Third C17 Sg) ++BIND++ np.s!NPoss -- utshani
        in
          pcp ++ cop_base ;
        RelCl => \\a,p,t,s,l => let
          vform = VFIndic RelCl p t ;
          rcp = (relConcCop vform a RC) ; -- o-
          pcp = (id_pre_cop_pref vform a) ; -- [] / zoba / zukuba
          cop_base = poss_concord_agr!(Third C17 Sg) ++BIND++ np.s!NPoss -- utshani
        in
          rcp ++ pcp ++ cop_base
      } ;
      imp_s = let
        cop = poss_concord_agr!(Third C17 Sg) ++BIND++ np.s!NPoss
      in table {
        Sg => table {
          Pos => COP_YI++BIND++BA ++ cop ;
          Neg => IMP_NEG_PREF_SG++BIND++BI ++ cop
        } ;
        Pl => table {
          Pos => COP_YI++BIND++BA++BIND++PL_NI ++ cop ;
          Neg => IMP_NEG_PREF_PL++BIND++BI ++ cop
        }
      } ;
      inf_s = let
        cop = poss_concord_agr!(Third C17 Sg) ++BIND++ np.s!NPoss
      in table {
          NFull => table {
            Pos => INF_PREF_FULL++BIND++BA ++ cop ;
            Neg => INF_PREF_FULL++BIND++NEG_NGA++BI ++ cop
          } ;
          NReduced | NPoss => table {
            Pos => INF_PREF_REDUCED++BIND++BA ++ cop ;
            Neg => INF_PREF_REDUCED++BIND++NEG_NGA++BI ++ cop
          } ;
          NLoc => table {
            Pos => "ku"++BIND++poss_pron_stem!(Third C15 Sg) ++INF_PREF_FULL++BIND++BA ++ cop ;
            Neg => "ku"++BIND++poss_pron_stem!(Third C15 Sg) ++INF_PREF_FULL++BIND++NEG_NGA++BI ++ cop
          }
      } ;
      consubj_s = \\m,a,p => let 
          vform = case m of {
            ConsecCl => VFConsec p ;
            SubjCl => VFSubjunct p 
          } ;
          pcp = (id_pre_cop_pref vform a) ; -- u- / uzoba / akazukuba
          cop_base = poss_concord_agr!(Third C17 Sg) ++BIND++ np.s!NPoss -- utshani
        in
          pcp ++ cop_base ;
      comp, iadv, advs = [] ;
      hasComp = np.heavy ;
      r = RC ; -- should not be used
      syl = SylMult ;
      vptype = CopIdent
    } ;

    CopQuant qs = {
      s = table {
          MainCl => \\a,p,t,s,l => let
            vform = VFIndic MainCl p t ;
            pcp = ap_cop_pref vform a RelType ; -- u-
            cop_base = qs.s!a -- qotho
          in
            pcp ++ cop_base ;
          RelCl => \\a,p,t,s,l => let
            vform = VFIndic RelCl p t ;
            rcp = (quantConcCop vform a) ; -- o-
            pcp = ap_cop_pref vform a RelType ; -- [] / -nge- / zoba / -benge-
            cop_base = qs.s!a -- qotho
          in
            rcp ++ pcp ++ cop_base
      } ;
      imp_s = let
        imp_vform = VFIndic MainCl Pos PresTense
      in table {
        Sg => let
          agr = (Second Sg)
        in table {
          Pos => COP_YI++BIND++BA ++ qs.s!agr ;
          Neg => IMP_NEG_PREF_SG++BIND++BI ++ qs.s!agr
        } ;
        Pl => let
          agr = (Second Pl)
        in table {
          Pos => COP_YI++BIND++BA++BIND++PL_NI ++ qs.s!agr ;
          Neg => IMP_NEG_PREF_PL++BIND++BI ++ qs.s!agr
        }
      } ;
      inf_s = table {
        NFull => table {
          Pos => INF_PREF_FULL++BIND++BA ++ qs.s!(Third C15 Sg) ;
          Neg => INF_PREF_FULL++BIND++NEG_NGA++BI ++ qs.s!(Third C15 Sg)
        } ;
        NReduced | NPoss => table {
          Pos => INF_PREF_REDUCED++BIND++BA ++ qs.s!(Third C15 Sg) ;
          Neg => INF_PREF_REDUCED++BIND++NEG_NGA++BI ++ qs.s!(Third C15 Sg)
        } ;
        NLoc => table {
          Pos => LOC_KU++BIND++poss_pron_stem!(Third C15 Sg) ++INF_PREF_FULL++BIND++BA ++ qs.s!(Third C15 Sg) ;
          Neg => LOC_KU++BIND++poss_pron_stem!(Third C15 Sg) ++INF_PREF_FULL++BIND++NEG_NGA++BI ++ qs.s!(Third C15 Sg)
        }
      } ;
      consubj_s = \\m,a,p => let 
          vform = case m of {
            ConsecCl => VFConsec p ;
            SubjCl => VFSubjunct p 
          } ;
          pcp = ap_cop_pref vform a RelType ; -- u-
          cop_base = qs.s!a -- qotho
          in
            pcp ++ cop_base ;
      comp, iadv, advs = [] ;
      hasComp = True ;
      r = RC ; -- should not be used
      syl = SylMult ;
      vptype = CopDescr
    } ;

    -- ComplVAux vaux vp = {
    --     s = vp.s ;
    --     perfSuff = vp.perfSuff ;
    --     suff = vp.suff ;
    --     oc = vp.oc ;
    --     comp = vp.comp ;
    --     iadv = vp.iadv ;
    --     advs = vp.advs ;
    --     hasComp = vp.hasComp ;
    --     r = vp.r ;
    --     syl = vp.syl ;
    --     asp = vp.asp ;
    --     asp_pref = vp.asp_pref ;
    --     vptype = vp.vptype ;
    --     comp_agr = vp.comp_agr ;
    --     ap_comp = vp.ap_comp ;
    --     aux_root = vaux.s ;
    --     hasAux = True
    -- } ;

}
